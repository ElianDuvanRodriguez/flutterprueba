import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registro extends StatefulWidget{
  @override
  RegistroApp createState() => RegistroApp();

}

class RegistroApp extends State<Registro>{
  TextEditingController nombre = TextEditingController();
  TextEditingController identificacion = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController contrasena = TextEditingController();

  final firebase= FirebaseFirestore.instance;

  insertarDatos() async{
    try{
      await firebase.collection('Usuarios').doc().set({
        "NombreUsuario": nombre.text,
        "IdentificacionUsuario": identificacion.text,
        "CorreoUsuario": correo.text,
        "TelefonoUsuario": telefono.text,
        "Contraseña": contrasena.text
      });
      print('Envio Correcto');
    }
    catch(e){
      print('Error en insert.....' + e.toString());
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuarios'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 25, left: 15, right: 15),
            child: TextField(
              controller: nombre,
              decoration: InputDecoration(
                labelText: 'Nombre'
              ),
              style: TextStyle(
                color: Colors.teal
              ),
            ),
            ),
            Padding(padding: EdgeInsets.only(top: 25, left: 15, right: 15),
              child: TextField(
                controller: identificacion,
                decoration: InputDecoration(
                    labelText: 'Identificación'
                ),
                style: TextStyle(
                    color: Colors.teal
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 25, left: 15, right: 15),
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                    labelText: 'Correo'
                ),
                style: TextStyle(
                    color: Colors.teal
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 25, left: 15, right: 15),
              child: TextField(
                controller: telefono,
                decoration: InputDecoration(
                    labelText: 'Teléfono'
                ),
                style: TextStyle(
                    color: Colors.teal
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 25, left: 15, right: 15),
              child: TextField(
                controller: contrasena,
                decoration: InputDecoration(
                    labelText: 'Contraseña'
                ),
                style: TextStyle(
                    color: Colors.teal
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top:20,left: 10,right: 10),
              child: ElevatedButton(

                onPressed: (){
                  print(nombre.text);
                  insertarDatos();
                },

                child: Text('Registrar')

              ),
            ),
          ],
        ),
      ),
    );
  }
}