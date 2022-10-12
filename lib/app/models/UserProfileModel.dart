class UserProfileModel {
  int? responseCode;
  UserProfile? data;
  String? message;

  UserProfileModel({this.responseCode, this.data, this.message});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    data = json['data'] != null ? new UserProfile.fromJson(json['data']) : null;
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

class UserProfile {
  String? id;
  String? pic;
  String? email;
  String? mobile;
  String? name;

  UserProfile({this.id, this.pic, this.email, this.mobile, this.name});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pic = json['pic'];
    email = json['email'];
    mobile = json['mobile'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pic'] = this.pic;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    return data;
  }
}
