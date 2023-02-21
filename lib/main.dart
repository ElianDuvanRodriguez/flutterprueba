import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'View/Registro.dart';
import 'firebase_options.dart';

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

class HomeStart extends State<Home>{
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Bienvenidos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Línea 2'),
        ),
        body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset('img/img.png'),
            ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            child: TextField(
             decoration: InputDecoration(
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10)
               ),
               labelText: 'Email Usuario',
               hintText: 'Digite email de Usuario'
             ),
            ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: 'Password Usuario',
                    hintText: 'Digite password de Usuario'
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top:20,left: 10,right: 10),
              child: ElevatedButton(
                onPressed: (){

                },
                child: Text('Guardar'),
              ),
            ),
            Padding(padding: EdgeInsets.only(top:20,left: 10,right: 10),
              child: ElevatedButton(
                onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (_) => Registro()));
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