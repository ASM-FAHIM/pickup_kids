import 'package:get/get.dart';
import 'package:pic_kids/models/notificatio_test_model.dart';

import '../remote_services/notifi_test_api.dart';

class NotifyController extends GetxController {
  var notifyList = <NotificationModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchNotification();
    super.onInit();
  }

  void fetchNotification() async {
    try {
      isLoading(true);
      var notify = await NotificationAPI().notifiGetAPI();
      notifyList.assignAll(notify);
    } finally {
      isLoading(false);
    }
  }
}
