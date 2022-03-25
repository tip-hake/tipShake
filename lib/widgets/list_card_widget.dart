import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:flutter/material.dart';

class ListCardWidget extends StatelessWidget {

  final String date, month, remarks, sender, currency;
  final double amount;

  const ListCardWidget({Key? key, required this.date, required this.month, required this.remarks, required this.sender, required this.currency, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize * 0.5,
        right: Dimensions.marginSize * 0.5,
      ),
      child: Card(
        color: CustomColor.primaryColor,
        elevation: 4,
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date,
                style: const TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                month,
                style: const TextStyle(
                    color: Colors.blueGrey,
                ),
              ),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                remarks,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8)
                ),
              ),
              Text(
                '$amount $currency',
                style: TextStyle(
                    color: amount > 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          subtitle: Text(
            sender,
            style: TextStyle(
                color: Colors.white.withOpacity(0.6)
            ),
          ),
        ),
      ),
    );
  }
}
