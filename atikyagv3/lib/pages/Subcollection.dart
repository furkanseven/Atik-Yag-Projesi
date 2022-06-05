import 'package:atikyagv3/pages/Buckets.firestore.dart';
import 'package:atikyagv3/pages/Fields.firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReadSubcollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biriktirilen Yağ Bilgisi"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(FirestoreBuckets.litreBilgileri)
              .doc(FirebaseAuth.instance.currentUser.email)
              .collection(FirestoreBuckets.Litre)
              .snapshots(),
          builder: (__,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              print("Toplam Döküman: ${snapshot.data.docs.length}");
              if (snapshot.data.docs.isNotEmpty) {
                return ListView.separated(
                    itemBuilder: (___, int index) {
                      Map<String, dynamic> docData =
                          snapshot.data.docs[index].data();
                      if (docData.isEmpty) {
                        return SizedBox(
                            child: Text(
                          "Litre bilgisi boş",
                          textAlign: TextAlign.center,
                        ));
                      }
                      var subLitre = docData[FirestoreFields.YagLitre];
                      //LİTRE BİLGİLERİNİ BASTIRDIM
                      /*
                      FirebaseFirestore.instance
                          .collection(FirestoreBuckets.litreBilgileri)
                          .doc(FirebaseAuth.instance.currentUser.email)
                          .collection(FirestoreBuckets.Litre)
                          .snapshots()
                          .listen((data) => data.docs
                              .forEach((doc) => print(doc['litreBilgisi'])));*/

                      return ListTile(
                        title: Text("Eklenen Litre miktarı :"),
                        subtitle: Text(subLitre.toString()),
                      );
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
