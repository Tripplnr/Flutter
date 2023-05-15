// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:trippinr/auth_controller.dart';
// import 'package:trippinr/core/app_export.dart';

// class TestWidgetMap extends StatelessWidget {
//   const TestWidgetMap({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       // markers: controller.markers,
//       zoomGesturesEnabled: false,
//       myLocationEnabled: true,
//       mapToolbarEnabled: true,
//       zoomControlsEnabled: false,
//       tiltGesturesEnabled: false,
//       mapType: MapType.hybrid,
//       onMapCreated: (GoogleMapController _controller) {
//         AuthController().controller.complete(_controller);
//       },
//       initialCameraPosition: CameraPosition(
//           bearing: 192.8334901395799,
//           target: LatLng(37.43296265331129, -122.08832357078792),
//           tilt: 59.440717697143555,
//           zoom: 19.151926040649414),
//       //  CameraPosition(
//       //   target: LatLng(
//       //     double.parse(authController.latitude.value),
//       //     double.parse(authController.longitude.value),
//       //   ),
//       //   zoom: 12,
//       // ),
//       // markers: Set.from(num),
//     );
//   }
// }
