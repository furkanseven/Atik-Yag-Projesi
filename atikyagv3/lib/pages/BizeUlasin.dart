import 'package:atikyagv3/pages/Anasayfa.dart';
import 'package:flutter/material.dart';
import '../components/header.dart';

class BizeUlasinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header("Bize Ulaşın", context),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                      children: [
                        Image.asset("assets/images/bizeulasin.png"),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "İlgili öneri, istek ve görüşlerinizi dinlemeye hazırız.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 62, 100),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                            "\t\t\t\t\tMüşteri temsilcilerimiz (mesai saatleri içerisinde) en kısa sürede sizinle iletişime geçecektir.İlginiz için teşekkür ederiz."),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                      "assets/images/iconTelephone.png"),
                                ),
                                Text("0(555)-555-55-55"),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  child:
                                      Image.asset("assets/images/iconMail.png"),
                                ),
                                Text("info@atikyag.com.tr"),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                      "assets/images/iconLocation.png"),
                                ),
                                Text(
                                    "Evliya Çelebi Yerleşkesi, \nMerkez/KÜTAHYA"),
                              ],
                            ),
                          ],
                        ),
                        //formGonder(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
