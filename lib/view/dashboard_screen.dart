import 'package:tipShake/data/conversation.dart';
import 'package:tipShake/data/transaction.dart';
import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/custom_style.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/drawer/main_drawer_widget.dart';
import 'package:tipShake/widgets/list_card_widget.dart';
import 'package:tipShake/widgets/wallet_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            Strings.appName
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person
            ),
            onPressed: () {
              Get.toNamed(Routes.profileScreen);
            },
          )
        ],
      ),
      drawer: const MainDrawerWidget(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [CustomColor.bgColor, CustomColor.bgColor, CustomColor.bgColor,]
          ),
        ),
        child: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        _walletWidget(context),
        SizedBox(height: Dimensions.heightSize * 2,),
        _transactionListWidget(context)
      ],
    );
  }

  _walletWidget(BuildContext context) {
    return WalletWidget(
      amount: 99,
      currency: 'XRP',
      svgPath: 'assets/images/icon.png',
      onPressedDeposit: () {
        Get.toNamed(Routes.depositScreen);
      },
      onPressedWithdraw: () {
        Get.toNamed(Routes.withdrawScreen);
      },
      onPressedExchange: () {
        Get.toNamed(Routes.exchangeMoneyScreen);
      },
    );
  }

  _transactionListWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: Dimensions.marginSize * 0.5,
            bottom: Dimensions.heightSize * 0.5
          ),
          child: Text(
            Strings.transactions,
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.extraLargeTextSize
            ),
          ),
        ),
        ListView.builder(
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
        ),
      ],
    );
  }

  _rateWidget(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Chart title
        title: ChartTitle(
            text: 'Daily Conversation Rate: XRP to USD',
          textStyle: CustomStyle.listStyle
        ),
        // Enable legend
        legend: Legend(isVisible: false),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<Conversation, String>>[
          LineSeries<Conversation, String>(
              dataSource: data,
              xValueMapper: (Conversation sales, _) => sales.date,
              yValueMapper: (Conversation sales, _) => sales.rate,
              name: 'Rate',
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ]);
  }
}
