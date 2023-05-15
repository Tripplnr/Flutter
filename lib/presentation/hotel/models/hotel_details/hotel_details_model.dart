import 'dart:convert';

/// entrance_photo_url : "https://cf.bstatic.com/images/hotel/square60/255/255182766.jpg"
/// main_photo_url : "https://cf.bstatic.com/images/hotel/square60/255/255182763.jpg"
/// hotel_id : 5628555
/// country : "Iceland"
/// hotel_facilities_filtered : "14,15,16,19,26,43,49,70,76,80,82,86,100,110,118,127,158,163,170,173,219,222,224,305,404,422,425,435,439,440,441,442,443,446,448,449,450,451,454,455,457,459,460,461,462,464,465,467,468,485,489,490,491,493,496,502,503,506"
/// description_translations : [{"descriptiontype_id":6,"languagecode":"en-gb","description":"Boasting a garden and a terrace, Sky sighting Iglúhús - Stay'in Árbakki provides accommodation in Litli-Árskógssandur with free WiFi and sea views. Featuring free private parking, the luxury tent is in an area where guests can engage in activities such as hiking, skiing and fishing.\n\nGuests at the luxury tent can enjoy a vegetarian breakfast.\n\nCycling can be enjoyed nearby.\n\nHof - Cultural Center and Conference Hall is 34 km from Sky sighting Iglúhús - Stay'in Árbakki. The nearest airport is Akureyri Airport, 36 km from the accommodation."}]
/// maxrate : 150.0
/// is_vacation_rental : 0
/// url : "https://www.booking.com/hotel/is/northern-lights-igluhus.html"
/// languages_spoken : {"languagecode":["en-gb","fr"]}
/// main_photo_id : 255182763
/// currencycode : "EUR"
/// preferred_plus : 0
/// is_single_unit_vr : 1
/// checkin : {"to":"20:00","24_hour_available":0,"from":"16:00"}
/// minrate : 150.0
/// preferred : 0
/// countrycode : "is"
/// email : ""
/// review_nr : 98
/// review_score : "8.9"
/// city_id : -2649867
/// zip : "621"
/// hotel_facilities : "2,14,15,16,19,26,43,46,47,49,70,76,80,82,86,96,100,107,110,118,127,158,161,163,170,173,219,222,224,305,404,422,425,435,439,440,441,442,443,446,448,449,450,451,454,455,457,459,460,461,462,464,465,467,468,485,489,490,491,493,496,502,503,506"
/// district : null
/// hoteltype_id : 224
/// review_score_word : "Fabulous"
/// calass : 0.0
/// booking_home : {"segment":0,"is_single_unit_property":1,"is_vacation_rental":1,"quality_class":null,"group":"hotels_and_others","is_aparthotel":0,"is_single_type_property":1,"is_booking_home":1}
/// checkout : {"to":"11:00","24_hour_available":0,"from":""}
/// address : "Árbakka"
/// ranking : 7036095
/// district_id : null
/// city : "Litli-Árskógssandur"
/// location : {"latitude":65.942973,"longitude":-18.351753}
/// name : "Sky sighting Iglúhús - Stay'in Árbakki"
/// class_is_estimated : 0

HotelDetails hotelDetailsFromJson(String str) =>
    HotelDetails.fromJson(json.decode(str));
String hotelDetailsToJson(HotelDetails data) => json.encode(data.toJson());

class HotelDetails {
  HotelDetails({
    String? entrancePhotoUrl,
    String? mainPhotoUrl,
    num? hotelId,
    String? country,
    String? hotelFacilitiesFiltered,
    List<DescriptionTranslations>? descriptionTranslations,
    num? maxrate,
    num? isVacationRental,
    String? url,
    LanguagesSpoken? languagesSpoken,
    num? mainPhotoId,
    String? currencycode,
    num? preferredPlus,
    num? isSingleUnitVr,
    Checkin? checkin,
    num? minrate,
    num? preferred,
    String? countrycode,
    String? email,
    num? reviewNr,
    String? reviewScore,
    num? cityId,
    String? zip,
    String? hotelFacilities,
    dynamic district,
    num? hoteltypeId,
    String? reviewScoreWord,
    num? calass,
    BookingHome? bookingHome,
    Checkout? checkout,
    String? address,
    num? ranking,
    dynamic districtId,
    String? city,
    Location? location,
    String? name,
    num? classIsEstimated,
  }) {
    _entrancePhotoUrl = entrancePhotoUrl;
    _mainPhotoUrl = mainPhotoUrl;
    _hotelId = hotelId;
    _country = country;
    _hotelFacilitiesFiltered = hotelFacilitiesFiltered;
    _descriptionTranslations = descriptionTranslations;
    _maxrate = maxrate;
    _isVacationRental = isVacationRental;
    _url = url;
    _languagesSpoken = languagesSpoken;
    _mainPhotoId = mainPhotoId;
    _currencycode = currencycode;
    _preferredPlus = preferredPlus;
    _isSingleUnitVr = isSingleUnitVr;
    _checkin = checkin;
    _minrate = minrate;
    _preferred = preferred;
    _countrycode = countrycode;
    _email = email;
    _reviewNr = reviewNr;
    _reviewScore = reviewScore;
    _cityId = cityId;
    _zip = zip;
    _hotelFacilities = hotelFacilities;
    _district = district;
    _hoteltypeId = hoteltypeId;
    _reviewScoreWord = reviewScoreWord;
    _class = calass;
    _bookingHome = bookingHome;
    _checkout = checkout;
    _address = address;
    _ranking = ranking;
    _districtId = districtId;
    _city = city;
    _location = location;
    _name = name;
    _classIsEstimated = classIsEstimated;
  }

  HotelDetails.fromJson(dynamic json) {
    _entrancePhotoUrl = json['entrance_photo_url'];
    _mainPhotoUrl = json['main_photo_url'];
    _hotelId = json['hotel_id'];
    _country = json['country'] ?? "";
    _hotelFacilitiesFiltered = json['hotel_facilities_filtered'];
    if (json['description_translations'] != null) {
      _descriptionTranslations = [];
      json['description_translations'].forEach((v) {
        _descriptionTranslations?.add(DescriptionTranslations.fromJson(v));
      });
    }
    _maxrate = json['maxrate'];
    _isVacationRental = json['is_vacation_rental'];
    _url = json['url'];
    _languagesSpoken = json['languages_spoken'] != null
        ? LanguagesSpoken.fromJson(json['languages_spoken'])
        : null;
    _mainPhotoId = json['main_photo_id'];
    _currencycode = json['currencycode'];
    _preferredPlus = json['preferred_plus'];
    _isSingleUnitVr = json['is_single_unit_vr'];
    _checkin =
        json['checkin'] != null ? Checkin.fromJson(json['checkin']) : null;
    _minrate = json['minrate'];
    _preferred = json['preferred'];
    _countrycode = json['countrycode'];
    _email = json['email'];
    _reviewNr = json['review_nr'];
    _reviewScore = json['review_score'] ?? "0.0";
    _cityId = json['city_id'];
    _zip = json['zip'];
    _hotelFacilities = json['hotel_facilities'];
    _district = json['district'];
    _hoteltypeId = json['hoteltype_id'];
    _reviewScoreWord = json['review_score_word'] ?? "";
    _class = json['class'];
    _bookingHome = json['booking_home'] != null
        ? BookingHome.fromJson(json['booking_home'])
        : null;
    _checkout =
        json['checkout'] != null ? Checkout.fromJson(json['checkout']) : null;
    _address = json['address'];
    _ranking = json['ranking'];
    _districtId = json['district_id'];
    _city = json['city'] ?? "";
    _location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    _name = json['name'] ?? "";
    _classIsEstimated = json['class_is_estimated'];
  }
  String? _entrancePhotoUrl;
  String? _mainPhotoUrl;
  num? _hotelId;
  String? _country;
  String? _hotelFacilitiesFiltered;
  List<DescriptionTranslations>? _descriptionTranslations;
  num? _maxrate;
  num? _isVacationRental;
  String? _url;
  LanguagesSpoken? _languagesSpoken;
  num? _mainPhotoId;
  String? _currencycode;
  num? _preferredPlus;
  num? _isSingleUnitVr;
  Checkin? _checkin;
  num? _minrate;
  num? _preferred;
  String? _countrycode;
  String? _email;
  num? _reviewNr;
  String? _reviewScore;
  num? _cityId;
  String? _zip;
  String? _hotelFacilities;
  dynamic _district;
  num? _hoteltypeId;
  String? _reviewScoreWord;
  num? _class;
  BookingHome? _bookingHome;
  Checkout? _checkout;
  String? _address;
  num? _ranking;
  dynamic _districtId;
  String? _city;
  Location? _location;
  String? _name;
  num? _classIsEstimated;
  HotelDetails copyWith({
    String? entrancePhotoUrl,
    String? mainPhotoUrl,
    num? hotelId,
    String? country,
    String? hotelFacilitiesFiltered,
    List<DescriptionTranslations>? descriptionTranslations,
    num? maxrate,
    num? isVacationRental,
    String? url,
    LanguagesSpoken? languagesSpoken,
    num? mainPhotoId,
    String? currencycode,
    num? preferredPlus,
    num? isSingleUnitVr,
    Checkin? checkin,
    num? minrate,
    num? preferred,
    String? countrycode,
    String? email,
    num? reviewNr,
    String? reviewScore,
    num? cityId,
    String? zip,
    String? hotelFacilities,
    dynamic district,
    num? hoteltypeId,
    String? reviewScoreWord,
    num? calass,
    BookingHome? bookingHome,
    Checkout? checkout,
    String? address,
    num? ranking,
    dynamic districtId,
    String? city,
    Location? location,
    String? name,
    num? classIsEstimated,
  }) =>
      HotelDetails(
        entrancePhotoUrl: entrancePhotoUrl ?? _entrancePhotoUrl,
        mainPhotoUrl: mainPhotoUrl ?? _mainPhotoUrl,
        hotelId: hotelId ?? _hotelId,
        country: country ?? _country,
        hotelFacilitiesFiltered:
            hotelFacilitiesFiltered ?? _hotelFacilitiesFiltered,
        descriptionTranslations:
            descriptionTranslations ?? _descriptionTranslations,
        maxrate: maxrate ?? _maxrate,
        isVacationRental: isVacationRental ?? _isVacationRental,
        url: url ?? _url,
        languagesSpoken: languagesSpoken ?? _languagesSpoken,
        mainPhotoId: mainPhotoId ?? _mainPhotoId,
        currencycode: currencycode ?? _currencycode,
        preferredPlus: preferredPlus ?? _preferredPlus,
        isSingleUnitVr: isSingleUnitVr ?? _isSingleUnitVr,
        checkin: checkin ?? _checkin,
        minrate: minrate ?? _minrate,
        preferred: preferred ?? _preferred,
        countrycode: countrycode ?? _countrycode,
        email: email ?? _email,
        reviewNr: reviewNr ?? _reviewNr,
        reviewScore: reviewScore ?? _reviewScore,
        cityId: cityId ?? _cityId,
        zip: zip ?? _zip,
        hotelFacilities: hotelFacilities ?? _hotelFacilities,
        district: district ?? _district,
        hoteltypeId: hoteltypeId ?? _hoteltypeId,
        reviewScoreWord: reviewScoreWord ?? _reviewScoreWord,
        calass: calass ?? _class,
        bookingHome: bookingHome ?? _bookingHome,
        checkout: checkout ?? _checkout,
        address: address ?? _address,
        ranking: ranking ?? _ranking,
        districtId: districtId ?? _districtId,
        city: city ?? _city,
        location: location ?? _location,
        name: name ?? _name,
        classIsEstimated: classIsEstimated ?? _classIsEstimated,
      );
  String? get entrancePhotoUrl => _entrancePhotoUrl;
  String? get mainPhotoUrl => _mainPhotoUrl;
  num? get hotelId => _hotelId;
  String? get country => _country;
  String? get hotelFacilitiesFiltered => _hotelFacilitiesFiltered;
  List<DescriptionTranslations>? get descriptionTranslations =>
      _descriptionTranslations;
  num? get maxrate => _maxrate;
  num? get isVacationRental => _isVacationRental;
  String? get url => _url;
  LanguagesSpoken? get languagesSpoken => _languagesSpoken;
  num? get mainPhotoId => _mainPhotoId;
  String? get currencycode => _currencycode;
  num? get preferredPlus => _preferredPlus;
  num? get isSingleUnitVr => _isSingleUnitVr;
  Checkin? get checkin => _checkin;
  num? get minrate => _minrate;
  num? get preferred => _preferred;
  String? get countrycode => _countrycode;
  String? get email => _email;
  num? get reviewNr => _reviewNr;
  String? get reviewScore => _reviewScore;
  num? get cityId => _cityId;
  String? get zip => _zip;
  String? get hotelFacilities => _hotelFacilities;
  dynamic get district => _district;
  num? get hoteltypeId => _hoteltypeId;
  String? get reviewScoreWord => _reviewScoreWord;
  num? get calass => _class;
  BookingHome? get bookingHome => _bookingHome;
  Checkout? get checkout => _checkout;
  String? get address => _address;
  num? get ranking => _ranking;
  dynamic get districtId => _districtId;
  String? get city => _city;
  Location? get location => _location;
  String? get name => _name;
  num? get classIsEstimated => _classIsEstimated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['entrance_photo_url'] = _entrancePhotoUrl;
    map['main_photo_url'] = _mainPhotoUrl;
    map['hotel_id'] = _hotelId;
    map['country'] = _country;
    map['hotel_facilities_filtered'] = _hotelFacilitiesFiltered;
    if (_descriptionTranslations != null) {
      map['description_translations'] =
          _descriptionTranslations?.map((v) => v.toJson()).toList();
    }
    map['maxrate'] = _maxrate;
    map['is_vacation_rental'] = _isVacationRental;
    map['url'] = _url;
    if (_languagesSpoken != null) {
      map['languages_spoken'] = _languagesSpoken?.toJson();
    }
    map['main_photo_id'] = _mainPhotoId;
    map['currencycode'] = _currencycode;
    map['preferred_plus'] = _preferredPlus;
    map['is_single_unit_vr'] = _isSingleUnitVr;
    if (_checkin != null) {
      map['checkin'] = _checkin?.toJson();
    }
    map['minrate'] = _minrate;
    map['preferred'] = _preferred;
    map['countrycode'] = _countrycode;
    map['email'] = _email;
    map['review_nr'] = _reviewNr;
    map['review_score'] = _reviewScore;
    map['city_id'] = _cityId;
    map['zip'] = _zip;
    map['hotel_facilities'] = _hotelFacilities;
    map['district'] = _district;
    map['hoteltype_id'] = _hoteltypeId;
    map['review_score_word'] = _reviewScoreWord;
    map['calass'] = _class;
    if (_bookingHome != null) {
      map['booking_home'] = _bookingHome?.toJson();
    }
    if (_checkout != null) {
      map['checkout'] = _checkout?.toJson();
    }
    map['address'] = _address;
    map['ranking'] = _ranking;
    map['district_id'] = _districtId;
    map['city'] = _city;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['name'] = _name;
    map['class_is_estimated'] = _classIsEstimated;
    return map;
  }
}

/// latitude : 65.942973
/// longitude : -18.351753

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({
    num? latitude,
    num? longitude,
  }) {
    _latitude = latitude;
    _longitude = longitude;
  }

  Location.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  num? _latitude;
  num? _longitude;
  Location copyWith({
    num? latitude,
    num? longitude,
  }) =>
      Location(
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
      );
  num? get latitude => _latitude;
  num? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }
}

/// to : "11:00"
/// 24_hour_available : 0
/// from : ""

Checkout checkoutFromJson(String str) => Checkout.fromJson(json.decode(str));
String checkoutToJson(Checkout data) => json.encode(data.toJson());

class Checkout {
  Checkout({
    String? to,
    num? HourAvailable,
    String? from,
  }) {
    _to = to;
    _HourAvailable = HourAvailable;
    _from = from;
  }

  Checkout.fromJson(dynamic json) {
    _to = json['to'];
    _HourAvailable = json['24_hour_available'];
    _from = json['from'];
  }
  String? _to;
  num? _HourAvailable;
  String? _from;
  Checkout copyWith({
    String? to,
    num? HourAvailable,
    String? from,
  }) =>
      Checkout(
        to: to ?? _to,
        HourAvailable: HourAvailable ?? _HourAvailable,
        from: from ?? _from,
      );
  String? get to => _to;
  num? get HourAvailable => _HourAvailable;
  String? get from => _from;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['to'] = _to;
    map['24_hour_available'] = _HourAvailable;
    map['from'] = _from;
    return map;
  }
}

/// segment : 0
/// is_single_unit_property : 1
/// is_vacation_rental : 1
/// quality_class : null
/// group : "hotels_and_others"
/// is_aparthotel : 0
/// is_single_type_property : 1
/// is_booking_home : 1

BookingHome bookingHomeFromJson(String str) =>
    BookingHome.fromJson(json.decode(str));
String bookingHomeToJson(BookingHome data) => json.encode(data.toJson());

class BookingHome {
  BookingHome({
    num? segment,
    num? isSingleUnitProperty,
    num? isVacationRental,
    dynamic qualityClass,
    String? group,
    num? isAparthotel,
    num? isSingleTypeProperty,
    num? isBookingHome,
  }) {
    _segment = segment;
    _isSingleUnitProperty = isSingleUnitProperty;
    _isVacationRental = isVacationRental;
    _qualityClass = qualityClass;
    _group = group;
    _isAparthotel = isAparthotel;
    _isSingleTypeProperty = isSingleTypeProperty;
    _isBookingHome = isBookingHome;
  }

  BookingHome.fromJson(dynamic json) {
    _segment = json['segment'];
    _isSingleUnitProperty = json['is_single_unit_property'];
    _isVacationRental = json['is_vacation_rental'];
    _qualityClass = json['quality_class'];
    _group = json['group'];
    _isAparthotel = json['is_aparthotel'];
    _isSingleTypeProperty = json['is_single_type_property'];
    _isBookingHome = json['is_booking_home'];
  }
  num? _segment;
  num? _isSingleUnitProperty;
  num? _isVacationRental;
  dynamic _qualityClass;
  String? _group;
  num? _isAparthotel;
  num? _isSingleTypeProperty;
  num? _isBookingHome;
  BookingHome copyWith({
    num? segment,
    num? isSingleUnitProperty,
    num? isVacationRental,
    dynamic qualityClass,
    String? group,
    num? isAparthotel,
    num? isSingleTypeProperty,
    num? isBookingHome,
  }) =>
      BookingHome(
        segment: segment ?? _segment,
        isSingleUnitProperty: isSingleUnitProperty ?? _isSingleUnitProperty,
        isVacationRental: isVacationRental ?? _isVacationRental,
        qualityClass: qualityClass ?? _qualityClass,
        group: group ?? _group,
        isAparthotel: isAparthotel ?? _isAparthotel,
        isSingleTypeProperty: isSingleTypeProperty ?? _isSingleTypeProperty,
        isBookingHome: isBookingHome ?? _isBookingHome,
      );
  num? get segment => _segment;
  num? get isSingleUnitProperty => _isSingleUnitProperty;
  num? get isVacationRental => _isVacationRental;
  dynamic get qualityClass => _qualityClass;
  String? get group => _group;
  num? get isAparthotel => _isAparthotel;
  num? get isSingleTypeProperty => _isSingleTypeProperty;
  num? get isBookingHome => _isBookingHome;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['segment'] = _segment;
    map['is_single_unit_property'] = _isSingleUnitProperty;
    map['is_vacation_rental'] = _isVacationRental;
    map['quality_class'] = _qualityClass;
    map['group'] = _group;
    map['is_aparthotel'] = _isAparthotel;
    map['is_single_type_property'] = _isSingleTypeProperty;
    map['is_booking_home'] = _isBookingHome;
    return map;
  }
}

/// to : "20:00"
/// 24_hour_available : 0
/// from : "16:00"

Checkin checkinFromJson(String str) => Checkin.fromJson(json.decode(str));
String checkinToJson(Checkin data) => json.encode(data.toJson());

class Checkin {
  Checkin({
    String? to,
    num? HourAvailable,
    String? from,
  }) {
    _to = to;
    _HourAvailable = HourAvailable;
    _from = from;
  }

  Checkin.fromJson(dynamic json) {
    _to = json['to'];
    _HourAvailable = json['24_hour_available'];
    _from = json['from'];
  }
  String? _to;
  num? _HourAvailable;
  String? _from;
  Checkin copyWith({
    String? to,
    num? HourAvailable,
    String? from,
  }) =>
      Checkin(
        to: to ?? _to,
        HourAvailable: HourAvailable ?? _HourAvailable,
        from: from ?? _from,
      );
  String? get to => _to;
  num? get HourAvailable => _HourAvailable;
  String? get from => _from;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['to'] = _to;
    map['24_hour_available'] = _HourAvailable;
    map['from'] = _from;
    return map;
  }
}

/// languagecode : ["en-gb","fr"]

LanguagesSpoken languagesSpokenFromJson(String str) =>
    LanguagesSpoken.fromJson(json.decode(str));
String languagesSpokenToJson(LanguagesSpoken data) =>
    json.encode(data.toJson());

class LanguagesSpoken {
  LanguagesSpoken({
    List<String>? languagecode,
  }) {
    _languagecode = languagecode;
  }

  LanguagesSpoken.fromJson(dynamic json) {
    _languagecode =
        json['languagecode'] != null ? json['languagecode'].cast<String>() : [];
  }
  List<String>? _languagecode;
  LanguagesSpoken copyWith({
    List<String>? languagecode,
  }) =>
      LanguagesSpoken(
        languagecode: languagecode ?? _languagecode,
      );
  List<String>? get languagecode => _languagecode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['languagecode'] = _languagecode;
    return map;
  }
}

/// descriptiontype_id : 6
/// languagecode : "en-gb"
/// description : "Boasting a garden and a terrace, Sky sighting Iglúhús - Stay'in Árbakki provides accommodation in Litli-Árskógssandur with free WiFi and sea views. Featuring free private parking, the luxury tent is in an area where guests can engage in activities such as hiking, skiing and fishing.\n\nGuests at the luxury tent can enjoy a vegetarian breakfast.\n\nCycling can be enjoyed nearby.\n\nHof - Cultural Center and Conference Hall is 34 km from Sky sighting Iglúhús - Stay'in Árbakki. The nearest airport is Akureyri Airport, 36 km from the accommodation."

DescriptionTranslations descriptionTranslationsFromJson(String str) =>
    DescriptionTranslations.fromJson(json.decode(str));
String descriptionTranslationsToJson(DescriptionTranslations data) =>
    json.encode(data.toJson());

class DescriptionTranslations {
  DescriptionTranslations({
    num? descriptiontypeId,
    String? languagecode,
    String? description,
  }) {
    _descriptiontypeId = descriptiontypeId;
    _languagecode = languagecode;
    _description = description;
  }

  DescriptionTranslations.fromJson(dynamic json) {
    _descriptiontypeId = json['descriptiontype_id'];
    _languagecode = json['languagecode'];
    _description = json['description'];
  }
  num? _descriptiontypeId;
  String? _languagecode;
  String? _description;
  DescriptionTranslations copyWith({
    num? descriptiontypeId,
    String? languagecode,
    String? description,
  }) =>
      DescriptionTranslations(
        descriptiontypeId: descriptiontypeId ?? _descriptiontypeId,
        languagecode: languagecode ?? _languagecode,
        description: description ?? _description,
      );
  num? get descriptiontypeId => _descriptiontypeId;
  String? get languagecode => _languagecode;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['descriptiontype_id'] = _descriptiontypeId;
    map['languagecode'] = _languagecode;
    map['description'] = _description;
    return map;
  }
}
