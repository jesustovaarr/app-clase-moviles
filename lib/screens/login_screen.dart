import 'package:dmsn/config/email_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  EmailAuth? _emailAuth;
  final conEmail = TextEditingController();
  final conPwd = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailAuth = EmailAuth();
  }

  @override
  Widget build(BuildContext context) {
    final txtUser = TextFormField(
      controller: conEmail,
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
    final txtPwd = TextFormField(
      controller: conPwd,
      decoration: InputDecoration(border: OutlineInputBorder()),
      obscureText: true,
    );

    final loading = Positioned(top: 150, child: CircularProgressIndicator());

    final btnLogin = ElevatedButton(
      onPressed: () {
        isLoading = !isLoading;
        setState(() {});
        // Future.delayed(
        //   Duration(seconds: 4)
        // ).then ((value) {
        //    Navigator.pushNamed(context, "/dashboard");
        //    isLoading = false;
        //    setState(() {});
        //    });
        _emailAuth!.loginUser(email: conEmail.text, password: conPwd.text).then(
          (value) {
            if (value) {
              Navigator.pushNamed(context, "/dashboard");
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Usuario o contraseña incorrectos'),
                  duration: Duration(seconds: 3),
                ),
              );
            }
            isLoading = false;
            setState(() {});
          },
        );
      },
      child: Row(children: [Icon(Icons.login), Text('Iniciar Sesión')]),
    );

    final space2 = SizedBox(height: 5);

    final btnRegister = TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/register");
      },
      child: Text('¿No tienes cuenta? Regístrate aquí'),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/theme_login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset('assets/marvel.png', height: 150),
            Positioned(
              bottom: 50,
              child: Container(
                padding: EdgeInsets.all(20),
                height: 270,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0x99FFFFFF),
                ),
                child: Column(
                  children: [
                    txtUser,
                    Divider(),
                    txtPwd,
                    space2,
                    btnLogin,
                    btnRegister,
                  ],
                ),
              ),
            ),
            isLoading ? loading : Container(),
          ],
        ),
      ),
    );
  }
}
