import 'package:clock_app/controllers/home_page_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController(),fenix: true);


  }
}
