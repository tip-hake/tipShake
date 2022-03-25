import 'package:tipShake/data/withdraw.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/list_card_widget.dart';
import 'package:flutter/material.dart';

class WithdrawLogScreen extends StatefulWidget {
  const WithdrawLogScreen({Key? key}) : super(key: key);

  @override
  _WithdrawLogScreenState createState() => _WithdrawLogScreenState();
}

class _WithdrawLogScreenState extends State<WithdrawLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.withdrawLog
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: WithdrawList.list().length,
      reverse: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final data = WithdrawList.list()[index];
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
