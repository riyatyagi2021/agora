

class SignupModel {
  int? status;
  Res? res;
  SignupModel({this.status, this.res});
  SignupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    res = json['res'] != null ? new Res.fromJson(json['res']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.res != null) {
      data['res'] = this.res!.toJson();
    }
    return data;
  }
}

class Res {
  String? msg;
  String? userId;
  Res({this.msg, this.userId});
  Res.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    userId = json['userId'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['userId'] = this.userId;
    return data;
  }
}
/*
class Req {
  String? devTkn;
  String? name;
  String? username;
  String? email;
  String? password;

  Req({this.devTkn, this.name, this.username, this.email, this.password});

  Req.fromJson(Map<String, dynamic> json) {
    devTkn = json['devTkn'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['devTkn'] = this.devTkn;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}*/

