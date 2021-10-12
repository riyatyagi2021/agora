import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Lottie.network("https://assets2.lottiefiles.com/packages/lf20_9evakyqx.json")
              ],
       ),
      ),

    );
  }
}
