

class UserViewModel {
  int? status;
  Res? res;
  //Req? req;
  String? time;

  UserViewModel({this.status, this.res,  this.time});

  UserViewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    res = json['res'] != null ? new Res.fromJson(json['res']) : null;
    //req = json['req'] != null ? new Req.fromJson(json['req']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.res != null) {
      data['res'] = this.res?.toJson();
    }
    // if (this.req != null) {
    //   data['req'] = this.req?.toJson();
    // }
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
      data['user'] = this.user?.toJson();
    }
    data['bP'] = this.bP;
    return data;
  }
}

class User {
  String? userId;
  String? name;
  String? email;
  String? username;
  int? socialType;
  int? following;
  int? followers;
  int? product;
  int? isFollower;
  int? isFollowing;
  int? unreadCount;
  bool? isNotif;
  int? chatCount;
  bool? isFollow;
  int? likeCount;

  User({this.userId, this.name, this.email, this.username, this.socialType, this.following, this.followers, this.product, this.isFollower, this.isFollowing, this.unreadCount, this.isNotif, this.chatCount, this.isFollow, this.likeCount});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    socialType = json['socialType'];
    following = json['following'];
    followers = json['followers'];
    product = json['product'];
    isFollower = json['isFollower'];
    isFollowing = json['isFollowing'];
    unreadCount = json['unreadCount'];
    isNotif = json['isNotif'];
    chatCount = json['chatCount'];
    isFollow = json['isFollow'];
    likeCount = json['likeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['socialType'] = this.socialType;
    data['following'] = this.following;
    data['followers'] = this.followers;
    data['product'] = this.product;
    data['isFollower'] = this.isFollower;
    data['isFollowing'] = this.isFollowing;
    data['unreadCount'] = this.unreadCount;
    data['isNotif'] = this.isNotif;
    data['chatCount'] = this.chatCount;
    data['isFollow'] = this.isFollow;
    data['likeCount'] = this.likeCount;
    return data;
  }
}

/*
class Req {
  Req({});

Req.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}
*/
