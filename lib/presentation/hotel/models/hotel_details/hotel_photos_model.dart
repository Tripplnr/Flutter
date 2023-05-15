import 'dart:convert';

/// descriptiontype_id : 1
/// ml_tags : [{"photo_id":331395602,"tag_id":19,"tag_type":"ml_tags","tag_name":"Property building","confidence":93}]
/// photo_id : 331395602
/// tags : [{"tag":"Property building","id":3},{"tag":"Property","id":1000000001}]
/// url_square60 : "https://cf.bstatic.com/xdata/images/hotel/square60/331395602.jpg?k=469cc9865e3ee3d32bc8f9916c293bc82b754b778c3436ff19c2b2b069870a14&o="
/// url_max : "https://cf.bstatic.com/xdata/images/hotel/max1280x900/331395602.jpg?k=469cc9865e3ee3d32bc8f9916c293bc82b754b778c3436ff19c2b2b069870a14&o="
/// url_1440 : "https://cf.bstatic.com/xdata/images/hotel/1440x1440/331395602.jpg?k=469cc9865e3ee3d32bc8f9916c293bc82b754b778c3436ff19c2b2b069870a14&o="

HotelPhotosModel hotelPhotosFromJson(String str) =>
    HotelPhotosModel.fromJson(json.decode(str));
String hotelPhotosToJson(HotelPhotosModel data) => json.encode(data.toJson());

class HotelPhotosModel {
  HotelPhotosModel({
    num? descriptiontypeId,
    List<MlTags>? mlTags,
    num? photoId,
    List<Tags>? tags,
    String? urlSquare60,
    String? urlMax,
    String? url1440,
  }) {
    _descriptiontypeId = descriptiontypeId;
    _mlTags = mlTags;
    _photoId = photoId;
    _tags = tags;
    _urlSquare60 = urlSquare60;
    _urlMax = urlMax;
    _url1440 = url1440;
  }

  HotelPhotosModel.fromJson(dynamic json) {
    _descriptiontypeId = json['descriptiontype_id'];
    if (json['ml_tags'] != null) {
      _mlTags = [];
      json['ml_tags'].forEach((v) {
        _mlTags?.add(MlTags.fromJson(v));
      });
    }
    _photoId = json['photo_id'];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
    _urlSquare60 = json['url_square60'];
    _urlMax = json['url_max'];
    _url1440 = json['url_1440'];
  }
  num? _descriptiontypeId;
  List<MlTags>? _mlTags;
  num? _photoId;
  List<Tags>? _tags;
  String? _urlSquare60;
  String? _urlMax;
  String? _url1440;
  HotelPhotosModel copyWith({
    num? descriptiontypeId,
    List<MlTags>? mlTags,
    num? photoId,
    List<Tags>? tags,
    String? urlSquare60,
    String? urlMax,
    String? url1440,
  }) =>
      HotelPhotosModel(
        descriptiontypeId: descriptiontypeId ?? _descriptiontypeId,
        mlTags: mlTags ?? _mlTags,
        photoId: photoId ?? _photoId,
        tags: tags ?? _tags,
        urlSquare60: urlSquare60 ?? _urlSquare60,
        urlMax: urlMax ?? _urlMax,
        url1440: url1440 ?? _url1440,
      );
  num? get descriptiontypeId => _descriptiontypeId;
  List<MlTags>? get mlTags => _mlTags;
  num? get photoId => _photoId;
  List<Tags>? get tags => _tags;
  String? get urlSquare60 => _urlSquare60;
  String? get urlMax => _urlMax;
  String? get url1440 => _url1440;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['descriptiontype_id'] = _descriptiontypeId;
    if (_mlTags != null) {
      map['ml_tags'] = _mlTags?.map((v) => v.toJson()).toList();
    }
    map['photo_id'] = _photoId;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    map['url_square60'] = _urlSquare60;
    map['url_max'] = _urlMax;
    map['url_1440'] = _url1440;
    return map;
  }
}

/// tag : "Property building"
/// id : 3

Tags tagsFromJson(String str) => Tags.fromJson(json.decode(str));
String tagsToJson(Tags data) => json.encode(data.toJson());

class Tags {
  Tags({
    String? tag,
    num? id,
  }) {
    _tag = tag;
    _id = id;
  }

  Tags.fromJson(dynamic json) {
    _tag = json['tag'];
    _id = json['id'];
  }
  String? _tag;
  num? _id;
  Tags copyWith({
    String? tag,
    num? id,
  }) =>
      Tags(
        tag: tag ?? _tag,
        id: id ?? _id,
      );
  String? get tag => _tag;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tag'] = _tag;
    map['id'] = _id;
    return map;
  }
}

/// photo_id : 331395602
/// tag_id : 19
/// tag_type : "ml_tags"
/// tag_name : "Property building"
/// confidence : 93

MlTags mlTagsFromJson(String str) => MlTags.fromJson(json.decode(str));
String mlTagsToJson(MlTags data) => json.encode(data.toJson());

class MlTags {
  MlTags({
    num? photoId,
    num? tagId,
    String? tagType,
    String? tagName,
    num? confidence,
  }) {
    _photoId = photoId;
    _tagId = tagId;
    _tagType = tagType;
    _tagName = tagName;
    _confidence = confidence;
  }

  MlTags.fromJson(dynamic json) {
    _photoId = json['photo_id'];
    _tagId = json['tag_id'];
    _tagType = json['tag_type'];
    _tagName = json['tag_name'];
    _confidence = json['confidence'];
  }
  num? _photoId;
  num? _tagId;
  String? _tagType;
  String? _tagName;
  num? _confidence;
  MlTags copyWith({
    num? photoId,
    num? tagId,
    String? tagType,
    String? tagName,
    num? confidence,
  }) =>
      MlTags(
        photoId: photoId ?? _photoId,
        tagId: tagId ?? _tagId,
        tagType: tagType ?? _tagType,
        tagName: tagName ?? _tagName,
        confidence: confidence ?? _confidence,
      );
  num? get photoId => _photoId;
  num? get tagId => _tagId;
  String? get tagType => _tagType;
  String? get tagName => _tagName;
  num? get confidence => _confidence;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['photo_id'] = _photoId;
    map['tag_id'] = _tagId;
    map['tag_type'] = _tagType;
    map['tag_name'] = _tagName;
    map['confidence'] = _confidence;
    return map;
  }
}
