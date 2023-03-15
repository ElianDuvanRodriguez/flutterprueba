import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'View/Registro.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }

}

class Home extends StatefulWidget {
  @override
  HomeStart createState() => HomeStart();
}

class HomeStart extends State<Home> {
  TextEditingController nombre = TextEditingController();
  TextEditingController contrasena = TextEditingController();

  validarDatos() async {
    try {
      CollectionReference ref= FirebaseFirestore.instance.collection('Usuarios');
      QuerySnapshot usuarios= await ref.get();

      if (usuarios.docs.length !=0){
        for (var cursor in usuarios.docs) {
          if (cursor.get('NombreUsuario') == nombre.text) {
            print('Usuario Encontrado');
            print(cursor.get('NombreUsuario'));
            print(cursor.get('IdentificacionUsuario'));

            if(cursor.get('Contraseña') == contrasena.text){
              print('********* Acceso Aceptado ********');
            }else{
              print('***Contraseña incorrecta***');
            }
          }
        }

      } else {
        print('No hay documentos en la colección');
      }
    } catch (e) {
      print('Error.....' + e.toString());
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenidos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('img/img.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nombre,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Usuario',
                      hintText: 'Digite su Usuario'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: contrasena,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Password Usuario',
                      hintText: 'Digite password de Usuario'),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    print('contrasena original ${contrasena.text}');
                    contrasena.text = sha1.convert(utf8.encode(contrasena.text)).toString();

                    validarDatos();
                    print('contrasena encriptada ${contrasena.text}');
                    print('Ingresando...');

                  },
                  child: Text('Ingreso'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Registro('Variable')));
                  },
                  child: Text('Registro'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
