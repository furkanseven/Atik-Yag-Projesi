import 'package:atikyagv3/pages/SimdiBasla.dart';
import 'package:atikyagv3/pages/Subcollection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Buckets.firestore.dart';

class Anasayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EFC0),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildBaslik(),
                buildBanner(),
                buildIcerik(context),
                cevrePuani(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget litreBilgisi(BuildContext context) {
  return ElevatedButton(
    child: Text(
      "Biriktirilen Yağ Miktarı",
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ReadSubcollection()));
    },
    style: ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 235, 231, 27),
      padding: EdgeInsets.all(10.0),
      elevation: 15,
      textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildBaslik() {
  return Padding(
    padding: const EdgeInsets.only(top: 40.0),
    child: Text(
      "Anasayfa",
      style: TextStyle(
        fontSize: 28,
        color: Color(0xFF0A1034),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildBanner() {
  return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Container(
        width: double.infinity, //soldan sağdan alanın tamamını kaplar
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Color(0xFF22577E),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Merhaba",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Atık yağlarımızı biriktirelim, geleceğimizi kurtaralım.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              child: Image.asset("assets/images/geridonusum.png"),
              height: 39,
              width: 39,
            ),
          ],
        ),
      ));
}

Widget buildIcerik(BuildContext context) {
  ReadSubcollection readSubcollection = ReadSubcollection();
  return Padding(
      padding: EdgeInsets.only(
        top: 10.0,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 18.0,
          bottom: 20.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF5584AC),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  child: Image.asset("assets/images/atikyag.png"),
                  height: 115,
                  width: 190,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Şimdiye kadar Litre atık yağ biriktirdin.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  child: Text("Şimdi Başla !"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SimdiBasla()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 22, 158, 92),
                    padding: EdgeInsets.all(10.0),
                    elevation: 15,
                    textStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                litreBilgisi(context),
              ],
            ),
          ],
        ),
      ));
}

Widget cevrePuani() {
  CollectionReference litreRef =
      FirebaseFirestore.instance.collection('litreBilgileri');

  var litrePuani = FirebaseFirestore.instance
      .collection(FirestoreBuckets.litreBilgileri)
      .doc(FirebaseAuth.instance.currentUser.email)
      .collection(FirestoreBuckets.Litre)
      .snapshots()
      .listen((data) => data.docs);
  return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(0xFF5584AC),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Image.asset("assets/images/cevrePuani.png"),
              height: 55,
              width: 55,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  "Yağları Biriktir Puanları Kazan !",
                  style: TextStyle(
                      color: Color.fromARGB(255, 243, 211, 70),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ));
}
