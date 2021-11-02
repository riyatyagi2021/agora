import 'package:agora/Ui/auth/login/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyAccount extends StatefulWidget {
  LoginModel loginModel;
 MyAccount({Key? key,required this.loginModel }) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> with SingleTickerProviderStateMixin  {

  late TabController tabController;


  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }


    @override
  Widget build(BuildContext context) {

    var name=widget.loginModel.res!.user!.name;


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.green[400],
        centerTitle: true,
        title: Text("My Account",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                 // padding: EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.green[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          ClipRRect(
                            child: Image.asset(
                              'assets/images/u1.jpeg',
                              width: 100,
                              height: 100,
                            ),
                            borderRadius:
                            BorderRadius.circular(50.0),
                          ),
                          SizedBox(height: 10,),
                          Text(name.toString(),style: TextStyle(color: Colors.black,fontSize: 30,)),
                          SizedBox(height: 10,),
                          Text("Tech, Youtube",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 18,)),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("87",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                              Text("230",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                              Text("300k",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Listings",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 15,)),
                              Text("Followers",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 15,)),
                              Text("Following",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 15,)),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Divider(),
                          SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 38.0),
                            child: Text("Here you can see a lot of different sites and select one and strat using it ",textAlign: TextAlign.center,),
                          ),
                          SizedBox(height: 25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(onPressed: (){}, child: ClipOval(child: Image.asset('assets/images/insta.jpeg',height: 20,width: 20,)),),
                              TextButton(onPressed: (){}, child: ClipOval(child: Image.asset('assets/images/youtube.png',height: 20,width: 20,)),),
                              TextButton(onPressed: (){}, child: ClipOval(child: Image.asset('assets/images/u1.jpeg',height: 20,width: 20,)),),
                              IconButton(onPressed: (){}, icon: Icon(Icons.facebook),iconSize: 40,color: Colors.blue,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(onPressed: (){}, child: ClipOval(child: Image.asset('assets/images/twitter.png',height: 20,width: 20,)),),
                              TextButton(onPressed: (){}, child: ClipOval(child: Image.asset('assets/images/web.png',height: 20,width: 20,)),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                //width:double.infinity,
                                width:200,
                                height: 50,
                                child: ElevatedButton(
                                  child: Text("Analytics"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.pinkAccent,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                      textStyle: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: (){},
                                ),
                              ),
                              SizedBox(width: 20,),
                              ElevatedButton(
                                child: Text("Edit"),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  primary: Colors.grey,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                  textStyle: TextStyle(fontSize: 15),
                                ),
                                onPressed: (){},
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 55,
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(
                                25.0,
                              ),
                            ),
                            child: TabBar(
                              controller: tabController,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  25.0,
                                ),
                                color: Colors.green,
                              ),
                              labelColor: Colors.limeAccent,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(
                                  text: 'Shop',
                                ),
                                Tab(
                                  text: 'Activity',
                                ),
                              ],
                            ),

                          ),
                         SizedBox(height: 20,),
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                Center(
                                  child: ListView(
                                    children: [
                                      Column(
                                        children: [
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                          Text("kjhgfd"),
                                        ],

                                      ),
                                ]
                                  ),
                                ),

                                // second tab bar view widget
                                Center(
                                  child: Text(
                                    'See your activities',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),


                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
