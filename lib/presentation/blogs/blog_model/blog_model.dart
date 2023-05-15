// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  BlogModel({
    this.message,
    this.data,
    this.success,
    this.status,
  });

  String? message;
  Data? data;
  bool? success;
  int? status;

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        success: json["success"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
        "success": success,
        "status": status,
      };
}

class Data {
  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum(
      {this.id,
      this.title,
      this.description,
      this.createdBy,
      this.imgPath,
      this.createdAt,
      this.updatedAt,
      this.imagePath,
      this.isFavorite,
      this.textDescriptions,
      this.isLike,
      this.likeCount,
      this.shareCount,
      this.user,
      this.slug,
      this.readingTime,
      this.webViewUrl});

  int? id;
  String? title;
  String? description;
  int? createdBy;
  String? imgPath;
  DateTime? createdAt;
  DateTime? updatedAt;
  var webViewUrl;
  String? imagePath;
  String? readingTime;
  int? isFavorite;
  int? isLike;
  int? likeCount;
  int? shareCount;
  String? textDescriptions;
  String? slug;
  User? user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        webViewUrl: json['blog_description_page'],
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdBy: json["created_by"],
        slug: json["slug"],
        imgPath: json["img_path"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        imagePath: json["image_path"],
        isFavorite: json["is_favorite"],
        textDescriptions: json["text_descriptions"],
        isLike: json["is_like"],
        likeCount: json["like_count"],
        shareCount: json["share_count"],
        readingTime: json["reading_time"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        'blog_description_page': webViewUrl,
        "description": description,
        "created_by": createdBy,
        "img_path": imgPath,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_path": imagePath,
        "is_favorite": isFavorite,
        "text_descriptions": textDescriptions,
        "share_count": shareCount,
        "like_count": likeCount,
        "is_like": isLike,
        "slug": slug,
        "reading_time": readingTime,
        "user": user?.toJson(),
      };
}

class User {
  User({this.id, this.firstName, this.lastName, this.image});

  int? id;
  String? firstName;
  String? lastName;
  String? image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "image": image,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
