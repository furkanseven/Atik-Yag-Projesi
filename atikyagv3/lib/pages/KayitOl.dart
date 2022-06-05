import 'package:atikyagv3/pages/GirisYap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

/// Email / Şifre ile kayıt sayfası
class KayitOlPage extends StatefulWidget {
  @override
  _KayitOlPageState createState() => _KayitOlPageState();
}

class _KayitOlPageState extends State<KayitOlPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text("Kayıt Ol"),
      ),
      body: Form(
        key: _formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //? E-Mail
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: "E-Mail"),
                    validator: (String mail) {
                      if (mail.isEmpty) {
                        return "Lütfen bir mail yazın";
                      }
                      return null;
                    },
                  ),
                  //? Şifre
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: "Şifre"),
                    validator: (String password) {
                      if (password.isEmpty) {
                        return "Lütfen bir şifre yazın";
                      }
                      return null;
                    },
                    obscureText: true, //! Şifrenin görünmesini engeller.
                  ),
                  //? Kayıt ol buttonu
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    alignment: Alignment.center,
                    child: SignInButtonBuilder(
                      icon: Icons.person_add,
                      backgroundColor: Colors.blueGrey,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                        "Kullanıcı kaydınız oluşturuldu.\nMail adresiniz ve şifreniz ile giriş yapabilirsiniz."),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        GirisYapPage()));
                                          },
                                          child: Text("Tamam")),
                                    ],
                                  ));
                          _register();
                        }
                      },
                      text: "Kayıt ol",
                    ),
                  ),
                  //? Geri bildirim
                  Container(
                    alignment: Alignment.center,
                    child: Text(_success == null ? '' : _message ?? ''),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //! Widget kapatıldığında controllerları temizle
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    try {
      //bu  geri bize userCredantial döndürüyor o yüzden userCredantiala eşitleyebiliriz
      //bunula user ı almış oluruz.
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      //bu user ı ekrana basmak için tanımladık hoşgeldiniz vs
      final User user = userCredential.user;
      if (user != null) {
        setState(() {
          _message = "Kayıt Başarılı!\nMerhaba, ${user.email}";
          _success = true;
        });
      } else {
        setState(() {
          _message = "Hata Oldu Sanırım";
          _success = false;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
