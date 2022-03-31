class HomeModel {
  int? status;
  Res? res;
  Req? req;
  String? time;

  HomeModel({this.status, this.res, this.req, this.time});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    res = json['res'] != null ? new Res.fromJson(json['res']) : null;
    req = json['req'] != null ? new Req.fromJson(json['req']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.res != null) {
      data['res'] = this.res?.toJson();
    }
    if (this.req != null) {
      data['req'] = this.req?.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}

class Res {
  String? msg;
  int? key;
  Userr? user;
  String? bP;
  String? accessToken;

  Res({this.msg, this.key, this.user, this.bP, this.accessToken});

  Res.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    key = json['key'];
    user = json['user'] != null ? new Userr.fromJson(json['user']) : null;
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

class Userr {
  String? userId;
  String? username;
  String? img;
  bool? isNotif;
  String? email;
  int? socialType;
  String? name;
  bool? isFollow;

  Userr(
      {this.userId,
        this.username,
        this.img,
        this.isNotif,
        this.email,
        this.socialType,
        this.name,
        this.isFollow});

  Userr.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    isNotif = json['isNotif'];
    img = json['img'];
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
    data['img'] = this.img;
    data['email'] = this.email;
    data['socialType'] = this.socialType;
    data['name'] = this.name;
    data['isFollow'] = this.isFollow;
    return data;
  }
}

class Req {
  String? devTkn;
  String? email;
  String? password;

  Req({this.devTkn, this.email, this.password});

  Req.fromJson(Map<String, dynamic> json) {
    devTkn = json['devTkn'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['devTkn'] = this.devTkn;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}




