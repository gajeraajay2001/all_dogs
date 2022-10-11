import 'package:all_dogs/app/constants/sizeConstant.dart';
import 'package:intl/intl.dart';

class BlogListDataModel {
  int? responseCode;
  Data? data;
  String? message;

  BlogListDataModel({this.responseCode, this.data, this.message});

  BlogListDataModel.fromJson(Map<String, dynamic> json) {
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
  List<Blogs>? blogs;
  int? page;
  int? totalPages;

  Data({this.blogs, this.page, this.totalPages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(new Blogs.fromJson(v));
      });
    }
    page = json['page'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['totalPages'] = this.totalPages;
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
      dateTimePostedAt = DateFormat("yyyy-MM-dd hh:mm:ss").parse(postedAt!);
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
