import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class Communityy extends StatefulWidget {
  const Communityy({Key? key}) : super(key: key);

  @override
  _CommunityyState createState() => _CommunityyState();
}

class _CommunityyState extends State<Communityy> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: Text(
          "agora",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.green[800]),
        ),
        // centerTitle: true,
        titleSpacing: 50,
        actions: [
          Icon(
            Icons.cloud,
            color: Colors.green,
            size: 30,
          ),
          Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Icon(
                Icons.notifications,
                color: Colors.green,
                size: 30,
              )),
        ],
        leading: IconButton(
          iconSize: 40,
          color: Colors.black,
          icon: Icon(Icons.menu),
          onPressed: () => {scaffoldKey.currentState?.openDrawer()},
        ),
      ),
      drawer: Drawer(
        elevation: 5,
        child: Container(
          color: Colors.greenAccent,
          child: ListView(
            children: [
              Container(
                height: 150,
                width: 300,
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.greenAccent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () {},
                        child: Stack(overflow: Overflow.visible, children: [
                          ClipRRect(
                            child: Image.asset(
                              'assets/images/u1.jpeg',
                              width: 80,
                              height: 80,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          Positioned(
                              bottom: 2,
                              right: -15,
                              child: IconButton(
                                icon: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.edit,
                                        size: 20,
                                      ),
                                    )),
                                onPressed: () {},
                              ))
                        ]),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(""),
                        Text(""),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                title: Text("Account"),
                leading: Icon(Icons.person),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text("Invite Friends"),
                leading: Icon(Icons.star),
                /*onTap: (){
                    Navigator.pop(context);
                   Navigator.push(context,MaterialPageRoute(builder:(context)=>AnimatedBottomBar()));
                  },*/
              ),
              Divider(),
              ListTile(
                title: Text("Support"),
                leading: Icon(Icons.headphones),
                /*  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>Animations()));
                  },*/
              ),
              Divider(),
              ListTile(
                title: Text("Privacy Policy"),
                leading: Icon(Icons.security),
                /* onTap: (){
                    Navigator.pop(context);
                   Navigator.push(context,MaterialPageRoute(builder:(context)=>Intro()));
                  },*/
              ),
              Divider(),
              ListTile(
                title: Text("Terms & conditions"),
                leading: Icon(Icons.collections_bookmark_outlined),
              ),
              Divider(),
              ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),
              Divider(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18.0),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  title: Text("Logout"),
                  leading: Icon(
                    Icons.exit_to_app,
                    textDirection: TextDirection.rtl,
                  ),
                  // onTap:()=> Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.green[100],
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                shareProductTF(),
                SizedBox(
                  height: 10,
                ),
                categoryList(),
                SizedBox(
                  height: 10,
                ),
                askSomething(),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  // productListModel!.res!.products!.length !=null?productListModel!.res!.products!.length:1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 800,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20, left: 5, right: 5),
                      child: Card(
                          color: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
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
                                        width: 50,
                                        height: 50,
                                        margin:
                                            EdgeInsets.fromLTRB(5, 10, 5, 1),
                                        child: ClipRRect(
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                                'assets/images/u1.jpeg',
                                            image: '',
                                            imageErrorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                  child: Image.asset(
                                                      "assets/images/u1.jpeg"));
                                            },
                                            //'assets/images/u1.jpeg',
                                            width: 30,
                                            height: 30,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:250,
                                        margin: EdgeInsets.only(
                                          top: 15,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Riya Tyagi",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  ".",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "30 min",
                                                  style: TextStyle(
                                                      //  fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),

                                            Icon(Icons.more_vert_rounded)
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 250,
                                        child: Text(
                                          "What is the best laptop for the value of \$500 price range?",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: Colors.green[100],
                                              ),
                                              padding: EdgeInsets.all(5),
                                              child: Text("#watch")),
                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: Colors.green[100],
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              padding: EdgeInsets.all(5),
                                              child: Text("#latesttrendy")),
                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: Colors.green[100],
                                              ),
                                              padding: EdgeInsets.all(5),
                                              child: Text("#tech")),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.thumb_up,
                                            // color: Colors.blue,
                                            size: 30,
                                          ),
                                          Text(
                                            "1.7K",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.blue),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Icon(
                                            Icons.message_sharp,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          Text(
                                            "",
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Icon(
                                            Icons.shopping_cart,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "View all comments",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.green[800]),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 450,
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(
                                          top: 10),
                                      child: Card(
                                          color: Colors.white,
                                          elevation:1,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                5, 10, 5, 1),
                                                        child: ClipRRect(
                                                          child: FadeInImage
                                                              .assetNetwork(
                                                            placeholder:
                                                                'assets/images/u1.jpeg',
                                                            image: '',
                                                            imageErrorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return Container(
                                                                  child: Image
                                                                      .asset(
                                                                          "assets/images/u1.jpeg"));
                                                            },
                                                            //'assets/images/u1.jpeg',
                                                            width: 30,
                                                            height: 30,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                          top: 15,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "James Bond",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            SizedBox(
                                                              width: 2,
                                                            ),
                                                            Text(
                                                              ".",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "30 min",
                                                              style: TextStyle(
                                                                  //  fontWeight: FontWeight.bold,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black),
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        "Its the best laptop you can see it",
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                color: Colors
                                                                    .green[100],
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5),
                                                              child: Text(
                                                                  "#watch")),
                                                          Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                color: Colors
                                                                    .green[100],
                                                              ),
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          5),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5),
                                                              child: Text(
                                                                  "#latesttrendy")),
                                                          Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                color: Colors
                                                                    .green[100],
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5),
                                                              child: Text(
                                                                  "#tech")),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            height: 100,
                                                            width: 150,
                                                            child: ClipRRect(
                                                              child: FadeInImage
                                                                  .assetNetwork(
                                                                placeholder:
                                                                    'assets/images/Sale.jpg',
                                                                image: '',
                                                                imageErrorBuilder:
                                                                    (context,
                                                                        error,
                                                                        stackTrace) {
                                                                  return Container(
                                                                      child: Image
                                                                          .asset(
                                                                              "assets/images/Sale.jpg"));
                                                                },
                                                                // 'assets/images/Sale.jpg',
                                                                width: 60,
                                                                height: 60,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Column(
                                                            children: [
                                                              Container(
                                                                width: 40,
                                                                height: 40,
                                                                child: FadeInImage
                                                                    .assetNetwork(
                                                                  image: '',
                                                                  placeholder:
                                                                      "assets/images/u1.jpeg",
                                                                  imageErrorBuilder:
                                                                      (context,
                                                                          error,
                                                                          stackTrace) {
                                                                    return Container(
                                                                        child: Image.asset(
                                                                            "assets/images/logo.jpeg"));
                                                                  },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                '\$100.03',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              Text(
                                                                '\$200.03',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                    color: Colors
                                                                        .black26
                                                                        .withOpacity(
                                                                            0.5)),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 80,
                                                        width: 230,
                                                        child: RichText(
                                                          text: TextSpan(
                                                              text:
                                                                  "This is such a beautiful product and surely you would like to buy it.Go and check it and enjoy some discount",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .green[
                                                                      800],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        " flipkart.in",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                    recognizer:
                                                                        TapGestureRecognizer()
                                                                          ..onTap =
                                                                              () {})
                                                              ]),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                          child: RaisedButton(
                                                        elevation: 5,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 60,
                                                                vertical: 10),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0),
                                                        ),
                                                        color: Colors.blue[200],
                                                        child: Text(
                                                          "View in site",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        onPressed: () {},
                                                      )),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.thumb_up,
                                                            // color: Colors.blue,
                                                            size: 30,
                                                          ),
                                                          Text(
                                                            "1.7K",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .blue),
                                                          ),
                                                          SizedBox(
                                                            width: 30,
                                                          ),
                                                          Icon(
                                                            Icons.message_sharp,
                                                            color: Colors.black,
                                                            size: 30,
                                                          ),
                                                          Text(
                                                            '188',
                                                          ),
                                                          SizedBox(
                                                            width: 30,
                                                          ),
                                                          Icon(
                                                            Icons.shopping_cart,
                                                            color: Colors.black,
                                                            size: 30,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.arrow_upward,
                                              size: 30,
                                              color: Colors.green,
                                            ),
                                            hintText: "Add a comment",
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Colors.green,
                                              size: 30,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(40))),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }

  Widget shareProductTF() => Container(
        child: TextFormField(
          decoration: InputDecoration(
              hintText: "Search",
              suffixIcon: Icon(
                Icons.search,
                color: Colors.green,
                size: 30,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(40)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
        ),
      );

  Widget categoryList() => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.green[500], shape: BoxShape.circle),
                  child: Icon(
                    Icons.microwave,
                    color: Colors.white,
                  ),
                ),
                Text("Tools")
              ],
            ),
            Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.green[500], shape: BoxShape.circle),
                  child: Icon(
                    Icons.tv_sharp,
                    color: Colors.white,
                  ),
                ),
                Text("Tech")
              ],
            ),
            Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.green[500], shape: BoxShape.circle),
                  child: Icon(
                    Icons.sports_volleyball,
                    color: Colors.white,
                  ),
                ),
                Text("Sports")
              ],
            ),
            Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.green[500], shape: BoxShape.circle),
                  child: Icon(
                    Icons.pregnant_woman,
                    color: Colors.white,
                  ),
                ),
                Text("Beauty")
              ],
            ),
            Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.green[500], shape: BoxShape.circle),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
                Text("Fashion")
              ],
            ),
          ],
        ),
      );

  Widget askSomething() => Container(
        child: TextFormField(
          decoration: InputDecoration(
              hintText: "Ask Something",
              suffixIcon: Icon(
                Icons.add,
                color: Colors.green,
                size: 30,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(40)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
        ),
      );
}
