
/*
class VerificationModel {
  int? status;
  Error? error;
  VerificationModel({this.status, this.error});
  VerificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
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
}
*/






class ResentOtpModel {
  int? status;
  Res? res;


  ResentOtpModel({this.status, this.res, });

  ResentOtpModel.fromJson(Map<String, dynamic> json) {
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

  Res({this.msg});

  Res.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    return data;
  }
}

