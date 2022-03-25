import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/support_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.support
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.add
              ),
            onPressed: () {
                Get.toNamed(Routes.createNewTicketScreen);
            },
          )
        ],
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return SupportListWidget(
          title: 'Payment Issues',
          status: 'Open',
          date: '12-10-2021',
          onTap: () {
            Get.toNamed(Routes.conversationScreen);
          },
        );
      },
    );
  }
}
