import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Ui/auth/login/login_bloc.dart';
import 'Ui/auth/login/login_view.dart';
import 'Ui/home/home_bloc.dart';
import 'Ui/home/home_view.dart';
import 'Utils/preference_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  bool isLoading = false;

  String ACCESS_TOKEN = "";

  String NAME = "";

  String EMAIl = "";

  String PROFILE = "";

  @override
  void initState() {
    super.initState();
    getAccessToken();
  }

  getAccessToken() {
    PreferenceUtils.getAccessToken().then((token) {
      ACCESS_TOKEN = token.toString();
      // Fluttertoast.showToast(msg: "tokenn " + ACCESS_TOKEN);
      print(ACCESS_TOKEN + "  accesstoken");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Colors.green[200],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Icon(
                  Icons.sports_volleyball_sharp,
                  color: Colors.green[800],
                  size: 150,
                ),
                // child: Image.asset('assets/images/logo.jpg',height:150,width: 150,)
              ),
              Text(
                "agora",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.green[800]),
              ),
              Container(
                padding: EdgeInsets.only(top: 150, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Shop   .",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green[800]),
                    ),
                    Text(
                      "Share   .",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green[800]),
                    ),
                    Text(
                      "Earn",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green[800]),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                  onPressed: () {
                    if (ACCESS_TOKEN == "null") {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider<LoginBloc>(
                                    create: (context) => LoginBloc(),
                                    child: Login(),
                                  )));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider<HomeBloc>(
                                    create: (context) => HomeBloc(),
                                    child: Home(),
                                  )));
                    }
                  },
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.green,
                  child: Text(
                    "START EXPLORING",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.white),
                  ))
            ],
          ),
        ),
        isLoading
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                  ),
                ),
                color: Colors.green.shade50.withOpacity(0.8),
              )
            : Container()
      ]),
    );
  }
}
