import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

 final GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        drawer: Drawer(),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: Text("agora",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.green[800]
          ),),
         // centerTitle: true,
          titleSpacing: 50,
          actions: [
            Icon(Icons.cloud,color: Colors.green,size: 30,),
            Container(
                margin: EdgeInsets.only(right: 10,left: 10),
                child: Icon(Icons.notifications,color: Colors.green,size: 30,)),
          ],
          leading: IconButton(
            iconSize: 40,
            color: Colors.black,
            icon: Icon(Icons.menu),
            onPressed: ()=> {scaffoldKey.currentState?.openDrawer()},
          ),
        ) ,
        body: Container(
           height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
          color: Colors.green[100],
          padding: EdgeInsets.symmetric(horizontal: 4,vertical: 10),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                   Container(
                     child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Share a product",
                      suffixIcon:  Icon(Icons.add,size: 40,),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.blue,width: 2),
                            borderRadius: BorderRadius.circular(40)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)
                        )
                      ),
                  ),
                   ),

                  Container(
                    height: 550,
                    width: 360,
                    margin: EdgeInsets.only(top:20),
                    child: Card(
                      color: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Column(
                               children: [
                                 Container(
                                   margin: EdgeInsets.fromLTRB(10,10,10,1),
                                   child: ClipRRect(
                                     child: Image.asset(
                                       'assets/images/u1.jpeg',
                                       width: 60, height: 60,),
                                     borderRadius: BorderRadius.circular(
                                         50.0),
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 15,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        Text("Riya Tyagi",style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black
                                        ),),
                                        SizedBox(width: 5,),
                                        Text(".",style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black
                                        ),),
                                        SizedBox(width: 5,),
                                        Text("30 min",style: TextStyle(
                                          //  fontWeight: FontWeight.bold,
                                            fontSize:15,
                                            color: Colors.black
                                        ),),
                                       SizedBox(width: 100,),
                                       Icon(Icons.more_vert_rounded)
                                      ],
                                    ),
                                  ),
                               Text("Checkout my latest watch!",),
                                 SizedBox(height: 10,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Container(
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.all(Radius.circular(20)),
                                           color:Colors.green[100],
                                         ),
                                       padding: EdgeInsets.all(5),
                                     child: Text("#watch")
                                     ),
                                     Container(
                                         decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                           color: Colors.green[100],
                                     ),
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                         padding: EdgeInsets.all(5),
                                         child: Text("#latesttrendy")
                                     ),
                                     Container(
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.all(Radius.circular(20)),
                                           color: Colors.green[100],
                                         ),
                                         padding: EdgeInsets.all(5),
                                         child: Text("#tech")
                                     ),
                                   ],
                                 ),
                                SizedBox(height: 20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                       height: 100,
                                        width: 150,
                                        child: ClipRRect(
                                          child: Image.asset( 'assets/images/Sale.jpg',width: 60,height: 60,)
                                          ,borderRadius:BorderRadius.circular(20) ,),
                                    ),
                                    SizedBox(width: 20,),
                                    Column(
                                      children: [
                                        Image.asset('assets/images/logo.jpeg',width: 40,height: 40,),
                                        SizedBox(height: 10,),
                                        Text('\$100.03',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                        Text('\$200.03',style: TextStyle(fontSize: 16,decoration: TextDecoration.lineThrough,color: Colors.black26.withOpacity(0.5)),),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 10,),
                             RichText(text: TextSpan(
                               text:"Human Amazfit GTS Smart Watch\n Obsidian  Black ",style: TextStyle(color: Colors.green[800],fontWeight: FontWeight.bold),
                             children: [
                               TextSpan(
                                 text: " flipkart.in",style: TextStyle(
                                 color: Colors.black
                               ),
                                 recognizer:TapGestureRecognizer()
                                   ..onTap=(){}
                               )
                             ]
                             ),),
                                SizedBox(height: 10,),
                                  Container(
                                    child:RaisedButton(
                                      elevation: 5,
                                      padding: EdgeInsets.symmetric(horizontal: 60,vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      color: Colors.blue[200],
                                      child:  Text("View in site",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:15,
                                          color: Colors.black
                                      ),),
                                     onPressed:(){} ,
                                    )
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.thumb_up,color:Colors.blue,size: 30,),
                                      Text("1.7K",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:15,
                                          color: Colors.blue
                                      ),),
                                      SizedBox(width: 30,),
                                      Icon(Icons.message_sharp,color:Colors.black,size: 30,),
                                      Text("188"),
                                      SizedBox(width: 30,),
                                      Icon(Icons.shopping_cart,color:Colors.black,size: 30,),
                                    ],
                                  ),
                                ],
                              ),
                           ],
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left:10.0,right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("View all comments",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:15,
                                    color: Colors.green[800]
                                ),),
                                SizedBox(height: 10,),

                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Colors.green[100],
                                  ),
                                  child: Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        child: ClipRRect(
                                          child: Image.asset(
                                            'assets/images/u1.jpeg',
                                            width: 50, height: 50,),
                                          borderRadius: BorderRadius.circular(
                                              50.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:8.0,left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Albert Einstein",style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:15,
                                                color: Colors.black
                                            ),),
                                            Container(
                                              width: 200,
                                                child: Text("Hey this is such a beautiful watch"))
                                            ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  child: TextFormField(
                                    decoration: InputDecoration(

                                      suffixIcon:  Icon(Icons.arrow_upward,size: 30,color:Colors.green,),
                                        hintText: "Add a comment",
                                        prefixIcon:  Icon(Icons.person,color:Colors.green,size: 30,),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color:Colors.black,width: 2),
                                            borderRadius: BorderRadius.circular(40)
                                        ),
                                        border: OutlineInputBorder(
                                           borderSide: BorderSide(color:Colors.black,width: 2),
                                            borderRadius: BorderRadius.circular(40)
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      );

  }
}
