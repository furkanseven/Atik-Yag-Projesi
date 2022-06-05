import 'package:atikyagv3/SPManager.dart';
import 'package:atikyagv3/components/header.dart';
import 'package:atikyagv3/main.dart';
import 'package:atikyagv3/pages/AuthTypeSelector.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KullaniciBilgileriPage extends StatelessWidget {
  TextEditingController adresController = TextEditingController();
  TextEditingController adController = TextEditingController();
  TextEditingController soyadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference adreslerRef =
        FirebaseFirestore.instance.collection('adresler');
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerKullaniciBilgileri("Kullanıcı Bilgileri", context),
                    buildMenuCikisYap("Çıkış Yap", context),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 24,
                            offset: Offset(0, 16),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Kullanıcı Mailiniz : ${FirebaseAuth.instance.currentUser.email}",
                              style: TextStyle(
                                  color: Color(0xFF0A1034),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          /*Container(
                            child: Text(
                              "Adınız : ${adController.text}",
                              style: TextStyle(
                                  color: Color(0xFF0A1034),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Soyadınız : ${soyadController.text}",
                              style: TextStyle(
                                  color: Color(0xFF0A1034),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),*/
                          SizedBox(
                            height: 16,
                          ),
                          Form(
                            child: Column(
                              children: [
                                Text(
                                  "Adınız :",
                                  style: TextStyle(
                                      color: Color(0xFF0A1034),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextFormField(
                                  controller: adController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF4E944F),
                                            width: 3)),
                                    labelText: "\tAdınız",
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Soyadınız :",
                                  style: TextStyle(
                                      color: Color(0xFF0A1034),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextFormField(
                                  controller: soyadController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF4E944F),
                                            width: 3)),
                                    labelText: "\tSoyadınız",
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Adres Bilginiz :",
                                  style: TextStyle(
                                      color: Color(0xFF0A1034),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextFormField(
                                  controller: adresController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF4E944F),
                                            width: 3)),
                                    labelText: "\t\t\tAdres Bilginiz...",
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 40),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              child: Text("Kaydet"),
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Kayıt Başarılı."),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  SPManager spManager =
                                                      SPManager();

                                                  spManager
                                                      .setLoginStatus(true);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyHomePage()));
                                                },
                                                child: Text("Tamam")),
                                          ],
                                        ));
                                Map<String, dynamic> adresData = {
                                  'adresbilgisi': adresController.text,
                                  'ad': adController.text,
                                  'soyad': soyadController.text,
                                };
                                //Firebase e yollama metodu
                                //veriyi yazmak istediğim yerdeki referansa ulaşmam gerekiyor
                                //yeni bir döküman olduğu için öyle bir referans yok,firebase te oluşturmak gerekyor
                                //fakatveriyi yazacağımız kolekseiyonun bir referansı var
                                //widget build altında oluşturdupum ''CollectionReference adreslerRef'' tanımlamıştık

                                FirebaseFirestore firestore =
                                    FirebaseFirestore.instance;
                                await adreslerRef
                                    .doc(
                                        FirebaseAuth.instance.currentUser.email)
                                    .set(adresData);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 22, 158, 92),
                                padding: EdgeInsets.all(10.0),
                                elevation: 15,
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

buildMenuCikisYap(String title, BuildContext context) {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Builder(
      builder: (context) => ElevatedButton.icon(
          icon: Icon(
            Icons.login,
            color: Colors.red,
          ),
          label: Text("ÇIKIŞ YAP"),
          onPressed: () async {
            await _auth.signOut();
            Scaffold.of(context).showBottomSheet((context) => Text(
                  "Başarıyla Çıkış Yapıldı",
                  style: TextStyle(backgroundColor: Colors.red),
                ));
            //Push ile PushReplacement farkı bir önceki sayfayanın üstüne yazar
            //Geriye gitme şansı olmaz.
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AuthTypeSelector(),
              ),
            );
          }),
    ),
  );
}
