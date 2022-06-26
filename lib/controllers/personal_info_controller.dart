import 'package:get/get.dart';

class PersonalInfoController extends GetxController {
  var isLoading = false.obs;

  isLoadingControl() async {
    isLoading(true);
    print(isLoading);
    await Future.delayed(Duration(seconds: 2), () {
      isLoading(false);
      print(isLoading);
    });
  }
}
