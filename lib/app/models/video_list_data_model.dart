import 'package:intl/intl.dart';

import '../constants/sizeConstant.dart';

class VideoDataModel {
  int? responseCode;
  Data? data;
  String? message;

  VideoDataModel({this.responseCode, this.data, this.message});

  VideoDataModel.fromJson(Map<String, dynamic> json) {
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
  List<Videos>? videos;
  int? page;
  int? totalPages;

  Data({this.videos, this.page, this.totalPages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
    page = json['page'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class Videos {
  String? id;
  String? videoUrl;
  String? title;
  String? createdAt;
  DateTime? dateTimeCreatedAt;

  Videos(
      {this.id,
      this.videoUrl,
      this.title,
      this.createdAt,
      this.dateTimeCreatedAt});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoUrl = json['video_url'];
    title = json['title'];
    createdAt = json['created_at'];
    if (!isNullEmptyOrFalse(createdAt)) {
      dateTimeCreatedAt =
          DateFormat("yyyy-MM-dd hh:mm:ss").parse(createdAt.toString());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video_url'] = this.videoUrl;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    return data;
  }
}
