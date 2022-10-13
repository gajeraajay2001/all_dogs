import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:intl/intl.dart';

class BreedsDetailsModel {
  int? responseCode;
  Data? data;
  String? message;

  BreedsDetailsModel({this.responseCode, this.data, this.message});

  BreedsDetailsModel.fromJson(Map<String, dynamic> json) {
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
  Breed? breed;
  List<Comments>? comments;

  Data({this.breed, this.comments});

  Data.fromJson(Map<String, dynamic> json) {
    breed = json['breed'] != null ? new Breed.fromJson(json['breed']) : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.breed != null) {
      data['breed'] = this.breed!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Breed {
  String? id;
  String? postedAt;
  String? pic;
  String? breedSlug;
  String? title;
  String? body;
  String? filename;

  Breed(
      {this.id,
      this.postedAt,
      this.pic,
      this.breedSlug,
      this.title,
      this.body,
      this.filename});

  Breed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postedAt = json['posted_at'];
    pic = json['pic'];
    breedSlug = json['breedSlug'];
    title = json['title'];
    body = json['body'];
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['posted_at'] = this.postedAt;
    data['pic'] = this.pic;
    data['breedSlug'] = this.breedSlug;
    data['title'] = this.title;
    data['body'] = this.body;
    data['filename'] = this.filename;
    return data;
  }
}

class Comments {
  String? id;
  String? blogId;
  String? breedId;
  String? blogSlug;
  String? breedSlug;
  String? userId;
  String? postedAt;
  DateTime? dateTimePostedAt;
  String? comment;
  String? pic;
  String? name;
  String? email;
  String? mobile;
  String? isEmailVerified;
  String? emailVerificationToken;
  String? newPasswordToken;
  String? password;
  String? createdAt;

  Comments(
      {this.id,
      this.blogId,
      this.breedId,
      this.blogSlug,
      this.breedSlug,
      this.userId,
      this.postedAt,
      this.comment,
      this.pic,
      this.name,
      this.email,
      this.mobile,
      this.isEmailVerified,
      this.emailVerificationToken,
      this.newPasswordToken,
      this.password,
      this.createdAt});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    blogId = json['blog_id'];
    breedId = json['breed_id'];
    blogSlug = json['blogSlug'];
    breedSlug = json['breedSlug'];
    userId = json['user_id'];
    postedAt = json['posted_at'];
    if (!isNullEmptyOrFalse(postedAt)) {
      dateTimePostedAt = DateFormat("yyyy-MM-dd hh:mm:ss").parse(postedAt!);
    }
    comment = json['comment'];
    pic = json['pic'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    isEmailVerified = json['isEmailVerified'];
    emailVerificationToken = json['emailVerificationToken'];
    newPasswordToken = json['newPasswordToken'];
    password = json['password'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['blog_id'] = this.blogId;
    data['breed_id'] = this.breedId;
    data['blogSlug'] = this.blogSlug;
    data['breedSlug'] = this.breedSlug;
    data['user_id'] = this.userId;
    data['posted_at'] = this.postedAt;
    data['comment'] = this.comment;
    data['pic'] = this.pic;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['isEmailVerified'] = this.isEmailVerified;
    data['emailVerificationToken'] = this.emailVerificationToken;
    data['newPasswordToken'] = this.newPasswordToken;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    return data;
  }
}
