import 'package:atikyagv3/components/header.dart';
import 'package:atikyagv3/pages/AuthTypeSelector.dart';
import 'package:atikyagv3/pages/BizeUlasin.dart';
import 'package:atikyagv3/pages/Hakkimizda.dart';
import 'package:atikyagv3/pages/KullaniciBilgileri.dart';
import 'package:atikyagv3/pages/NasilKullanilir.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE9EFC0),
        body: SafeArea(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Header
                  headerMenu("Menü", context),
                  SizedBox(height: 16),
                  //kategoriler
                  buildMenuKullaniciBilgileri("Kullanıcı Bilgileri", context),
                  buildMenuHakkimizda("Hakkımızda", context),
                  buildMenuNasilKullanilir("Nasıl Kullanılır", context),
                  buildMenuBizeUlasin("Bize Ulaşın", context),
                  buildMenuCikisYap("Çıkış Yap", context),
                ],
              ),
            ),
          ]),
        ));
  }

  buildMenuCikisYap(String title, BuildContext context) {
    return Builder(
      builder: (context) => IconButton(
          icon: Icon(Icons.login),
          color: Colors.red,
          iconSize: 38,
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
    );
  }

  Widget buildMenuHakkimizda(String title, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HakkimizdaPage()));
      },
      child: Container(
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.only(bottom: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.50),
                blurRadius: 4,
                offset: Offset(0, 4)),
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0A1034),
          ),
        ),
      ),
    );
  }

  Widget buildMenuNasilKullanilir(String title, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NasilKullanilirPage()));
      },
      child: Container(
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.only(bottom: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.50),
                blurRadius: 4,
                offset: Offset(0, 4)),
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0A1034),
          ),
        ),
      ),
    );
  }

  Widget buildMenuBizeUlasin(String title, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BizeUlasinPage()));
      },
      child: Container(
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.only(bottom: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.50),
                blurRadius: 4,
                offset: Offset(0, 4)),
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0A1034),
          ),
        ),
      ),
    );
  }

  Widget buildMenuKullaniciBilgileri(String title, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => KullaniciBilgileriPage()));
      },
      child: Container(
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.only(bottom: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.50),
                blurRadius: 4,
                offset: Offset(0, 4)),
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0A1034),
          ),
        ),
      ),
    );
  }
}
