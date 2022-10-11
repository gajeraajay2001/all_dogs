class BreedsListModel {
  int? responseCode;
  BreedsList? data;
  String? message;

  BreedsListModel({this.responseCode, this.data, this.message});

  BreedsListModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    data = json['data'] != null ? new BreedsList.fromJson(json['data']) : null;
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

class BreedsList {
  List<Breeds>? breeds;
  int? page;
  int? totalPages;

  BreedsList({this.breeds, this.page, this.totalPages});

  BreedsList.fromJson(Map<String, dynamic> json) {
    if (json['breeds'] != null) {
      breeds = <Breeds>[];
      json['breeds'].forEach((v) {
        breeds!.add(new Breeds.fromJson(v));
      });
    }
    page = json['page'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.breeds != null) {
      data['breeds'] = this.breeds!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class Breeds {
  String? id;
  String? postedAt;
  String? pic;
  String? breedSlug;
  String? title;
  String? body;
  String? filename;

  Breeds(
      {this.id,
      this.postedAt,
      this.pic,
      this.breedSlug,
      this.title,
      this.body,
      this.filename});

  Breeds.fromJson(Map<String, dynamic> json) {
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
