class ProductListModell {
  int? status;
  Res? res;
  PrvUser? req;
  String? time;

  ProductListModell({this.status, this.res, this.req, this.time});

  ProductListModell.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    res = json['res'] != null ? new Res.fromJson(json['res']) : null;
    req = json['req'] != null ? new PrvUser.fromJson(json['req']) : null;
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
  int? page;
  int? limit;
  int? total;
  List<Products>? products;
  String? bP;
  String? communitybP;

  Res({this.page, this.limit, this.total, this.products, this.bP, this.communitybP});

  Res.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    if (json['products'] != null) {
      products =<Products>[];
      json['products'].forEach((v) { products!.add(new Products.fromJson(v)); });
    }
    bP = json['bP'];
    communitybP = json['communitybP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['total'] = this.total;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['bP'] = this.bP;
    data['communitybP'] = this.communitybP;
    return data;
  }
}

class Products {
  String? name;
  String? id;
  String? userImg;
  String? desc;
  String? url;
  String? img;
  String? caption;
  List<dynamic>? tag;
  String? title;
  String? price;
  String? linkType;
  String? link;
   List<dynamic>? linkUrls;
  bool? isDel;
  int? type;
  String? created;
  bool? isLike;
  String? logoUrl;
  int? likeCount;
   String? inBucket;
  String? prvUserId;
  PrvUser? prvUser;
  int? commentCount;
  LastComment? lastComment;
  String? userId;
  String? username;
   List<dynamic>? bucketData;
 String? prvCreated;
   String? prvProdId;
  String? brand;
  int? likeCountLast;
  bool? isLikeLast;
  String? communityName;
  String? communityId;
  Community? community;

  Products({this.name, this.id, this.userImg, this.desc, this.url, this.img, this.caption, this.tag, this.title, this.price, this.linkType, this.link, this.linkUrls, this.isDel, this.type, this.created, this.isLike, this.logoUrl, this.likeCount, this.inBucket, this.prvUserId, this.prvUser, this.commentCount, this.lastComment, this.userId, this.username, this.bucketData, this.prvCreated, this.prvProdId, this.brand, this.likeCountLast, this.isLikeLast, this.communityName, this.communityId, this.community});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    userImg = json['userImg'];
    desc = json['desc'];
    url = json['url'];
    img = json['img'];
    caption = json['caption'];
    if (json['tag'] != null) {
      tag =<dynamic>[];
      json['tag'].forEach((v) { tag!.add((v)); });        //  json['tag'].forEach((v) { tag!.add(new Null.fromJson(v)); });
    }
    title = json['title'];
    price = json['price'];
    linkType = json['linkType'];
    link = json['link'];
    if (json['linkUrls'] != null) {
      linkUrls = <dynamic>[];
      json['linkUrls'].forEach((v) { linkUrls!.add((v)); });
    }
    isDel = json['isDel'];
    type = json['type'];
    created = json['created'];
    isLike = json['isLike'];
    logoUrl = json['logoUrl'];
    likeCount = json['likeCount'];
    inBucket = json['inBucket'];
    prvUserId = json['prvUserId'];
    prvUser = json['prvUser'] != null ? new PrvUser.fromJson(json['prvUser']) : null;
    commentCount = json['commentCount'];
    lastComment = json['lastComment'] != null ? new LastComment.fromJson(json['lastComment']) : null;
    userId = json['userId'];
    username = json['username'];
    if (json['bucketData'] != null) {
      bucketData = <dynamic>[];
      json['bucketData'].forEach((v) { bucketData!.add((v)); });
    }
    prvCreated = json['prvCreated'];
    prvProdId = json['prvProdId'];
    brand = json['brand'];
    likeCountLast = json['likeCountLast'];
    isLikeLast = json['isLikeLast'];
    communityName = json['communityName'];
    communityId = json['communityId'];
    community = json['community'] != null ? new Community.fromJson(json['community']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['userImg'] = this.userImg;
    data['desc'] = this.desc;
    data['url'] = this.url;
    data['img'] = this.img;
    data['caption'] = this.caption;
    if (this.tag != null) {
      data['tag'] = this.tag!.map((v) => v!.toJson()).toList();
    }
    data['title'] = this.title;
    data['price'] = this.price;
    data['linkType'] = this.linkType;
    data['link'] = this.link;
    if (this.linkUrls != null) {
      data['linkUrls'] = this.linkUrls!.map((v) => v.toJson()).toList();
    }
    data['isDel'] = this.isDel;
    data['type'] = this.type;
    data['created'] = this.created;
    data['isLike'] = this.isLike;
    data['logoUrl'] = this.logoUrl;
    data['likeCount'] = this.likeCount;
    data['inBucket'] = this.inBucket;
    data['prvUserId'] = this.prvUserId;
    if (this.prvUser != null) {
      data['prvUser'] = this.prvUser!.toJson();
    }
    data['commentCount'] = this.commentCount;
    if (this.lastComment != null) {
      data['lastComment'] = this.lastComment!.toJson();
    }
    data['userId'] = this.userId;
    data['username'] = this.username;
    if (this.bucketData != null) {
      data['bucketData'] = this.bucketData!.map((v) => v!.toJson()).toList();
    }
    data['prvCreated'] = this.prvCreated;
    data['prvProdId'] = this.prvProdId;
    data['brand'] = this.brand;
    data['likeCountLast'] = this.likeCountLast;
    data['isLikeLast'] = this.isLikeLast;
    data['communityName'] = this.communityName;
    data['communityId'] = this.communityId;
    if (this.community != null) {
      data['community'] = this.community!.toJson();
    }
    return data;
  }
}

class PrvUser {


  PrvUser();

PrvUser.fromJson(Map<String, dynamic> json) {}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}

class LastComment {
  List<dynamic>? users;
  bool? isLike;
  int? likeCount;
  int? bucketCount;
  bool? inBucket;
  String? id;
  String? comment;
  String? name;
  String? img;
  String? userId;
  String? brand;
  String? url;
  String? prodImg;
  String? title;
  String? price;
  String? logoUrl;
  String? commentProdId;

  LastComment({this.users, this.isLike, this.likeCount, this.bucketCount, this.inBucket, this.id, this.comment, this.name, this.img, this.userId, this.brand, this.url, this.prodImg, this.title, this.price, this.logoUrl, this.commentProdId});

  LastComment.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <dynamic>[];
      json['users'].forEach((v) { users!.add((v)); });
    }
    isLike = json['isLike'];
    likeCount = json['likeCount'];
    bucketCount = json['bucketCount'];
    inBucket = json['inBucket'];
    id = json['id'];
    comment = json['comment'];
    name = json['name'];
    img = json['img'];
    userId = json['userId'];
    brand = json['brand'];
    url = json['url'];
    prodImg = json['prodImg'];
    title = json['title'];
    price = json['price'];
    logoUrl = json['logoUrl'];
    commentProdId = json['commentProdId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v!.toJson()).toList();
    }
    data['isLike'] = this.isLike;
    data['likeCount'] = this.likeCount;
    data['bucketCount'] = this.bucketCount;
    data['inBucket'] = this.inBucket;
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['name'] = this.name;
    data['img'] = this.img;
    data['userId'] = this.userId;
    data['brand'] = this.brand;
    data['url'] = this.url;
    data['prodImg'] = this.prodImg;
    data['title'] = this.title;
    data['price'] = this.price;
    data['logoUrl'] = this.logoUrl;
    data['commentProdId'] = this.commentProdId;
    return data;
  }
}

class Community {
  String? sId;
  bool? isDel;
  int? status;
  String? userId;
  String? id;
  String? name;
  String? communityName;
  String? desc;
  String? img;
  String? created;
  int? iV;

  Community({this.sId, this.isDel, this.status, this.userId, this.id, this.name, this.communityName, this.desc, this.img, this.created, this.iV});

  Community.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDel = json['isDel'];
    status = json['status'];
    userId = json['userId'];
    id = json['id'];
    name = json['name'];
    communityName = json['communityName'];
    desc = json['desc'];
    img = json['img'];
    created = json['created'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDel'] = this.isDel;
    data['status'] = this.status;
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['communityName'] = this.communityName;
    data['desc'] = this.desc;
    data['img'] = this.img;
    data['created'] = this.created;
    data['__v'] = this.iV;
    return data;
  }
}

class ProductListModel {
  int? status;
  Res? res;
  PrvUser? req;
  String? time;

  ProductListModel({this.status, this.res, this.req, this.time});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    res = json['res'] != null ? new Res.fromJson(json['res']) : null;
    req = json['req'] != null ? new PrvUser.fromJson(json['req']) : null;
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









