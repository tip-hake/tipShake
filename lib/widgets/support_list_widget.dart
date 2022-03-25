import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SupportListWidget extends StatelessWidget {

  final String title, status, date;
  final GestureTapCallback onTap;
  const SupportListWidget({Key? key, required this.title, required this.status, required this.date, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize * 0.5,
        right: Dimensions.marginSize * 0.5,
      ),
      child: Card(
        color: CustomColor.primaryColor,
        child: ListTile(
          leading: const Icon(
            Icons.all_inbox_rounded,
            color: Colors.blueGrey,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8)
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          subtitle: Text(
            status,
            style: TextStyle(
                color: status.toLowerCase() == 'open' ? Colors.green : Colors.white.withOpacity(0.6)
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
