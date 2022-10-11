class BreedersListModel {
  int? responseCode;
  BreedersList? data;
  String? message;

  BreedersListModel({this.responseCode, this.data, this.message});

  BreedersListModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    data =
        json['data'] != null ? new BreedersList.fromJson(json['data']) : null;
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

class BreedersList {
  String? search;
  List<Breeders>? breeders;
  int? page;
  int? totalPages;

  BreedersList({this.search, this.breeders, this.page, this.totalPages});

  BreedersList.fromJson(Map<String, dynamic> json) {
    search = json['search'];
    if (json['breeders'] != null) {
      breeders = <Breeders>[];
      json['breeders'].forEach((v) {
        breeders!.add(new Breeders.fromJson(v));
      });
    }
    page = json['page'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['search'] = this.search;
    if (this.breeders != null) {
      data['breeders'] = this.breeders!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class Breeders {
  String? id;
  String? pic;
  String? name;
  String? email;
  String? mobile;
  String? isEmailVerified;
  String? emailVerificationToken;
  String? newPasswordToken;
  String? password;
  String? createdAt;

  Breeders(
      {this.id,
      this.pic,
      this.name,
      this.email,
      this.mobile,
      this.isEmailVerified,
      this.emailVerificationToken,
      this.newPasswordToken,
      this.password,
      this.createdAt});

  Breeders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
