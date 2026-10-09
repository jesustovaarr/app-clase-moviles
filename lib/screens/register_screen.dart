import 'package:dmsn/config/email_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final conEmail = TextEditingController();
  final conPwd = TextEditingController();
  EmailAuth? _emailAuth;

  @override
  void initState() {
    super.initState();
    _emailAuth = EmailAuth();
  }

  @override
  Widget build(BuildContext context) {
    final txtEmail = TextFormField(
      controller: conEmail,
      decoration: const InputDecoration(
        labelText: 'Correo electrónico',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
    );

    final txtPwd = TextFormField(
      controller: conPwd,
      decoration: const InputDecoration(
        labelText: 'Contraseña',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
      ),
      obscureText: true,
    );

    final space = const SizedBox(
      height: 10,
    );

    final btnRegister = ElevatedButton(
      onPressed: () {
        _emailAuth!.createUser(email: conEmail.text, password: conPwd.text).then((value) {
          if (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Se registró correctamente el usuario'),
                duration: Duration(seconds: 3)
                ),
            );
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error al registrar el usuario'),
                duration: Duration(seconds: 3)
                ),
            );
          }
        },);
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person_add),
          SizedBox(width: 8),
          Text('Registrarse'),
        ],
      ),
    );

    final btnBack = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('¿Ya tienes cuenta? Inicia sesión'),
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
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0x99FFFFFF),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(),
                    txtEmail,
                    space,
                    txtPwd,
                    space,
                    btnRegister,
                    btnBack,
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
