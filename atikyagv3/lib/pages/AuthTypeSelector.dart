import 'package:atikyagv3/pages/GirisYap.dart';
import 'package:atikyagv3/pages/KayitOl.dart';
import 'package:atikyagv3/pages/KullaniciBilgileri.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';

class AuthTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranY = ekranBilgisi.size.height;
    final double ekranG = ekranBilgisi.size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/girisekrani.png"),
              fit: BoxFit.fill,
            )),
          ),
          //? Kayıt Ol Buttonu
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ekranY / 2.7,
                ),
                Container(
                  child: SignInButtonBuilder(
                    icon: Icons.person_add,
                    backgroundColor: Colors.indigo,
                    text: "Kayıt Ol",
                    height: 50,
                    width: 120,
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => KayitOlPage(),
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                ),

                //? Giriş Yap Buttonu
                Container(
                  child: SignInButtonBuilder(
                    icon: Icons.verified_user,
                    backgroundColor: Colors.orange,
                    text: "Giriş Yap",
                    height: 50,
                    width: 120,
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            FirebaseAuth.instance.currentUser == null
                                ? GirisYapPage()
                                : KullaniciBilgileriPage(),
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
