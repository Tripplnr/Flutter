import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';

class MapController extends GetxController {
  GoogleMapController? mapController;
  var isLoading = false.obs;
  var hotelName = "".obs;

  // Set<Marker> markers = <Marker>{}.obs;
  DestinationController _destinationController = Get.find();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    // mapController;
    // loadMarkerIcon();
  }
}
