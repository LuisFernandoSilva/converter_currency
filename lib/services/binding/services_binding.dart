import 'package:converter_currency/services/controller/service_controllers.dart';
import 'package:get/get.dart';

class ServicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceControllers());
  }
}
