import 'package:agora/Ui/auth/login/login_model.dart';
import 'package:agora/Ui/community/community_view.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_bloc.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_profile_view.dart';
import 'package:agora/Ui/home/home_bloc.dart';
import 'package:agora/Ui/user_account/user_account_view.dart';
import 'package:agora/Utils/preference_utils.dart';
import 'package:agora/Utils/preference_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';


class Home extends StatefulWidget {
  LoginModel? loginModel;
  Home({
    Key? key,
    this.loginModel
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String ACCESS_TOKEN="" ;
  String NAME="" ;
  String EMAIl="" ;
  String PROFILE="" ;
  String bp="";



  @override
  void initState() {
    //Future.delayed(Duration(milliseconds: 500));
    super.initState();
    getApiData();
  }
 Future getApiData() async {
    PreferenceUtils.getAccessToken().then((token) {
      ACCESS_TOKEN=token.toString();
     print(ACCESS_TOKEN+" access tokennnn");
    });

  }




  @override
  Widget build(BuildContext context) {
    LoginModel? loginModell=widget.loginModel;
    print("${loginModell?.res?.bP?.toString()} bp");

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
          onPressed: () => {
            scaffoldKey.currentState?.openDrawer()

          },
        ),
      ),
      drawer: Drawer(
        elevation: 5,
        child:BlocConsumer<HomeBloc,HomeState>(
            listener:(context,state){} ,
            builder: (context,state){
            // var name= state.prefUtils.;
             //print("${name}ghjkbjknjk");


              return Container(
                color: Colors.greenAccent,
                child: ListView(
                  children: [
                    Container(
                      height: 150,
                      width: 100,
                     padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.greenAccent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {

                                });
                              },
                              child: Stack(
                                  overflow: Overflow.visible,
                                  children:[
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: ClipRRect(
                                        child: FadeInImage.assetNetwork(
                                          fit: BoxFit.cover,
                                          placeholder:'assets/images/u1.jpeg' ,
                                          image: '${bp.toString()}${PROFILE.toString()}' ,
                                          imageErrorBuilder: (context, error, stackTrace) {
                                            return Container(child: Image.asset("assets/images/u1.jpeg"));
                                          },
                                        ),
                                        borderRadius: BorderRadius.circular(100.0),
                                      ),
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
                                                child: Icon(Icons.edit,size: 20,),
                                              )),
                                          onPressed: (){
                                            Navigator.pop(context);
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => BlocProvider<EditProfileBloc>(
                                                      create: (context) => EditProfileBloc(),
                                                      child: EditProfile(),
                                                    )));
                                          },
                                        ))
                                  ]

                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                  NAME.toString()), //widget.loginModel!.res!.user!.name.toString()
                              Text( EMAIl.toString()),//widget.loginModel!.res!.user!.email.toString()
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
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyAccount()));
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Invite Friends"),
                      leading: Icon(Icons.star),
                      /* onTap: (){
                    Navigator.pop(context);
                   Navigator.push(context,MaterialPageRoute(builder:(context)=>Community()));
                  },*/
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Support"),
                      leading: Icon(Icons.headphones),
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>Communityy()));
                      },
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
              );
            }
        )
      ),
      body: BlocConsumer<HomeBloc,HomeState>(
        listener:(context,state){} ,
        builder: (context,state){
          if(state.isSuccess){
            print(state.model.status.toString()+"state value success");


            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.green[100],
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection:Axis.vertical ,
                  child:Column(
                    children: [
                      shareProductTF(),

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:2            , // productListModel?.res?.products productListModel?.res?.products?.length         ,// productListModel!.res!.products!.length !=null?productListModel!.res!.products!.length:1,
                        itemBuilder: (BuildContext context, int index) {
                          var listProducts=state.model.res?.products![index];
                        //  print(state.prefUtils.+"kjhgfdsfg");
                          var name=state.loginModel.res?.user?.name.toString();
                          print(name.toString()+"login model data");
                          PreferenceUtils.getUserProfile().then((profile) {
                            NAME= profile.name.toString();
                            EMAIl = profile.email.toString();
                            PROFILE= profile.img.toString();
                            print(EMAIl+"name");
                            print(NAME+"name");
                            print(PROFILE+"name");
                          });
                           PreferenceUtils.getLoginBp().then((bP) {
                             bp=bP.toString();
                             print("${bp} hjjhjjhj");
                             print("${bp.toString()}${PROFILE.toString()} image picture getting?");
                           });
                          return Container(
                              height: 600,
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
                                                width:50,
                                                height:50 ,
                                                margin:
                                                EdgeInsets.fromLTRB(5, 10, 5, 1),
                                                child: ClipRRect(
                                                  child: FadeInImage.assetNetwork(
                                                    placeholder:'assets/images/u1.jpeg',
                                                    image:'${state.model.res?.bP?.toString()}${listProducts?.userImg.toString()}',
                                                    imageErrorBuilder: (context, error, stackTrace) {
                                                      return Container(child: Image.asset("assets/images/u1.jpeg"));
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
                                            children: [
                                              Container(
                                                width:250,
                                                margin: EdgeInsets.only(
                                                  top: 15,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                         listProducts?.name?.toString()??'',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 15,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          ".",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
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
                                              Text(
                                                listProducts?.caption?.toString()??'',
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
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: 150,
                                                    child: ClipRRect(
                                                      child: FadeInImage.assetNetwork(
                                                        placeholder:'assets/images/Sale.jpg' ,
                                                        image:listProducts?.img?.toString() ??'',
                                                        imageErrorBuilder: (context, error, stackTrace) {
                                                          return Container(child: Image.asset("assets/images/Sale.jpg"));
                                                        },
                                                        width: 60,
                                                        height: 60,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(20),
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
                                                        child: FadeInImage.assetNetwork(
                                                          image: listProducts?.logoUrl?.toString() ??'',
                                                          placeholder: "assets/images/u1.jpeg",
                                                          imageErrorBuilder: (context, error, stackTrace) {
                                                            return Container(child: Image.asset("assets/images/logo.jpeg"));
                                                          },

                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                       listProducts?.price?.toString()??'\$300', //productListModel?.res?.products![index].price.toString() !=null ?  productListModel!.res!.products![index].price.toString():'\$100.03',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                      Text(
                                                        '\$200.03',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            decoration: TextDecoration
                                                                .lineThrough,
                                                            color: Colors.black26
                                                                .withOpacity(0.5)),
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
                                                width: 250,
                                                child: RichText(
                                                  text: TextSpan(
                                                      text:
                                                      state.model.res!.products![index].title.toString().isEmpty?"This is such a beautiful product and surely you would like to buy it.Go and check it and enjoy some discount":listProducts?.title?.toString(),

                                                      style: TextStyle(
                                                          color: Colors.green[800],
                                                          fontWeight: FontWeight.bold),
                                                      children: [
                                                        TextSpan(
                                                            text: " flipkart.in",
                                                            style: TextStyle(
                                                                color: Colors.black),
                                                            recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap = () {})
                                                      ]),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                  child: RaisedButton(
                                                    elevation: 5,
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 60, vertical: 10),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(30.0),
                                                    ),
                                                    color: Colors.blue[200],
                                                    child: Text(
                                                      "View in site",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 15,
                                                          color: Colors.black),
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
                                                    listProducts?.likeCount?.toString()??'',
                                                    // "1.7K",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15,
                                                        color: Colors.blue
                                                    ),
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
                                                    listProducts?.commentCount?.toString()??'',
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
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: Colors.green[100],
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height:50,
                                                    width: 50,
                                                    padding: EdgeInsets.all(5),
                                                    child: ClipRRect(
                                                      child: Image.network(
                                                        '${state.model.res?.communitybP}${listProducts?.community?.img}',
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(50.0),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 8.0, left: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          listProducts?.community?.name?.toString() ??'',
                                                          // "Albert Einstein",
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: 15,
                                                              color: Colors.black),
                                                        ),
                                                        Container(
                                                            width: 200,
                                                            child: Text(
                                                              listProducts?.community?.desc?.toString()??'',
                                                              //"Hey this is such a beautiful watch"
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                ));
          }else {
            print(state.model.status.toString()+"state value");
            return Container();
          }
        },

      ),
    );
  }

 Widget shareProductTF()=> Container(
   child: TextFormField(
     decoration: InputDecoration(
         hintText: "Share a product",
         suffixIcon: Icon(
           Icons.add_circle_sharp,
           color: Colors.green,
           size: 30,
         ),
         enabledBorder: OutlineInputBorder(
             borderSide:
             BorderSide(color: Colors.blue, width: 2),
             borderRadius: BorderRadius.circular(40)),
         border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(40))),
   ),
 );
}
