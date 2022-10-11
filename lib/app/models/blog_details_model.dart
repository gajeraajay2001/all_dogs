class BlogDetailsModel {
  int? responseCode;
  Data? data;
  String? message;

  BlogDetailsModel({this.responseCode, this.data, this.message});

  BlogDetailsModel.fromJson(Map<String, dynamic> json) {
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
  Blog? blog;
  List<Comments>? comments;

  Data({this.blog, this.comments});

  Data.fromJson(Map<String, dynamic> json) {
    blog = json['blog'] != null ? new Blog.fromJson(json['blog']) : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.blog != null) {
      data['blog'] = this.blog!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Blog {
  String? id;
  String? postedAt;
  String? pic;
  String? blogSlug;
  String? title;
  String? body;
  String? filename;

  Blog(
      {this.id,
      this.postedAt,
      this.pic,
      this.blogSlug,
      this.title,
      this.body,
      this.filename});

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postedAt = json['posted_at'];
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

class Comments {
  String? id;
  Null? blogId;
  Null? breedId;
  String? blogSlug;
  Null? breedSlug;
  String? userId;
  String? postedAt;
  String? comment;
  Null? pic;
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
