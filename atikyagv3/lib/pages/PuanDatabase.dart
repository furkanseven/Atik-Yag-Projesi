import 'package:atikyagv3/pages/Buckets.firestore.dart';
import 'package:atikyagv3/pages/Fields.firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PuanDatabase extends StatelessWidget {
  int toplamPuan = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PUAN BİLGİSİ"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(FirestoreBuckets.puanBilgileri)
              .doc(FirebaseAuth.instance.currentUser.email)
              .collection(FirestoreBuckets.Puan)
              .snapshots(),
          builder: (__,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              print("Toplam Puan Adedi: ${snapshot.data.docs.length}");
              if (snapshot.data.docs.isNotEmpty) {
                return ListView.separated(
                    itemBuilder: (___, int index) {
                      Map<String, dynamic> docData =
                          snapshot.data.docs[index].data();
                      //Burda değeri alıyorum sayısal ama (10) olarak geliyor,parantezli int yapısında gelmiyor
                      /*print("Litre Değerleri = > ${snapshot.data.docs[index].data().values}");*/
                      //

                      //Burda map yapıdaki değeri inte çevirdim
                      int eklenenLitre = snapshot.data.docs[index]
                          .data()
                          .values
                          .fold(0, (sum, element) => sum + element);
                      print("EKLENEN LİTRE PUANI : ${eklenenLitre}");
                      toplamPuan += eklenenLitre;
                      print("TOPLAM LİTRE PUANI: ${toplamPuan}");
                      //

                      if (docData.isEmpty) {
                        return SizedBox(
                            child: Text(
                          "Puan Bilgisi Boş",
                          textAlign: TextAlign.center,
                        ));
                      }
                      var subLitre = docData[FirestoreFields.cevrePuani];
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  child:
                                      Image.asset("assets/images/odul256.png"),
                                  height: 280, //380
                                  width: 130, //230
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("En Son Toplam Puanınız : ${toplamPuan}"),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                      /*
                      return ListTile(
                        title: Text("Biriktirilen Puan :"),
                        subtitle: Text(subLitre.toString()),
                      );*/
                    },
                    separatorBuilder: (___, ____) {
                      return const Divider();
                    },
                    itemCount: snapshot.data.docs.length);
              } else {
                return Center(
                  child: Text("BİLGİ YOK"),
                );
              }
            } else {
              return Center(
                child: Text("Bilgi Yok"),
              );
            }
          },
        ),
      ),
    );
  }
}
