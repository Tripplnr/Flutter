import 'dart:io';

import 'package:trippinr/core/app_export.dart';

class ApiClient extends GetConnect {
  var imageFile = File('').obs;
  var imageUrl = ''.obs;

  updateImageFile(File value) {
    imageFile.value = value;
  }

  /*
  Using Get Default PUT method
  */

  Future<dynamic> callPostApi(String endPoint, Map<String, dynamic>? body,
      {
      // bool isToken = false,
      // String? token,

      // bool isString = false,
      String authToken = ""}) async {
    // Map<String, String> withToken;

    // withToken = {
    //   // "Content-Type": "application/json",
    //   // "Authorization": "Bearer $token",
    // };

    // withToken = {
    //   // "X-RapidAPI-Key": "e29627fde9msh1075afda3f11fe8p17aca5jsna844f8904b63",
    //   // "X-RapidAPI-Host": "booking-com.p.rapidapi.com"
    //   // 'X-RapidAPI-Key': '2d2824af71msh13e011a53ba0d59p1f72a0jsn762eafb6de8a',
    //   // 'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'
    //   // 'X-RapidAPI-Key': 'eab46ba4c2msh3aec37180e6668bp124936jsn066f9c2f2c7d',
    //   'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'
    // };
    // String url = '${ApiConstant.baseURL}/$endPoint';

    var headers;

    if (authToken.isNotEmpty) {
      headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer " + authToken
      };
    } else
      headers = {
        "Content-type": "application/json",
      };

    String url = endPoint;

    print("value of body is ${body}");
    print("value of url is ${url}");
    print("value of apiHeader is ${headers}");
    try {
      var response = await post(
        url,
        body,
        headers: headers,
      );
      print("value of body is ${body}");
      print("value of url is ${url}");
      print("value of apiHeader is ${headers}");

      if (response.statusCode == 200) {
        print('callPostApi response.statusCode ==>\n ${response.statusCode}');

        print('callPostApi response.body ==>\n ${response.body}');

        print('callPostApi response Header ==>\n ${response.headers}');

        print('Run Successfully!!!!!');

        return response.body;
      } else {
        print('callPostApi response.statusText ==> ${response.statusText}');

        return response.body;
      }
    } catch (e) {
      print("callPostApi Exception ==> ${e.toString()}");
    }
    return false;
  }

  /*GET API CALL USING GET CONNECT*/

  Future<dynamic> callGetApi(String endPoint, Map<String, dynamic>? query,
      {String token = ''}) async {
    var withToken = {
      // "Content-Type": "application/json",
      // "Authorization": token,
      // "X-RapidAPI-Key": "e29627fde9msh1075afda3f11fe8p17aca5jsna844f8904b63",
      // "X-RapidAPI-Host": "booking-com.p.rapidapi.com"
      // 'X-RapidAPI-Key': '2d2824af71msh13e011a53ba0d59p1f72a0jsn762eafb6de8a',
      // 'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'

      'X-RapidAPI-Key': '6b005dfafemshaa938a38b7f592ep195ba9jsnfea81c3626fb',
      'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'
    };
    var url = "$endPoint";

    try {
      var response = await get(
        endPoint,
        query: query,
        headers: withToken,
      );

      print('callGetApi request token ==> \n $token');
      print("callGetApi request header ==> ${withToken}");
      print("callGetApi request url ==> ${url}");
      print("callGetApi request query ==> ${query}");

      if (response.statusCode == 200) {
        print(response.statusCode);
        print('callGetApi response.statusCode ==>\n ${response.statusCode}');

        print('callGetApi response.body ==>\n ${response.body}');

        print('callGetApi response Header ==>\n ${response.headers}');

        print('Run Successfully!!!!!');
        return response.body;
      } else {
        print('callGetApi response.statusText ==> ${response.statusText}');

        return response.body;
      }
    } catch (e) {
      print('callGetApi Exception ==> $e');
    }
  }

  // Postman Get Api

  Future<dynamic> callPostmanGetApi(String endPoint,
      {Map<String, dynamic>? query, String token = ''}) async {
    var withToken = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + token,
      // "X-RapidAPI-Key": "e29627fde9msh1075afda3f11fe8p17aca5jsna844f8904b63",
      // "X-RapidAPI-Host": "booking-com.p.rapidapi.com"
      //'X-RapidAPI-Key': '2d2824af71msh13e011a53ba0d59p1f72a0jsn762eafb6de8a',
      // 'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'
    };
    var url = endPoint;

    try {
      var response = await get(
        endPoint,
        query: query,
        headers: withToken,
      );

      print('callGetApi request token ==> \n $token');
      print("callGetApi request header ==> ${withToken}");
      print("callGetApi request url ==> ${url}");
      print("callGetApi request query ==> ${query}");

      if (response.statusCode == 200) {
        print(response.statusCode);
        print('callGetApi response.statusCode ==>\n ${response.statusCode}');

        print('callGetApi response.body ==>\n ${response.body}');

        print('callGetApi response Header ==>\n ${response.headers}');

        print('Run Successfully!!!!!');
        return response.body;
      } else {
        print('callGetApi response.statusText ==> ${response.statusText}');

        return response.body;
      }
    } catch (e) {
      print('callGetApi Exception ==> $e');
    }
  }
}
