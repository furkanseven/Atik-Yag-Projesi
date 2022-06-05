import 'package:atikyagv3/pages/Buckets.firestore.dart';
import 'package:atikyagv3/pages/PuanDatabase.dart';
import 'package:atikyagv3/pages/SimdiBasla.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/header.dart';
import 'Fields.firestore.dart';

class OdulPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EFC0),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerOdul("Ödül", context),
                buildIcerik(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildBaslik() {
  return Padding(
    padding: const EdgeInsets.only(top: 50.0),
    child: Text(
      "Ödül",
      style: TextStyle(
        fontSize: 26,
        color: Color(0xFF0A1034),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildIcerik(BuildContext context) {
  PuanDatabase puanDatabase = PuanDatabase();
  return Padding(
      padding: EdgeInsets.only(
        top: 15.0,
      ),
      child: Container(
        width: double.infinity, //soldan sağdan alanın tamamını kaplar
        padding: EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 18.0,
          bottom: 34.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF0143F6B),
          borderRadius: BorderRadius.circular(6),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  child: Image.asset("assets/images/odul256.png"),
                  height: 300, //380
                  width: 150, //230
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 45),
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Puanlarımı Gör",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PuanDatabase()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 22, 158, 92),
                      padding: EdgeInsets.all(1.0),
                      elevation: 15,
                      textStyle:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ],
        ),
      ));
}
