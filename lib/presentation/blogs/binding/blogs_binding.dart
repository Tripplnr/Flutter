import 'package:get/get.dart';

import '../controller/blogs_controller.dart';

class BlogsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlogsController());
  }
}
