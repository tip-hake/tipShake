import 'package:tipShake/data/transaction.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/list_card_widget.dart';
import 'package:flutter/material.dart';

class TransferLogScreen extends StatefulWidget {
  const TransferLogScreen({Key? key}) : super(key: key);

  @override
  _TransferLogScreenState createState() => _TransferLogScreenState();
}

class _TransferLogScreenState extends State<TransferLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.transferLog
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: TransactionList.list().length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final data = TransactionList.list()[index];
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
