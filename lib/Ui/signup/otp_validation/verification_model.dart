
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