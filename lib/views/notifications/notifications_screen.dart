import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pic_kids/controllers/notify_controller.dart';

import '../../constants/constants.dart';
import '../../widgets/cus_drawer.dart';
import 'notify_tile.dart';

class NotificationScreen extends StatefulWidget {
  final NotifyController notifyController = Get.put(NotifyController());
  NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotifyController notifyController = Get.find();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: CusDrawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: mainBlackColor,
                  size: 35,
                )),
            title: Text(
              ' Notifications',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: mainBlackColor,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (notifyController.isLoading.value) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: CircularProgressIndicator(),
                        ),
                        Text('Loading...'),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: notifyController.notifyList.length,
                      itemBuilder: (context, index) {
                        return NotifyTile(
                          notificationModel: notifyController.notifyList[index],
                        );
                      });
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
