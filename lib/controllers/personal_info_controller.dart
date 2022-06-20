import 'package:get/get.dart';

class PersonalInfoController extends GetxController {
  var isLoading = true.obs;

  isLoadingControl() {
    Future.delayed(Duration(seconds: 3), () {
      //doing something
    });
  }
}
