import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

class HotelRepository {
  var apiClient = ApiClient();
  var controller = Get.find<HotelController>();
}
