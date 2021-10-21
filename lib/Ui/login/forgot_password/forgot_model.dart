

class ResetPasswordModel {
  int? status;
  Error? error;


  ResetPasswordModel({this.status, this.error});

  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.error != null) {
      data['error'] = this.error?.toJson();
    }
    return data;
  }
}

class Error {
  int? code;
  String? msg;
  List<Errors>? errors;

  Error({this.code, this.msg, this.errors});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['errors'] != null) {
      errors = new List<Errors>.empty();      //check this again
      json['errors'].forEach((v) {
        errors?.add(new Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.errors != null) {
      data['errors'] = this.errors?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  String? fieldName;
  String? message;

  Errors({this.fieldName, this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    fieldName = json['fieldName'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fieldName'] = this.fieldName;
    data['message'] = this.message;
    return data;
  }
}

/*
class Req {
  String? password;
  String? userId;
  String? devTkn;

  Req({this.password, this.userId, this.devTkn});

  Req.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    userId = json['userId'];
    devTkn = json['devTkn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['userId'] = this.userId;
    data['devTkn'] = this.devTkn;
    return data;
  }
}*/
