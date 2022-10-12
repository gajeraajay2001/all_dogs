import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:intl/intl.dart';

class HomeScreenDataModel {
  int? responseCode;
  Data? data;
  String? message;

  HomeScreenDataModel({this.responseCode, this.data, this.message});

  HomeScreenDataModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<Posts>? posts;
  List<Blogs>? blogs;
  int? page;
  int? totalPages;
  Data({
    this.posts,
    this.blogs,
    this.page,
    this.totalPages,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(new Blogs.fromJson(v));
      });
    }
    page = json['page'] ?? 1;
    totalPages = json['totalPages'] ?? 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? id;
  String? userId;
  String? title;
  String? body;
  String? createdAt;
  String? breed;
  String? dob;
  DateTime? dateTimeDOB;
  String? location;
  String? video;
  String? available;
  String? views;
  String? likedBy;
  String? pictxt1;
  String? pic1;
  String? pictxt2;
  String? pic2;
  String? pictxt3;
  String? pic3;
  String? pictxt4;
  String? pic4;
  String? pictxt5;
  String? pic5;
  String? pictxt6;
  String? pic6;
  String? pictxt7;
  String? pic7;
  String? pictxt8;
  String? pic8;
  String? pictxt9;
  String? pic9;
  String? pictxt10;
  String? pic10;
  String? pic;
  String? name;
  String? email;
  String? mobile;
  String? postId;
  String? userId2;
  String? postCreated;
  String? userCreated;

  Posts(
      {this.id,
      this.userId,
      this.title,
      this.body,
      this.createdAt,
      this.breed,
      this.dob,
      this.dateTimeDOB,
      this.location,
      this.video,
      this.available,
      this.views,
      this.likedBy,
      this.pictxt1,
      this.pic1,
      this.pictxt2,
      this.pic2,
      this.pictxt3,
      this.pic3,
      this.pictxt4,
      this.pic4,
      this.pictxt5,
      this.pic5,
      this.pictxt6,
      this.pic6,
      this.pictxt7,
      this.pic7,
      this.pictxt8,
      this.pic8,
      this.pictxt9,
      this.pic9,
      this.pictxt10,
      this.pic10,
      this.pic,
      this.name,
      this.email,
      this.mobile,
      this.postId,
      this.userId2,
      this.postCreated,
      this.userCreated});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    body = json['body'];
    createdAt = json['created_at'];
    breed = json['breed'];
    dob = json['dob'];
    if (!isNullEmptyOrFalse(dob)) {
      dateTimeDOB = DateFormat("yyyy-MM-dd").parse(dob.toString());
    }
    location = json['location'];
    video = json['video'];
    available = json['available'];
    views = json['views'];
    likedBy = json['liked_by'];
    pictxt1 = json['pictxt1'];
    pic1 = json['pic1'];
    pictxt2 = json['pictxt2'];
    pic2 = json['pic2'];
    pictxt3 = json['pictxt3'];
    pic3 = json['pic3'];
    pictxt4 = json['pictxt4'];
    pic4 = json['pic4'];
    pictxt5 = json['pictxt5'];
    pic5 = json['pic5'];
    pictxt6 = json['pictxt6'];
    pic6 = json['pic6'];
    pictxt7 = json['pictxt7'];
    pic7 = json['pic7'];
    pictxt8 = json['pictxt8'];
    pic8 = json['pic8'];
    pictxt9 = json['pictxt9'];
    pic9 = json['pic9'];
    pictxt10 = json['pictxt10'];
    pic10 = json['pic10'];
    pic = json['pic'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    postId = json['postId'];
    userId2 = json['userId'];
    postCreated = json['postCreated'];
    userCreated = json['userCreated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['created_at'] = this.createdAt;
    data['breed'] = this.breed;
    data['dob'] = this.dob;
    data['location'] = this.location;
    data['video'] = this.video;
    data['available'] = this.available;
    data['views'] = this.views;
    data['liked_by'] = this.likedBy;
    data['pictxt1'] = this.pictxt1;
    data['pic1'] = this.pic1;
    data['pictxt2'] = this.pictxt2;
    data['pic2'] = this.pic2;
    data['pictxt3'] = this.pictxt3;
    data['pic3'] = this.pic3;
    data['pictxt4'] = this.pictxt4;
    data['pic4'] = this.pic4;
    data['pictxt5'] = this.pictxt5;
    data['pic5'] = this.pic5;
    data['pictxt6'] = this.pictxt6;
    data['pic6'] = this.pic6;
    data['pictxt7'] = this.pictxt7;
    data['pic7'] = this.pic7;
    data['pictxt8'] = this.pictxt8;
    data['pic8'] = this.pic8;
    data['pictxt9'] = this.pictxt9;
    data['pic9'] = this.pic9;
    data['pictxt10'] = this.pictxt10;
    data['pic10'] = this.pic10;
    data['pic'] = this.pic;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['postId'] = this.postId;
    data['userId'] = this.userId;
    data['postCreated'] = this.postCreated;
    data['userCreated'] = this.userCreated;
    return data;
  }
}

class Blogs {
  String? id;
  String? postedAt;
  DateTime? dateTimePostedAt;
  String? pic;
  String? blogSlug;
  String? title;
  String? body;
  String? filename;

  Blogs(
      {this.id,
      this.postedAt,
      this.dateTimePostedAt,
      this.pic,
      this.blogSlug,
      this.title,
      this.body,
      this.filename});

  Blogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postedAt = json['posted_at'];
    if (!isNullEmptyOrFalse(postedAt)) {
      dateTimePostedAt =
          DateFormat("yyyy-MM-dd hh:mm:ss").parse(postedAt.toString());
    }
    pic = json['pic'];
    blogSlug = json['blogSlug'];
    title = json['title'];
    body = json['body'];
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['posted_at'] = this.postedAt;
    data['pic'] = this.pic;
    data['blogSlug'] = this.blogSlug;
    data['title'] = this.title;
    data['body'] = this.body;
    data['filename'] = this.filename;
    return data;
  }
}
