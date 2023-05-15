class ApiConstant {
  // BASE  URL
  // static const baseURL = "http://54.205.120.230/";
  // static const baseURL = "http://13.239.61.226/";
  static const baseURL = "http://3.25.2.165/";

  static const baseURLRapidAPIHotelBooking = "https://booking-com.p.rapidapi.com";

  //apis
  static const signupApi = baseURL + "api/signup";
  static const updateApi = baseURL + "api/update-profile";
  static const loginApi = baseURL + "api/login";
  static const getBlogApi = baseURL + "api/get-blog";
  static const likeBlogApi = baseURL + "api/add-favorite";
  static const socialLoginApi = baseURL + "api/social-login";
  static const aboutUsAPI = baseURL + "api/about-us";
  static const termOfUseAPI = baseURL + "api/term-condition";
  static const privacyPolicy = baseURL + "api/privacy-policy";
  static const changePassword = baseURL + "api/change-password";
  static const forgotPassword = baseURL + "api/forgot-password";
  static const shareBlog = baseURL + "api/share-count";
  static const likeBlog = baseURL + "api/add-like";
  static const currencyApi = baseURL + "api/get-countries";
  static const deleteApi = baseURL + "api/delete-account";
  static const blogShare = baseURL + "blog/share/slug/";
  // static const blogSearchEndPoint = "books?q=";
  // static const homeEndPoint = "books?q=";

  // Endpoints

  static const homePopularHotelEndPoint = "${baseURLRapidAPIHotelBooking}/v1/hotels/search-by-coordinates";
  static const homePopularHotelByLocationEndPoint = "${baseURLRapidAPIHotelBooking}/v1/hotels/locations";
  static const hotelDetailsEndPoint = "${baseURLRapidAPIHotelBooking}/v1/hotels/data";
  static const hotelDetailsDescriptionEndPoint = "${baseURLRapidAPIHotelBooking}/v1/hotels/description";
  static const hotelDetailsPhotosEndPoint = "${baseURLRapidAPIHotelBooking}/v1/hotels/photos";
  static const hotelDetailsReviewsEndPoint = "${baseURLRapidAPIHotelBooking}/v1/hotels/reviews";
  static const hotelDetailsAmentiesEndPoint = "${baseURLRapidAPIHotelBooking}/v1/hotels/facilities";
  static const CurrencyListEndPoint = "${baseURLRapidAPIHotelBooking}/v1/metadata/exchange-rates";
  static const HotelRoomsEndPoint = "${baseURLRapidAPIHotelBooking}/v1/hotels/room-list";
  static const HotelNearByPlacesEndPoint = "${baseURLRapidAPIHotelBooking}/v1/hotels/nearby-places";
  static const HotelMetaDataEndPoint = "${baseURLRapidAPIHotelBooking}/v1/hotels/reviews-filter-metadata";
  static const HotelMapLocationEndPoint = "${baseURLRapidAPIHotelBooking}/v1/hotels/map-markers";
  static const HotelExchangeRateEndPoint = "${baseURLRapidAPIHotelBooking}/v1/metadata/exchange-rates";
}

const String firstNameString = 'firstNameString';
const String emailString = 'emailString';
const String currencyListString = 'currencyListString';
const String hotelListString = 'hotelListString';
const String addressListString = 'addressListString';
const String lastNameString = 'lastNameString';
const String tokenString = 'tokenString';
const String currencyString = 'currencyString';
