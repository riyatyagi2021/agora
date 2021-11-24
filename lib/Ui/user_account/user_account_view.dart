import 'package:agora/Ui/auth/login/login_model.dart';
import 'package:agora/Ui/user_account/user_account_repo.dart';
import 'package:agora/Ui/user_account/user_model.dart';
import 'package:agora/Utils/preference_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  LoginModel? loginModel;

  MyAccount({Key? key, this.loginModel}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  UserViewRepository userViewRepository=UserViewRepository();
  UserViewModel userViewModel=UserViewModel();
  String NAME="" ;
  String USER_NAME="" ;
  String ACCESS_TOKEN="" ;
  String USER_ID="" ;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
   getUserApiData();
  // getUserApiData();
  }

  getUserApiData()async{
  userViewModel= await userViewRepository.userViewApi(1, ACCESS_TOKEN, USER_ID);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
  // var name = widget.loginModel!.res!.user!.name;
    PreferenceUtils.getLoginName().then((name) {
      NAME=name.toString();
    });
    PreferenceUtils.getAccessToken().then((name) {
      ACCESS_TOKEN=name.toString();
    });

 PreferenceUtils.getLoginUserName().then((name) {
      USER_NAME=name.toString();
    });
 PreferenceUtils.getLoginUserId().then((name) {
      USER_ID=name.toString();
    });

print("${userViewModel.res?.user?.followers} folllowers");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.green[400],
        centerTitle: true,
        title: Text(
          "My Account",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 1000,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.green[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        ClipRRect(
                          child: Image.asset(
                            'assets/images/u1.jpeg',
                            width: 100,
                            height: 100,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(NAME,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(USER_NAME,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("87",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text( "",//${userViewModel.res?.user?.followers},//"50",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text("80",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Listings",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 15,
                                )),
                            Text("Followers",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 15,
                                )),
                            Text("Following",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 15,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 38.0),
                          child: Text(
                            "Here you can see a lot of different sites and select one and start using it ",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: ClipOval(
                                  child: Image.asset(
                                'assets/images/insta.jpeg',
                                height: 40,
                                width: 40,
                              )),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: ClipOval(
                                  child: Image.asset(
                                'assets/images/youtube.png',
                                height: 40,
                                width: 40,
                              )),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: ClipOval(
                                  child: Image.asset(
                                'assets/images/pinterest.png',
                                height: 40,
                                width: 40,
                              )),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.facebook),
                              iconSize: 40,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: ClipOval(
                                  child: Image.asset(
                                'assets/images/twitter.png',
                                height: 40,
                                width: 40,
                              )),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: ClipOval(
                                  child: Image.asset(
                                'assets/images/web.png',
                                height: 40,
                                width: 40,
                              )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              //width:double.infinity,
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                child: Text("Analytics"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.pinkAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35)),
                                  textStyle: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              child: Text("Edit"),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                primary: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35)),
                                textStyle: TextStyle(fontSize: 15),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              shopView(),
                              activityView(),
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

  Widget shopView() => Container(
        color: Colors.white,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          child: Text("Add Shop"),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            textStyle: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.format_line_spacing,
                            color: Colors.green,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.view_headline_sharp,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.grid_view,
                            color: Colors.green,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tech",
                      style: TextStyle(color: Colors.green),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.edit_location_outlined,
                            color: Colors.green,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add_circle_sharp,
                            color: Colors.green,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 20,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 2.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                              children: [
                            Image.asset(
                              'assets/images/Sale.jpg',
                              height: 100,
                            ),
                                Positioned(
                                  bottom: 10,
                                    left: 10,
                                    child: Text("Digital Watch",style: TextStyle(color: Colors.white),))
                          ]
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text("Watch "),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Row(
                              children: [
                                Text("\$99.09"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "\$99.99",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    height: 20,
                                    width: 50,
                                    child: Image.asset(
                                      'assets/images/Sale.jpg',
                                      height: 50,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "snapdeal.in",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: ElevatedButton(
                              child: Text("View in site"),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35)),
                                textStyle: TextStyle(fontSize: 15),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ]),
      );

  Widget activityView() => Center(
        child: Text(
          'See your activities',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
