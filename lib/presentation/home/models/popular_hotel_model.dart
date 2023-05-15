// To parse this JSON data, do
//
//     final homePage = homePageFromJson(jsonString);

import 'dart:convert';

PopularHotelModel popularHotelModelFromJson(String str) =>
    PopularHotelModel.fromJson(json.decode(str));

String popularHotelModelToJson(PopularHotelModel data) =>
    json.encode(data.toJson());

class PopularHotelModel {
  PopularHotelModel({
    this.primaryCount,
    this.count,
    this.roomDistribution,
    this.mapBoundingBox,
    this.totalCountWithFilters,
    this.unfilteredCount,
    this.extendedCount,
    this.unfilteredPrimaryCount,
    this.searchRadius,
    this.sort,
    this.result,
  });

  dynamic primaryCount;
  dynamic count;
  dynamic roomDistribution;
  dynamic mapBoundingBox;
  dynamic totalCountWithFilters;
  dynamic unfilteredCount;
  dynamic extendedCount;
  dynamic unfilteredPrimaryCount;
  dynamic searchRadius;
  dynamic sort;
  dynamic result;

  factory PopularHotelModel.fromJson(Map<String, dynamic> json) =>
      PopularHotelModel(
        primaryCount: json["primary_count"] ?? "",
        count: json["count"],
        roomDistribution: List<RoomDistribution>.from(
            json["room_distribution"].map((x) => RoomDistribution.fromJson(x))),
        mapBoundingBox: MapBoundingBox.fromJson(json["map_bounding_box"]),
        totalCountWithFilters: json["total_count_with_filters"],
        unfilteredCount: json["unfiltered_count"],
        extendedCount: json["extended_count"],
        unfilteredPrimaryCount: json["unfiltered_primary_count"],
        searchRadius: json["search_radius"],
        sort: List<Sort>.from(json["sort"].map((x) => Sort.fromJson(x))),
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "primary_count": primaryCount,
        "count": count,
        "room_distribution":
            List<dynamic>.from(roomDistribution?.map((x) => x.toJson())),
        "map_bounding_box": mapBoundingBox?.toJson(),
        "total_count_with_filters": totalCountWithFilters,
        "unfiltered_count": unfilteredCount,
        "extended_count": extendedCount,
        "unfiltered_primary_count": unfilteredPrimaryCount,
        "search_radius": searchRadius,
        "sort": List<dynamic>.from(sort?.map((x) => x.toJson())),
        "result": List<dynamic>.from(result?.map((x) => x.toJson())),
      };
}

class MapBoundingBox {
  MapBoundingBox({
    this.swLat,
    this.neLong,
    this.neLat,
    this.swLong,
  });

  double? swLat;
  double? neLong;
  double? neLat;
  double? swLong;

  factory MapBoundingBox.fromJson(Map<String, dynamic> json) => MapBoundingBox(
        swLat: json["sw_lat"]?.toDouble(),
        neLong: json["ne_long"]?.toDouble(),
        neLat: json["ne_lat"]?.toDouble(),
        swLong: json["sw_long"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "sw_lat": swLat,
        "ne_long": neLong,
        "ne_lat": neLat,
        "sw_long": swLong,
      };
}

class Result {
  Result({
    this.url,
    this.isCityCenter,
    this.childrenNotAllowed,
    this.isMobileDeal,
    this.selectedReviewTopic,
    this.isSmartDeal,
    this.district,
    this.nativeAdsTracking,
    this.countryTrans,
    this.preferredPlus,
    this.cityTrans,
    this.updatedCheckout,
    this.wishlistCount,
    this.geniusDiscountPercentage,
    this.ribbonText,
    this.cantBook,
    this.currencycode,
    this.updatedCheckin,
    this.districts,
    this.currencyCode,
    this.isNoPrepaymentBlock,
    this.reviewRecommendation,
    this.checkin,
    this.reviewScore,
    this.districtId,
    this.urgencyMessage,
    this.classIsEstimated,
    this.nativeAdId,
    this.hotelName,
    this.distances,
    this.priceIsFinal,
    this.bwallet,
    this.cityInTrans,
    this.inBestDistrict,
    this.isBeachFront,
    this.minTotalPrice,
    this.isGeniusDeal,
    this.hotelHasVbBoost,
    this.defaultLanguage,
    this.hotelFacilities,
    this.hotelId,
    this.defaultWishlistName,
    this.type,
    this.timezone,
    this.compositePriceBreakdown,
    this.accommodationTypeName,
    this.distance,
    this.countrycode,
    this.city,
    this.hasFreeParking,
    this.latitude,
    this.hotelNameTrans,
    this.unitConfigurationLabel,
    this.ufi,
    this.id,
    this.mainPhotoUrl,
    this.checkout,
    this.soldout,
    this.reviewScoreWord,
    this.longitude,
    this.extended,
    this.blockIds,
    this.reviewNr,
    this.isGeoRate,
    this.mainPhotoId,
    this.matchingUnitsConfiguration,
    this.addressTrans,
    this.badges,
    this.cc1,
    this.isFreeCancellable,
    this.ccRequired,
    this.nativeAdsCpc,
    this.zip,
    this.mobileDiscountPercentage,
    this.priceBreakdown,
    this.address,
    this.bookingHome,
    this.accommodationType,
    this.distanceToCc,
    this.preferred,
    this.resultClass,
    this.cityNameEn,
    this.maxPhotoUrl,
    this.max1440PhotoUrl,
    this.hotelIncludeBreakfast,
    this.isWholesalerCandidate,
  });

  dynamic url;
  dynamic isCityCenter;
  dynamic childrenNotAllowed;
  dynamic isMobileDeal;
  dynamic selectedReviewTopic;
  dynamic isSmartDeal;
  dynamic district;
  dynamic nativeAdsTracking;
  dynamic countryTrans;
  dynamic preferredPlus;
  dynamic cityTrans;
  dynamic updatedCheckout;
  dynamic wishlistCount;
  dynamic geniusDiscountPercentage;
  dynamic ribbonText;
  dynamic cantBook;
  Currency? currencycode;
  dynamic updatedCheckin;
  dynamic districts;
  Currency? currencyCode;
  dynamic isNoPrepaymentBlock;
  dynamic reviewRecommendation;
  Check? checkin;
  double? reviewScore;
  dynamic districtId;
  dynamic urgencyMessage;
  dynamic classIsEstimated;
  dynamic nativeAdId;
  dynamic hotelName;
  dynamic distances;
  dynamic priceIsFinal;
  Bwallet? bwallet;
  dynamic cityInTrans;
  dynamic inBestDistrict;
  dynamic isBeachFront;
  double? minTotalPrice;
  dynamic isGeniusDeal;
  dynamic hotelHasVbBoost;
  Cc1? defaultLanguage;
  dynamic hotelFacilities;
  dynamic hotelId;
  dynamic defaultWishlistName;
  Type? type;
  Timezone? timezone;
  PriceBreakdown? compositePriceBreakdown;
  dynamic accommodationTypeName;
  dynamic distance;
  Cc1? countrycode;
  dynamic city;
  dynamic hasFreeParking;
  double? latitude;
  dynamic hotelNameTrans;
  dynamic unitConfigurationLabel;
  dynamic ufi;
  dynamic id;
  dynamic mainPhotoUrl;
  Check? checkout;
  dynamic soldout;
  dynamic reviewScoreWord;
  double? longitude;
  dynamic extended;
  dynamic blockIds;
  dynamic reviewNr;
  dynamic isGeoRate;
  dynamic mainPhotoId;
  MatchingUnitsConfiguration? matchingUnitsConfiguration;
  dynamic addressTrans;
  dynamic badges;
  Cc1? cc1;
  dynamic isFreeCancellable;
  dynamic ccRequired;
  double? nativeAdsCpc;
  dynamic zip;
  double? mobileDiscountPercentage;
  PriceBreakdownClass? priceBreakdown;
  dynamic address;
  BookingHome? bookingHome;
  dynamic accommodationType;
  dynamic distanceToCc;
  dynamic preferred;
  double? resultClass;
  dynamic cityNameEn;
  dynamic maxPhotoUrl;
  dynamic max1440PhotoUrl;
  dynamic hotelIncludeBreakfast;
  dynamic isWholesalerCandidate;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        url: json["url"],
        isCityCenter: json["is_city_center"],
        childrenNotAllowed: json["children_not_allowed"],
        isMobileDeal: json["is_mobile_deal"],
        selectedReviewTopic: json["selected_review_topic"],
        isSmartDeal: json["is_smart_deal"],
        district: json["district"],
        nativeAdsTracking: json["native_ads_tracking"],
        countryTrans: json["country_trans"],
        preferredPlus: json["preferred_plus"],
        cityTrans: json["city_trans"],
        updatedCheckout: json["updated_checkout"],
        wishlistCount: json["wishlist_count"],
        geniusDiscountPercentage: json["genius_discount_percentage"],
        ribbonText: json["ribbon_text"],
        cantBook: json["cant_book"],
        currencycode: currencyValues.map[json["currencycode"]],
        updatedCheckin: json["updated_checkin"],
        districts: json["districts"],
        currencyCode: currencyValues.map[json["currency_code"]],
        isNoPrepaymentBlock: json["is_no_prepayment_block"],
        reviewRecommendation: json["review_recommendation"],
        checkin: Check.fromJson(json["checkin"]),
        reviewScore: json["review_score"]?.toDouble() ?? 0.0,
        districtId: json["district_id"],
        urgencyMessage: json["urgency_message"],
        classIsEstimated: json["class_is_estimated"],
        nativeAdId: json["native_ad_id"],
        hotelName: json["hotel_name"],
        distances: List<Distance>.from(
            json["distances"].map((x) => Distance.fromJson(x))),
        priceIsFinal: json["price_is_final"],
        bwallet: Bwallet.fromJson(json["bwallet"]),
        cityInTrans: json["city_in_trans"],
        inBestDistrict: json["in_best_district"],
        isBeachFront: json["is_beach_front"],
        minTotalPrice: json["min_total_price"]?.toDouble(),
        isGeniusDeal: json["is_genius_deal"],
        hotelHasVbBoost: json["hotel_has_vb_boost"],
        defaultLanguage: cc1Values.map[json["default_language"]],
        hotelFacilities: json["hotel_facilities"],
        hotelId: json["hotel_id"],
        defaultWishlistName: json["default_wishlist_name"],
        type: typeValues.map[json["type"]],
        timezone: timezoneValues.map[json["timezone"]],
        compositePriceBreakdown:
            PriceBreakdown.fromJson(json["composite_price_breakdown"]),
        accommodationTypeName: json["accommodation_type_name"],
        distance: json["distance"],
        countrycode: cc1Values.map[json["countrycode"]],
        city: json["city"],
        hasFreeParking: json["has_free_parking"],
        latitude: json["latitude"]?.toDouble(),
        hotelNameTrans: json["hotel_name_trans"],
        unitConfigurationLabel: json["unit_configuration_label"],
        ufi: json["ufi"],
        id: json["id"],
        mainPhotoUrl: json["main_photo_url"],
        checkout: Check.fromJson(json["checkout"]),
        soldout: json["soldout"],
        reviewScoreWord: json["review_score_word"],
        longitude: json["longitude"]?.toDouble(),
        extended: json["extended"],
        blockIds: List<String>.from(json["block_ids"].map((x) => x)),
        reviewNr: json["review_nr"],
        isGeoRate: json["is_geo_rate"],
        mainPhotoId: json["main_photo_id"],
        matchingUnitsConfiguration: MatchingUnitsConfiguration.fromJson(
            json["matching_units_configuration"]),
        addressTrans: json["address_trans"],
        badges: List<Badge>.from(json["badges"].map((x) => Badge.fromJson(x))),
        cc1: cc1Values.map[json["cc1"]],
        isFreeCancellable: json["is_free_cancellable"],
        ccRequired: json["cc_"],
        nativeAdsCpc: json["native_ads_cpc"],
        zip: json["zip"],
        mobileDiscountPercentage:
            json["mobile_discount_percentage"]?.toDouble(),
        priceBreakdown: PriceBreakdownClass.fromJson(json["price_breakdown"]),
        address: json["address"],
        bookingHome: json["booking_home"] == null
            ? null
            : BookingHome.fromJson(json["booking_home"]),
        accommodationType: json["accommodation_type"],
        distanceToCc: json["distance_to_cc"],
        preferred: json["preferred"],
        resultClass: json["class"],
        cityNameEn: json["city_name_en"],
        maxPhotoUrl: json["max_photo_url"],
        max1440PhotoUrl: json["max_1440_photo_url"],
        hotelIncludeBreakfast: json["hotel_include_breakfast"],
        isWholesalerCandidate: json["is_wholesaler_candidate"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "is_city_center": isCityCenter,
        "children_not_allowed": childrenNotAllowed,
        "is_mobile_deal": isMobileDeal,
        "selected_review_topic": selectedReviewTopic,
        "is_smart_deal": isSmartDeal,
        "district": district,
        "native_ads_tracking": nativeAdsTracking,
        "country_trans": countryTransValues.reverse[countryTrans],
        "preferred_plus": preferredPlus,
        "city_trans": cityTrans,
        "updated_checkout": updatedCheckout,
        "wishlist_count": wishlistCount,
        "genius_discount_percentage": geniusDiscountPercentage,
        "ribbon_text": ribbonText,
        "cant_book": cantBook,
        "currencycode": currencyValues.reverse[currencycode],
        "updated_checkin": updatedCheckin,
        "districts": districts,
        "currency_code": currencyValues.reverse[currencyCode],
        "is_no_prepayment_block": isNoPrepaymentBlock,
        "review_recommendation": reviewRecommendation,
        "checkin": checkin?.toJson(),
        "review_score": reviewScore,
        "district_id": districtId,
        "urgency_message": urgencyMessage,
        "class_is_estimated": classIsEstimated,
        "native_ad_id": nativeAdId,
        "hotel_name": hotelName,
        "distances": List<dynamic>.from(distances.map((x) => x.toJson())),
        "price_is_final": priceIsFinal,
        "bwallet": bwallet?.toJson(),
        "city_in_trans": cityInTrans,
        "in_best_district": inBestDistrict,
        "is_beach_front": isBeachFront,
        "min_total_price": minTotalPrice,
        "is_genius_deal": isGeniusDeal,
        "hotel_has_vb_boost": hotelHasVbBoost,
        "default_language": cc1Values.reverse[defaultLanguage],
        "hotel_facilities": hotelFacilities,
        "hotel_id": hotelId,
        "default_wishlist_name": defaultWishlistName,
        "type": typeValues.reverse[type],
        "timezone": timezoneValues.reverse[timezone],
        "composite_price_breakdown": compositePriceBreakdown?.toJson(),
        "accommodation_type_name": accommodationTypeName,
        "distance": distance,
        "countrycode": cc1Values.reverse[countrycode],
        "city": city,
        "has_free_parking": hasFreeParking,
        "latitude": latitude,
        "hotel_name_trans": hotelNameTrans,
        "unit_configuration_label": unitConfigurationLabel,
        "ufi": ufi,
        "id": id,
        "main_photo_url": mainPhotoUrl,
        "checkout": checkout?.toJson(),
        "soldout": soldout,
        "review_score_word": reviewScoreWord,
        "longitude": longitude,
        "extended": extended,
        "block_ids": List<dynamic>.from(blockIds?.map((x) => x)),
        "review_nr": reviewNr,
        "is_geo_rate": isGeoRate,
        "main_photo_id": mainPhotoId,
        "matching_units_configuration": matchingUnitsConfiguration?.toJson(),
        "address_trans": addressTrans,
        "badges": List<dynamic>.from(badges?.map((x) => x.toJson())),
        "cc1": cc1Values.reverse[cc1],
        "is_free_cancellable": isFreeCancellable,
        "cc_": ccRequired,
        "native_ads_cpc": nativeAdsCpc,
        "zip": zip,
        "mobile_discount_percentage": mobileDiscountPercentage,
        "price_breakdown": priceBreakdown?.toJson(),
        "address": address,
        "booking_home": bookingHome?.toJson(),
        "accommodation_type": accommodationType,
        "distance_to_cc": distanceToCc,
        "preferred": preferred,
        "class": resultClass,
        "city_name_en": cityNameEn,
        "max_photo_url": maxPhotoUrl,
        "max_1440_photo_url": max1440PhotoUrl,
        "hotel_include_breakfast": hotelIncludeBreakfast,
        "is_wholesaler_candidate": isWholesalerCandidate,
      };
}

class Badge {
  Badge({
    this.id,
    this.badgeVariant,
    this.text,
  });

  dynamic id;
  dynamic badgeVariant;
  Text? text;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        id: json["id"],
        badgeVariant: json["badge_variant"],
        text: textValues.map[json["text"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "badge_variant": badgeVariant,
        "text": textValues.reverse[text],
      };
}

enum Text { VAT, CITY_TAX, BOOKING_COM_PAYS, MOBILE_ONLY_PRICE }

final textValues = EnumValues({
  "Booking.com pays": Text.BOOKING_COM_PAYS,
  "City tax": Text.CITY_TAX,
  "Mobile-only price": Text.MOBILE_ONLY_PRICE,
  "VAT": Text.VAT
});

class BookingHome {
  BookingHome({
    this.isSingleUnitProperty,
    this.segment,
    this.isBookingHome,
    this.qualityClass,
    this.group,
  });

  dynamic isSingleUnitProperty;
  dynamic segment;
  dynamic isBookingHome;
  double? qualityClass;
  dynamic group;

  factory BookingHome.fromJson(Map<String, dynamic> json) => BookingHome(
        isSingleUnitProperty: json["is_single_unit_property"],
        segment: json["segment"],
        isBookingHome: json["is_booking_home"],
        qualityClass: json["quality_class"],
        group: json["group"],
      );

  Map<String, dynamic> toJson() => {
        "is_single_unit_property": isSingleUnitProperty,
        "segment": segment,
        "is_booking_home": isBookingHome,
        "quality_class": qualityClass,
        "group": group,
      };
}

class Bwallet {
  Bwallet({
    this.hotelEligibility,
  });

  dynamic hotelEligibility;

  factory Bwallet.fromJson(Map<String, dynamic> json) => Bwallet(
        hotelEligibility: json["hotel_eligibility"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_eligibility": hotelEligibility,
      };
}

enum Cc1 { IS, FR, EN }

final cc1Values = EnumValues({"en": Cc1.EN, "fr": Cc1.FR, "is": Cc1.IS});

class Check {
  Check({
    this.until,
    this.from,
  });

  dynamic until;
  dynamic from;

  factory Check.fromJson(Map<String, dynamic> json) => Check(
        until: json["until"],
        from: json["from"],
      );

  Map<String, dynamic> toJson() => {
        "until": until,
        "from": from,
      };
}

class PriceBreakdown {
  PriceBreakdown({
    this.grossAmountHotelCurrency,
    this.items,
    this.allInclusiveAmount,
    this.excludedAmount,
    this.strikethroughAmountPerNight,
    this.productPriceBreakdowns,
    this.grossAmount,
    this.benefits,
    this.includedTaxesAndChargesAmount,
    this.strikethroughAmount,
    this.discountedAmount,
    this.grossAmountPerNight,
    this.netAmount,
  });

  AllInclusiveAmount? grossAmountHotelCurrency;
  dynamic items;
  AllInclusiveAmount? allInclusiveAmount;
  AllInclusiveAmount? excludedAmount;
  AllInclusiveAmount? strikethroughAmountPerNight;
  dynamic productPriceBreakdowns;
  AllInclusiveAmount? grossAmount;
  dynamic benefits;
  AllInclusiveAmount? includedTaxesAndChargesAmount;
  AllInclusiveAmount? strikethroughAmount;
  AllInclusiveAmount? discountedAmount;
  AllInclusiveAmount? grossAmountPerNight;
  AllInclusiveAmount? netAmount;

  factory PriceBreakdown.fromJson(Map<String, dynamic> json) => PriceBreakdown(
        grossAmountHotelCurrency:
            AllInclusiveAmount.fromJson(json["gross_amount_hotel_currency"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        allInclusiveAmount:
            AllInclusiveAmount.fromJson(json["all_inclusive_amount"]),
        excludedAmount: AllInclusiveAmount.fromJson(json["excluded_amount"]),
        strikethroughAmountPerNight:
            json["strikethrough_amount_per_night"] == null
                ? null
                : AllInclusiveAmount.fromJson(
                    json["strikethrough_amount_per_night"]),
        productPriceBreakdowns: json["product_price_breakdowns"] == null
            ? []
            : List<PriceBreakdown>.from(json["product_price_breakdowns"]
                .map((x) => PriceBreakdown.fromJson(x))),
        grossAmount: AllInclusiveAmount.fromJson(json["gross_amount"]),
        benefits: List<Benefit>.from(
            json["benefits"].map((x) => Benefit.fromJson(x))),
        includedTaxesAndChargesAmount: AllInclusiveAmount.fromJson(
            json["included_taxes_and_charges_amount"]),
        strikethroughAmount: json["strikethrough_amount"] == null
            ? null
            : AllInclusiveAmount.fromJson(json["strikethrough_amount"]),
        discountedAmount: json["discounted_amount"] == null
            ? null
            : AllInclusiveAmount.fromJson(json["discounted_amount"]),
        grossAmountPerNight:
            AllInclusiveAmount.fromJson(json["gross_amount_per_night"]),
        netAmount: AllInclusiveAmount.fromJson(json["net_amount"]),
      );

  Map<String, dynamic> toJson() => {
        "gross_amount_hotel_currency": grossAmountHotelCurrency?.toJson(),
        "items": List<dynamic>.from(items?.map((x) => x.toJson())),
        "all_inclusive_amount": allInclusiveAmount?.toJson(),
        "excluded_amount": excludedAmount?.toJson(),
        "strikethrough_amount_per_night": strikethroughAmountPerNight?.toJson(),
        "product_price_breakdowns": productPriceBreakdowns == null
            ? []
            : List<dynamic>.from(
                productPriceBreakdowns?.map((x) => x.toJson())),
        "gross_amount": grossAmount?.toJson(),
        "benefits": List<dynamic>.from(benefits?.map((x) => x.toJson())),
        "included_taxes_and_charges_amount":
            includedTaxesAndChargesAmount?.toJson(),
        "strikethrough_amount": strikethroughAmount?.toJson(),
        "discounted_amount": discountedAmount?.toJson(),
        "gross_amount_per_night": grossAmountPerNight?.toJson(),
        "net_amount": netAmount?.toJson(),
      };
}

class AllInclusiveAmount {
  AllInclusiveAmount({
    this.currency,
    this.value,
  });

  dynamic? currency;
  double? value;

  factory AllInclusiveAmount.fromJson(Map<String, dynamic> json) =>
      AllInclusiveAmount(
        currency: json["currency"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
      };
}

enum Currency { EUR }

final currencyValues = EnumValues({"EUR": Currency.EUR});

class Benefit {
  Benefit({
    this.icon,
    this.name,
    this.details,
    this.badgeVariant,
    this.identifier,
    this.kind,
  });

  dynamic icon;
  Text? name;
  dynamic details;
  dynamic badgeVariant;
  dynamic identifier;
  dynamic kind;

  factory Benefit.fromJson(Map<String, dynamic> json) => Benefit(
        icon: json["icon"],
        name: textValues.map[json["name"]],
        details: json["details"],
        badgeVariant: json["badge_variant"],
        identifier: json["identifier"],
        kind: json["kind"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "name": textValues.reverse[name],
        "details": details,
        "badge_variant": badgeVariant,
        "identifier": identifier,
        "kind": kind,
      };
}

class Item {
  Item({
    this.itemAmount,
    this.base,
    this.kind,
    this.inclusionType,
    this.details,
    this.name,
    this.identifier,
  });

  AllInclusiveAmount? itemAmount;
  dynamic base;
  ItemKind? kind;
  InclusionType? inclusionType;
  dynamic details;
  Text? name;
  Identifier? identifier;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemAmount: AllInclusiveAmount.fromJson(json["item_amount"]),
        base: Base.fromJson(json["base"]),
        kind: itemKindValues.map[json["kind"]],
        inclusionType: inclusionTypeValues.map[json["inclusion_type"]],
        details: json["details"],
        name: textValues.map[json["name"]],
        identifier: identifierValues.map[json["identifier"]],
      );

  Map<String, dynamic> toJson() => {
        "item_amount": itemAmount?.toJson(),
        "base": base?.toJson(),
        "kind": itemKindValues.reverse[kind],
        "inclusion_type": inclusionTypeValues.reverse[inclusionType],
        "details": details,
        "name": textValues.reverse[name],
        "identifier": identifierValues.reverse[identifier],
      };
}

class Base {
  Base({
    this.percentage,
    this.kind,
    this.baseAmount,
  });

  double? percentage;
  BaseKind? kind;
  double? baseAmount;

  factory Base.fromJson(Map<String, dynamic> json) => Base(
        percentage: json["percentage"],
        kind: baseKindValues.map[json["kind"]],
        baseAmount: json["base_amount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "percentage": percentage,
        "kind": baseKindValues.reverse[kind],
        "base_amount": baseAmount,
      };
}

enum BaseKind { PERCENTAGE, TOTAL, PER_NIGHT, RATE }

final baseKindValues = EnumValues({
  "percentage": BaseKind.PERCENTAGE,
  "per_night": BaseKind.PER_NIGHT,
  "rate": BaseKind.RATE,
  "total": BaseKind.TOTAL
});

enum Identifier { BSB, MOBILE_DISCOUNT }

final identifierValues = EnumValues(
    {"BSB": Identifier.BSB, "mobile-discount": Identifier.MOBILE_DISCOUNT});

enum InclusionType { INCLUDED, EXCLUDED }

final inclusionTypeValues = EnumValues(
    {"excluded": InclusionType.EXCLUDED, "included": InclusionType.INCLUDED});

enum ItemKind { CHARGE, DISCOUNT }

final itemKindValues =
    EnumValues({"charge": ItemKind.CHARGE, "discount": ItemKind.DISCOUNT});

enum CountryTrans { ICELAND }

final countryTransValues = EnumValues({"Iceland": CountryTrans.ICELAND});

class Distance {
  Distance({
    this.iconSet,
    this.iconName,
    this.text,
  });

  dynamic iconSet;
  IconName? iconName;
  dynamic text;

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
        iconSet: json["icon_set"],
        iconName: iconNameValues.map[json["icon_name"]],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "icon_set": iconSet,
        "icon_name": iconNameValues.reverse[iconName],
        "text": text,
      };
}

enum IconName { BUI_GEO_PIN }

final iconNameValues = EnumValues({"bui_geo_pin": IconName.BUI_GEO_PIN});

class MatchingUnitsConfiguration {
  MatchingUnitsConfiguration({
    this.matchingUnitsCommonConfig,
  });

  MatchingUnitsCommonConfig? matchingUnitsCommonConfig;

  factory MatchingUnitsConfiguration.fromJson(Map<String, dynamic> json) =>
      MatchingUnitsConfiguration(
        matchingUnitsCommonConfig: MatchingUnitsCommonConfig.fromJson(
            json["matching_units_common_config"]),
      );

  Map<String, dynamic> toJson() => {
        "matching_units_common_config": matchingUnitsCommonConfig?.toJson(),
      };
}

class MatchingUnitsCommonConfig {
  MatchingUnitsCommonConfig({
    this.localizedArea,
    this.unitTypeId,
  });

  dynamic localizedArea;
  dynamic unitTypeId;

  factory MatchingUnitsCommonConfig.fromJson(Map<String, dynamic> json) =>
      MatchingUnitsCommonConfig(
        localizedArea: json["localized_area"],
        unitTypeId: json["unit_type_id"],
      );

  Map<String, dynamic> toJson() => {
        "localized_area": localizedArea,
        "unit_type_id": unitTypeId,
      };
}

class PriceBreakdownClass {
  PriceBreakdownClass({
    this.hasIncalculableCharges,
    this.hasFinePrintCharges,
    this.sumExcludedRaw,
    this.allInclusivePrice,
    this.grossPrice,
    this.hasTaxExceptions,
    this.currency,
  });

  dynamic hasIncalculableCharges;
  dynamic hasFinePrintCharges;
  dynamic sumExcludedRaw;
  double? allInclusivePrice;
  dynamic grossPrice;
  dynamic hasTaxExceptions;
  Currency? currency;

  factory PriceBreakdownClass.fromJson(Map<String, dynamic> json) =>
      PriceBreakdownClass(
        hasIncalculableCharges: json["has_incalculable_charges"],
        hasFinePrintCharges: json["has_fine_print_charges"],
        sumExcludedRaw: json["sum_excluded_raw"],
        allInclusivePrice: json["all_inclusive_price"]?.toDouble(),
        grossPrice: json["gross_price"],
        hasTaxExceptions: json["has_tax_exceptions"],
        currency: currencyValues.map[json["currency"]],
      );

  Map<String, dynamic> toJson() => {
        "has_incalculable_charges": hasIncalculableCharges,
        "has_fine_print_charges": hasFinePrintCharges,
        "sum_excluded_raw": sumExcludedRaw,
        "all_inclusive_price": allInclusivePrice,
        "gross_price": grossPrice,
        "has_tax_exceptions": hasTaxExceptions,
        "currency": currencyValues.reverse[currency],
      };
}

enum Timezone { ATLANTIC_REYKJAVIK }

final timezoneValues =
    EnumValues({"Atlantic/Reykjavik": Timezone.ATLANTIC_REYKJAVIK});

enum Type { PROPERTY_CARD }

final typeValues = EnumValues({"property_card": Type.PROPERTY_CARD});

class RoomDistribution {
  RoomDistribution({
    this.children,
    this.adults,
  });

  dynamic children;
  dynamic adults;

  factory RoomDistribution.fromJson(Map<String, dynamic> json) =>
      RoomDistribution(
        children: List<dynamic>.from(json["children"].map((x) => x)),
        adults: json["adults"],
      );

  Map<String, dynamic> toJson() => {
        "children": List<dynamic>.from(children?.map((x) => x)),
        "adults": adults,
      };
}

class Sort {
  Sort({
    this.name,
    this.id,
  });

  dynamic name;
  dynamic id;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
