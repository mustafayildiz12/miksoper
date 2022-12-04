import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/colors.dart';

part 'modules/notification_item.dart';
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  PagePadding.allXS(),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              8,
              (index) => _NotificationItemTile(
                index: index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


