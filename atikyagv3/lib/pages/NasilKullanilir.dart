import 'package:atikyagv3/pages/Anasayfa.dart';
import 'package:atikyagv3/pages/SimdiBasla.dart';
import 'package:flutter/material.dart';
import '../components/header.dart';

class NasilKullanilirPage extends StatelessWidget {
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
                  header("Nasıl Kullanılır", context),
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
                        SizedBox(
                          child:
                              Image.asset("assets/images/nasilkullanilir.jpg"),
                          height: 207,
                          width: 300,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Geri Dönüşüm Yaptıkça Ödül Kazan !",
                          style: TextStyle(
                              color: Color(0xFF0A1034),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                            "\t\t\t\t\tYeni çevre hareketi ile karbon ayak izini azaltırken ödüller kazanmak senin elinde. Uygulamayı ücretsiz indir hediyelerin sahibi ol!"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Çevreyi Korurken Nasıl Ödül Kazanırım ?",
                          style: TextStyle(
                              color: Color(0xFF0A1034),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                            "\t\t\t\t\t- Şimdi Başla butonuna basarak kaç litre atık yağ birktirdiğinizi ekrana girin ve tamam butonuna basın. Atık yağ biriktirdikçe puan kazanın ve bu puanla ücretsiz yağ kazanın !\n\t\t\t\t\t-İsterseniz harita ekranından size yakın atık yağ toplama noktasına bakarak ve atık yağlarınızı getirebilirsiniz."),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          child: Text("Şimdi Başla !"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SimdiBasla()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 22, 158, 92),
                            padding: EdgeInsets.all(10.0),
                            elevation: 15,
                            textStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
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
