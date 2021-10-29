import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Ui/auth/login/login_bloc.dart';
import 'Ui/auth/login/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Colors.green[200],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
               child: Icon(Icons.sports_volleyball_sharp,color: Colors.green[800],size: 150,),
               // child: Image.asset('assets/images/logo.jpg',height:150,width: 150,)
            ),
            Text("agora",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: Colors.green[800]
            ),),
            Container(
              padding: EdgeInsets.only(top: 150,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Shop   .",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green[800]
                  ),),
                  Text("Share   .",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green[800]
                  ),),
                  Text("Earn",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green[800]
                  ),),
                ],
              ),
            ),
            RaisedButton(onPressed: ()
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
              (context) => BlocProvider<LoginBloc>(
                create: (context)=> LoginBloc(),child: Login(), )
              ));

            },
                padding: EdgeInsets.symmetric(horizontal: 35,vertical: 15),
                shape:  RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(30.0),
                ),
                color: Colors.green,
            child:Text("START EXPLORING",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.white
            ),))

          ],
        ),
      ),
    );
  }
}
