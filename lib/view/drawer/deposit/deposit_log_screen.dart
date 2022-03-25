import 'package:tipShake/data/deposit.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/list_card_widget.dart';
import 'package:flutter/material.dart';

class DepositLogScreen extends StatefulWidget {
  const DepositLogScreen({Key? key}) : super(key: key);

  @override
  _DepositLogScreenState createState() => _DepositLogScreenState();
}

class _DepositLogScreenState extends State<DepositLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.depositLog
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: DepositList.list().length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final data = DepositList.list()[index];
        return ListCardWidget(
          date: data.date,
          month: data.month,
          remarks: data.remarks,
          sender: 'By ${data.sender}',
          currency: data.currency,
          amount: data.amount,
        );
      },
    );
  }
}
