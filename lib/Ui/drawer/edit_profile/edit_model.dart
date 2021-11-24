
class EditProfileModel {
  int? status;
  Res? res;
  Req? req;
  String? time;

  EditProfileModel({this.status, this.res, this.req, this.time});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    res = json['res'] != null ? new Res.fromJson(json['res']) : null;
    req = json['req'] != null ? new Req.fromJson(json['req']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.res != null) {
      data['res'] = this.res!.toJson();
    }
    if (this.req != null) {
      data['req'] = this.req!.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}

class Res {
  User? user;
  String? bP;

  Res({this.user, this.bP});

  Res.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    bP = json['bP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['bP'] = this.bP;
    return data;
  }
}

class User {
  String? userId;
  String? img;
  String? name;
  String? email;
  String? username;
  String? bio;
  String? profession;
  String? instaLink;
  String? fbLink;
  String? youTubeLink;
  String? pinterest;
  String? twitter;
  String? webLink;
  int? socialType;
  String? tiktok;
  bool? isNotif;
  bool? isFollow;

  User({this.userId,this.img, this.name, this.email, this.username, this.bio, this.profession, this.instaLink, this.fbLink, this.youTubeLink, this.pinterest, this.twitter, this.webLink, this.socialType, this.tiktok, this.isNotif, this.isFollow});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    img = json['img'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    bio = json['bio'];
    profession = json['profession'];
    instaLink = json['instaLink'];
    fbLink = json['fbLink'];
    youTubeLink = json['youTubeLink'];
    pinterest = json['pinterest'];
    twitter = json['twitter'];
    webLink = json['webLink'];
    socialType = json['socialType'];
    tiktok = json['tiktok'];
    isNotif = json['isNotif'];
    isFollow = json['isFollow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['img'] = this.img;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['bio'] = this.bio;
    data['profession'] = this.profession;
    data['instaLink'] = this.instaLink;
    data['fbLink'] = this.fbLink;
    data['youTubeLink'] = this.youTubeLink;
    data['pinterest'] = this.pinterest;
    data['twitter'] = this.twitter;
    data['webLink'] = this.webLink;
    data['socialType'] = this.socialType;
    data['tiktok'] = this.tiktok;
    data['isNotif'] = this.isNotif;
    data['isFollow'] = this.isFollow;
    return data;
  }
}

class Req {


  Req();

Req.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}