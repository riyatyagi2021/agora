class OtpVerifyModel {
  int? status;
  Res? res;

  OtpVerifyModel({this.status, this.res});

  OtpVerifyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    res = json['res'] != null ? new Res.fromJson(json['res']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.res != null) {
      data['res'] = this.res?.toJson();
    }
    return data;
  }
}

class Res {
  String? msg;
  int? key;
  User? user;
  String? bP;
  String? accessToken;

  Res({this.msg, this.key, this.user, this.bP, this.accessToken});

  Res.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    key = json['key'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    bP = json['bP'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['key'] = this.key;
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    data['bP'] = this.bP;
    data['accessToken'] = this.accessToken;
    return data;
  }
}

class User {
  String? userId;
  String? username;
  bool? isNotif;
  String? email;
  int? socialType;
  String? name;
  bool? isFollow;

  User(
      {this.userId,
        this.username,
        this.isNotif,
        this.email,
        this.socialType,
        this.name,
        this.isFollow});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    isNotif = json['isNotif'];
    email = json['email'];
    socialType = json['socialType'];
    name = json['name'];
    isFollow = json['isFollow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['isNotif'] = this.isNotif;
    data['email'] = this.email;
    data['socialType'] = this.socialType;
    data['name'] = this.name;
    data['isFollow'] = this.isFollow;
    return data;
  }
}

/*class Req {
  String otp;
  String type;
  String email;
  String devTkn;
  DevUsers devUsers;

  Req({this.otp, this.type, this.email, this.devTkn, this.devUsers});

  Req.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    type = json['type'];
    email = json['email'];
    devTkn = json['devTkn'];
    devUsers = json['devUsers'] != null
        ? new DevUsers.fromJson(json['devUsers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['type'] = this.type;
    data['email'] = this.email;
    data['devTkn'] = this.devTkn;
    if (this.devUsers != null) {
      data['devUsers'] = this.devUsers.toJson();
    }
    return data;
  }
}*/

/*
class DevUsers {
  String devType;
  String devTkn;

  DevUsers({this.devType, this.devTkn});

  DevUsers.fromJson(Map<String, dynamic> json) {
    devType = json['devType'];
    devTkn = json['devTkn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['devType'] = this.devType;
    data['devTkn'] = this.devTkn;
    return data;
  }
}*/
