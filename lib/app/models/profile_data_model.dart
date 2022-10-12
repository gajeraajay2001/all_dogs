class ProfileDataModel {
  int? responseCode;
  Data? data;
  String? message;

  ProfileDataModel({this.responseCode, this.data, this.message});

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? pic;
  String? email;
  String? mobile;
  String? name;

  Data({this.id, this.pic, this.email, this.mobile, this.name});

  Data.fromJson(Map<String, dynamic> json) {
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
