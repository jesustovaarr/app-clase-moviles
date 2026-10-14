import 'package:dmsn/screens/notes_screen_nube.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dmsn/components/global_values.dart';
import 'package:dmsn/components/theme_app.dart';
import 'package:dmsn/firebase_options.dart';
import 'package:dmsn/screens/add_note_screen.dart';
import 'package:dmsn/screens/dashboard_screen.dart';
import 'package:dmsn/screens/login_screen.dart';
import 'package:dmsn/screens/notes_screen.dart';
import 'package:dmsn/screens/register_screen.dart';


void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
  }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: GlobalValues.banTheme,
      builder: (context,value,_) {

        ThemeData tema= ThemeData.light();
        switch(value){
          case 0:tema=ThemeData.dark(); break;

          case 1:tema=ThemeData.light(); break;

          case 2:tema=ThemeApp.warmTheme();

        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: tema,
          home: LoginScreen(),
          routes: {
            "/dashboard":(context) => DashboardScreen(),
            "/note":(context) => NotesScreen(),
            "/add":(context) => AddNoteScreen(),
            "/register":(context) => const RegisterScreen(),
            "/notesNube":(context) => NotesScreenNube()
          },
        );
      }
    );
  }
}