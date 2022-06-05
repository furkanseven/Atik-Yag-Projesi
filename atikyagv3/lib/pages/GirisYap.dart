import 'package:atikyagv3/SPManager.dart';
import 'package:atikyagv3/main.dart';
import 'package:atikyagv3/pages/KullaniciBilgileri.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class GirisYapPage extends StatefulWidget {
  @override
  _GirisYapPageState createState() => _GirisYapPageState();
}

class _GirisYapPageState extends State<GirisYapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("Giriş Yap"),
      ),
      body: _GirisYapBody(),
    );
  }
}

class _GirisYapBody extends StatefulWidget {
  @override
  __GirisYapBodyState createState() => __GirisYapBodyState();
}

class __GirisYapBodyState extends State<_GirisYapBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          //? Email / Şifre ile giriş
          _EmailPasswordForm(),
        ],
      ),
    );
  }
}

class _EmailPasswordForm extends StatefulWidget {
  @override
  __EmailPasswordFormState createState() => __EmailPasswordFormState();
}

class __EmailPasswordFormState extends State<_EmailPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //? Bilgi
                Container(
                  child: Text(
                    "Email ve Şifre ile Giriş Yap",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment.center,
                ),
                //? E-Mail
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: "E-Mail"),
                  validator: (String mail) {
                    if (mail.trim().isEmpty) return "Lütfen bir mail yazın";
                    return null;
                  },
                ),
                //? Şifre
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: "Şifre"),
                  validator: (String password) {
                    if (password.isEmpty) return "Lütfen bir şifre yazın";
                    return null;
                  },
                  obscureText: true, //! Şifrenin görünmesini engeller.
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  alignment: Alignment.center,
                  child: SignInButton(Buttons.Email,
                      text: "E-mail İle Giriş Yap", onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _girisYap();
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//giriş yapmak için kullandığım fonks.
//firebase e bu bilgileri göndermiş oluyruz
//bu bilgilere sahip kullanıcı varsa gerie userCredential dondurecek.
//bunu user a atıyoruz.
  void _girisYap() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      final User user = userCredential.user;
      SPManager spManager = SPManager();

      Future<bool> result = spManager.getLoginStatus();

      result.then((bool value) {
        if (value) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => KullaniciBilgileriPage(),
            ),
          );
        }
      });

      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => KullaniciBilgileriPage(),
      //    ),
      //  );

      Scaffold.of(context).showBottomSheet((context) => Text(
            "Giriş Başarılı\Hoşgeldin ${user.email}",
            style: TextStyle(
                backgroundColor: Colors.green,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ));
    } catch (e) {
      print(e.toString());
    }
  }
}

class _GirisYapProvider extends StatefulWidget {
  final String infoText;
  final Buttons buttonType;
  final Function GirisYapMethod;

  const _GirisYapProvider({
    Key key,
    @required this.infoText,
    @required this.buttonType,
    @required this.GirisYapMethod,
  }) : super(key: key);

  @override
  __GirisYapProviderState createState() => __GirisYapProviderState();
}

class __GirisYapProviderState extends State<_GirisYapProvider> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                widget.infoText,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.center,
            ),
            Container(
              padding: const EdgeInsets.only(top: 16.0),
              alignment: Alignment.center,
              child: SignInButton(
                widget.buttonType,
                text: widget.infoText,
                onPressed: () async => widget.GirisYapMethod(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
