import 'dart:convert';

/// kind : "boolean"
/// facility_name : "Restaurant"
/// facilitytype_id : 7
/// hotelfacilitytype_id : 3
/// roomfacilitytype_id : ""
/// facilitytype_name : "Food & Drink"
/// is_common_room_facility : 0
/// value : 1
/// hotel_id : 1676161

HotelAmentiesModel hotelAmentiesModelFromJson(String str) =>
    HotelAmentiesModel.fromJson(json.decode(str));
String hotelAmentiesModelToJson(HotelAmentiesModel data) =>
    json.encode(data.toJson());

class HotelAmentiesModel {
  HotelAmentiesModel({
    String? kind,
    String? facilityName,
    num? facilitytypeId,
    num? hotelfacilitytypeId,
    String? roomfacilitytypeId,
    String? facilitytypeName,
    num? isCommonRoomFacility,
    num? value,
    num? hotelId,
  }) {
    _kind = kind;
    _facilityName = facilityName;
    _facilitytypeId = facilitytypeId;
    _hotelfacilitytypeId = hotelfacilitytypeId;
    _roomfacilitytypeId = roomfacilitytypeId;
    _facilitytypeName = facilitytypeName;
    _isCommonRoomFacility = isCommonRoomFacility;
    _value = value;
    _hotelId = hotelId;
  }

  HotelAmentiesModel.fromJson(dynamic json) {
    _kind = json['kind'];
    _facilityName = json['facility_name'];
    _facilitytypeId = json['facilitytype_id'];
    _hotelfacilitytypeId = json['hotelfacilitytype_id'];
    _roomfacilitytypeId = json['roomfacilitytype_id'];
    _facilitytypeName = json['facilitytype_name'];
    _isCommonRoomFacility = json['is_common_room_facility'];
    _value = json['value'];
    _hotelId = json['hotel_id'];
  }
  String? _kind;
  String? _facilityName;
  num? _facilitytypeId;
  num? _hotelfacilitytypeId;
  String? _roomfacilitytypeId;
  String? _facilitytypeName;
  num? _isCommonRoomFacility;
  num? _value;
  num? _hotelId;
  HotelAmentiesModel copyWith({
    String? kind,
    String? facilityName,
    num? facilitytypeId,
    num? hotelfacilitytypeId,
    String? roomfacilitytypeId,
    String? facilitytypeName,
    num? isCommonRoomFacility,
    num? value,
    num? hotelId,
  }) =>
      HotelAmentiesModel(
        kind: kind ?? _kind,
        facilityName: facilityName ?? _facilityName,
        facilitytypeId: facilitytypeId ?? _facilitytypeId,
        hotelfacilitytypeId: hotelfacilitytypeId ?? _hotelfacilitytypeId,
        roomfacilitytypeId: roomfacilitytypeId ?? _roomfacilitytypeId,
        facilitytypeName: facilitytypeName ?? _facilitytypeName,
        isCommonRoomFacility: isCommonRoomFacility ?? _isCommonRoomFacility,
        value: value ?? _value,
        hotelId: hotelId ?? _hotelId,
      );
  String? get kind => _kind;
  String? get facilityName => _facilityName;
  num? get facilitytypeId => _facilitytypeId;
  num? get hotelfacilitytypeId => _hotelfacilitytypeId;
  String? get roomfacilitytypeId => _roomfacilitytypeId;
  String? get facilitytypeName => _facilitytypeName;
  num? get isCommonRoomFacility => _isCommonRoomFacility;
  num? get value => _value;
  num? get hotelId => _hotelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = _kind;
    map['facility_name'] = _facilityName;
    map['facilitytype_id'] = _facilitytypeId;
    map['hotelfacilitytype_id'] = _hotelfacilitytypeId;
    map['roomfacilitytype_id'] = _roomfacilitytypeId;
    map['facilitytype_name'] = _facilitytypeName;
    map['is_common_room_facility'] = _isCommonRoomFacility;
    map['value'] = _value;
    map['hotel_id'] = _hotelId;
    return map;
  }
}
