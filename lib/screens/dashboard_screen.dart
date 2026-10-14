import 'package:dmsn/components/menu_circular.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Jesus'), 
              accountEmail: Text("shusho@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
              ),
              ListTile(
                title: Text('Practica 1'),
                subtitle: Text('App de practica'),
                leading: Icon(Icons.youtube_searched_for),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                title: Text('Lista de notas'),
                subtitle: Text('App Notes'),
                leading: Icon(Icons.note),
                trailing: Icon(Icons.chevron_right),
                onTap: (){
                  Navigator.pushNamed(context, '/note');
                },
              ),
              ListTile(
                title: Text('Lista de notas en la nube'),
                subtitle: Text('App Notes Cloud'),
                leading: Icon(Icons.note),
                trailing: Icon(Icons.chevron_right),
                onTap: (){
                  Navigator.pushNamed(context, '/notesNube');
                },
              ),
              ListTile(
                title: Text('Cerrar sesión'),
                subtitle: Text('Salir'),
                leading: Icon(Icons.logout),
                trailing: Icon(Icons.chevron_right),
                onTap: (){
                  //Navigator.pop(context);
                  //Navigator.pop(context);
                  //Navigator.popUntil(context, ModalRoute.withName('/login'))
                  Navigator.pushReplacementNamed(context, '/');
                  },
              ),
              
          ],
        ),
      ), //End
      floatingActionButton:menuCircular(),
    );
  }
}