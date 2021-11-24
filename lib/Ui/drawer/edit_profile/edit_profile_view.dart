import 'dart:io';

import 'package:agora/Ui/auth/login/login_model.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_model.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_repo.dart';
import 'package:agora/Utils/preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  LoginModel? loginModel;

  EditProfile({Key? key, this.loginModel}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController profession = TextEditingController();
  EditProfileRepository editProfileRepository = EditProfileRepository();
  EditProfileModel editProfileModel = EditProfileModel();
  String PROFILE = "";
  String ACCESS_TOKEN = "";
  String UserName = "";
  File? uploadimage;

  Future<void> chooseImageGallery() async {
    final imageFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxWidth: 1000);
    if (imageFile == null) {
      return;
    }
    final fileimage = File(imageFile.path);
    setState(() {
      this.uploadimage = fileimage;
    });
    print(uploadimage!.path.toString() + " value");
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    editProfileModel =
        await editProfileRepository.editProfileData(1, ACCESS_TOKEN);
  }

  @override
  Widget build(BuildContext context) {
    PreferenceUtils.getAccessToken().then((token) {
      ACCESS_TOKEN = token.toString();
      print(ACCESS_TOKEN + " access tokennnn");
    });
    PreferenceUtils.getLoginUserName().then((token) {
      UserName = token.toString();
      print(UserName + " USERANME");
    });
    print("${editProfileModel.res?.user?.username?.toString()} username");

    PreferenceUtils.getLoginProfile().then((profile) {
      PROFILE = profile.toString();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.green[200],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[400],
            ),
            height: 1000,
            width: 300,
            child: ListView(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: uploadimage == null
                                  ? Container(
                                      child: ClipOval(
                                          child: Image.network(PROFILE)))
                                  : Container(
                                      child: ClipOval(
                                          child: Image.file(
                                              File(uploadimage!.path)))),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              icon: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                  )),
                              onPressed: () async {
                                await chooseImageGallery();
                              },
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        controller: fullname,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            labelText: "Name",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                            hintText: "Riya Tyagi",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5))),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            labelText: "Username",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                            hintText:
                                editProfileModel.res?.user?.username != null
                                    ? editProfileModel.res?.user?.username
                                    : "enter username",
                            //editProfileModel.res!.user!.profession!.isEmpty?"Enter profession":editProfileModel.res!.user!.profession,
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5))),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        controller: bio,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            labelText: "Bio",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                            hintText:
                                "I’m a software engineer in Santa Barbara, CA with a passion for computer science, electrical engineering and embedded systems technology.",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5))),
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        controller: profession,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            labelText: "Profession",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                            hintText:
                                editProfileModel.res?.user?.profession != null
                                    ? editProfileModel.res?.user?.profession
                                    : "enter profess",
                            //editProfileModel.res!.user!.profession!.isEmpty?"Enter profession":editProfileModel.res!.user!.profession,
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5))),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        //controller: username,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            labelText: "Link Facebook",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                            hintText: "Add Link",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5))),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        // controller: username,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            labelText: "Link Youtube",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                            hintText: "Add Link",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5))),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        //  controller: username,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            labelText: "Link Website",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                            hintText: "Add Link",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5))),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //width:double.infinity,
                      width: 260,
                      height: 50,
                      child: ElevatedButton(
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35)),
                          textStyle: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          editProfileModel =
                              await editProfileRepository.editProfile(
                                  1,
                                  username.text,
                                  ACCESS_TOKEN,
                                  uploadimage!.absolute);
                          print("Picture" +
                              editProfileModel.res!.bP.toString() +
                              editProfileModel.res!.user!.img.toString());
                          //   Navigator.push(context,MaterialPageRoute(builder:(context)=>Home()));
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
