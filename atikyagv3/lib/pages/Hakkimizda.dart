import 'package:flutter/material.dart';
import '../components/header.dart';

class HakkimizdaPage extends StatelessWidget {
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
                  header("Hakkımızda", context),
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
                        Image.asset("assets/images/hakkimizda.png"),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Vizyon",
                          style: TextStyle(
                              color: Color(0xFF0A1034),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                            "\t\t\t\t\t Uluslararası ISO standartları ve entegre yönetim sistemleri çerçevesinde faaliyet gösteren, geri dönüşüm teknolojileri kuruluşlarından biri olarak, sağlıklı ve temiz çevrede yaşaması hedefini gerçekleştirmeyi amaçlamaktadır.\n\t\t\t\t\t Geri dönüşüm firmalarından biri olarak YAĞ ATIKLARIN GERİ DÖNÜŞÜMÜ ve ilgili konulardaki tüm hizmet ve faaliyetlerimizde çevrenin korunması amacıyla,çevre yönetim sistemimizi ulusal ve uluslararası mevzuatlara uygun şekilde, resmi kurumlarla, sivil toplum kuruluşlarıyla ve diğer paydaşlarımızla iletişim ve işbirliği içinde geliştirip koruyacağımızı, TAAHHÜT EDERİZ."),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Misyon",
                          style: TextStyle(
                              color: Color(0xFF0A1034),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                            "\t\t\t\t\t % 100 müşteri memnuniyeti ilkesi, sürekli kendini geliştirip yenileyen Ar-Ge departmanı ve yüksek çevre bilinciyle, sınırlı doğal kaynaklarımızı korumak ve yaptığı üretimlerle ekonomimize katma değer sağlama misyonlarını taşımaktadır."),
                        SizedBox(
                          height: 10,
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
