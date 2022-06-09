import 'package:flutter/material.dart';
import 'package:pic_kids/models/notificatio_test_model.dart';

class NotifyTile extends StatelessWidget {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  final NotificationModel? notificationModel;
  const NotifyTile({
    Key? key,
    this.userId,
    this.id,
    this.title,
    this.body,
    required this.notificationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(180.0),
                    child: Image.asset(
                      'assets/images/children.png',
                      scale: 2,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title: ' '${notificationModel!.title}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                      Text(
                        'Desc: ' '${notificationModel!.body}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
