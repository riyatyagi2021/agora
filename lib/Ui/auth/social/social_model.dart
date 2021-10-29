class SocialVerifyModel {
  int? status;
  Error? error;
  Req? req;


  SocialVerifyModel({this.status, this.error, this.req});

  SocialVerifyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    req = json['req'] != null ? new Req.fromJson(json['req']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    if (this.req != null) {
      data['req'] = this.req!.toJson();
    }

    return data;
  }
}

class Error {
  int? code;
  String? msg;

  Error({this.code, this.msg});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    return data;
  }
}

class Req {
  String? type;
  String? socialId;
  String? devTkn;
  String? email;
  String? name;
  SocialData? socialData;

  Req(
      {this.type,
        this.socialId,
        this.devTkn,
        this.email,
        this.name,
        this.socialData});

  Req.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    socialId = json['socialId'];
    devTkn = json['devTkn'];
    email = json['email'];
    name = json['name'];
    socialData = json['socialData'] != null
        ? new SocialData.fromJson(json['socialData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['socialId'] = this.socialId;
    data['devTkn'] = this.devTkn;
    data['email'] = this.email;
    data['name'] = this.name;
    if (this.socialData != null) {
      data['socialData'] = this.socialData!.toJson();
    }
    return data;
  }
}

class SocialData {
  String? sId;
  String? id;
  String? name;
  String? socialId;
  int? type;
  String? devTkn;
  String? email;
  int? devType;
  bool? isVerfied;
  String? socialType;

  SocialData(
      {this.sId,
        this.id,
        this.name,
        this.socialId,
        this.type,
        this.devTkn,
        this.email,
        this.devType,
        this.isVerfied,
        this.socialType});

  SocialData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    socialId = json['socialId'];
    type = json['type'];
    devTkn = json['devTkn'];
    email = json['email'];
    devType = json['devType'];
    isVerfied = json['isVerfied'];
    socialType = json['socialType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['socialId'] = this.socialId;
    data['type'] = this.type;
    data['devTkn'] = this.devTkn;
    data['email'] = this.email;
    data['devType'] = this.devType;
    data['isVerfied'] = this.isVerfied;
    data['socialType'] = this.socialType;
    return data;
  }
}