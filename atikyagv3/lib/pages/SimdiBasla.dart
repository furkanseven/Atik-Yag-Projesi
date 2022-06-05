import 'package:atikyagv3/components/header.dart';
import 'package:atikyagv3/main.dart';
import 'package:atikyagv3/pages/Buckets.firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimdiBasla extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SimdiBaslaState();
  }
}

class SimdiBaslaState extends State<SimdiBasla> {
  TextEditingController litreController = TextEditingController();
  int puan;
  puanHesapla() {
    puan = int.parse(litreController.text);
    puan *= 10;
    print("Çevre Puanı : ${puan}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EFC0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              headerSimdiBasla("Yağ Biriktir", context),
              icerikBanner(context),
              SizedBox(
                height: 10.0,
              ),
              buildLitreMiktariVeEkle(context),
              //buildEkle(context),
              SizedBox(height: 10),
              SizedBox(
                height: 10,
              ),
              adimlarBanner(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget puanDatabaseEkle() {
    String pid;
    int toplam;
    CollectionReference puanRef =
        FirebaseFirestore.instance.collection('puanBilgileri');
    Map<String, dynamic> puanData = {
      'Çevre Puanı': puan,
    };
    //Çevre Puan bilgisini database yazdırıyorum.
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    puanRef
        .doc(FirebaseAuth.instance.currentUser.email)
        .collection(FirestoreBuckets.Puan)
        .doc(pid)
        .set(puanData);
  }

  Widget buildLitreMiktariVeEkle(BuildContext context) {
    CollectionReference litreRef =
        FirebaseFirestore.instance.collection('litreBilgileri');
    return Form(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: litreController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF4E944F), width: 3)),
                  labelText: "Birikitirdiğiniz Yağın Litre Miktarı"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: ElevatedButton(
                child: Text("Ekle"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("Atık Yağınız Eklendi."),
                            actions: [
                              TextButton(
                                  onPressed: () async {
                                    puanHesapla();
                                    puanDatabaseEkle();
                                    Map<String, dynamic> litreData = {
                                      'litreBilgisi': litreController.text,
                                    };
                                    FirebaseFirestore firestore =
                                        FirebaseFirestore.instance;
                                    await litreRef
                                        .doc(FirebaseAuth
                                            .instance.currentUser.email)
                                        .collection(FirestoreBuckets.Litre)
                                        .doc()
                                        .set(litreData);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                  },
                                  child: Text("Tamam")),
                            ],
                          ));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 22, 158, 92),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                  elevation: 15,
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget adimlarBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Color(0xFF83BD75),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: 105,
              width: 105,
              child: Image.asset("assets/images/1.png")),
          SizedBox(
              height: 105,
              width: 105,
              child: Image.asset("assets/images/2.png")),
          SizedBox(
              height: 105,
              width: 105,
              child: Image.asset("assets/images/3.png")),
        ],
      ),
    );
  }

  Widget icerikBanner(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranY = ekranBilgisi.size.height;
    final double ekranG = ekranBilgisi.size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: Color(0xFFB4E197),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          SizedBox(
            child: Image.asset("assets/images/YagSiseleri.png"),
            height: ekranY / 5,
            width: ekranG / 1.2,
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
