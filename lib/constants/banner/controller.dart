import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final carousalCurrentIndex = 0.obs; // Use RxInt instead of int
  void updatepageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
