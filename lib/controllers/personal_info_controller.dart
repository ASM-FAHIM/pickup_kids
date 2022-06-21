import 'package:get/get.dart';

class PersonalInfoController extends GetxController {
  var isLoading = true.obs;

  isLoadingControl() async {
    isLoading(true);
    print(isLoading);
    await Future.delayed(Duration(seconds: 4), () {
      isLoading(false);
      print(isLoading);
    });
  }
}
