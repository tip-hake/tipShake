import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:tipShake/widgets/dropdown_widget.dart';
import 'package:tipShake/widgets/input/input_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ExchangeMoneyScreen extends StatefulWidget {
  const ExchangeMoneyScreen({Key? key}) : super(key: key);


  @override
  _ExchangeMoneyScreenState createState() => _ExchangeMoneyScreenState();
}

class _ExchangeMoneyScreenState extends State<ExchangeMoneyScreen> {

  final formKey = GlobalKey<FormState>();
  final receiverMailController = TextEditingController();
  final amountController = TextEditingController();
  final remarksController = TextEditingController();

  List fromCurrencyList = ['USD', 'EURO', 'BTC', 'GBP', 'NGN'];
  late String selectedFromCurrency;
  List toCurrencyList = ['XRP', 'EURO', 'BTC', 'GBP', 'NGN'];
  late String selectedToCurrency;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedFromCurrency = fromCurrencyList[0];
    selectedToCurrency = toCurrencyList[0];

  }

  @override
  void dispose() {
    // TODO: implement dispose
    receiverMailController.dispose();
    amountController.dispose();
    remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.exchangeMoney
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        _currencyWidget(context),
        _inputWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _currencyWidget(BuildContext context) {
    return Column(
      children: [
        DropdownWidget(
            title: Strings.fromCurrency,
            selectedItem: selectedFromCurrency,
            list: fromCurrencyList,
          onChanged: (value) {
              setState(() {
                selectedFromCurrency = value;
              });
          },
        ),
        DropdownWidget(
            title: Strings.toCurrency,
            selectedItem: selectedToCurrency,
            list: toCurrencyList,
          onChanged: (value) {
              setState(() {
                selectedToCurrency = value;
              });
          },
        ),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            InputTextFieldWidget(
              controller: amountController,
              title: Strings.amount,
              hintText: Strings.enterAmount,
              keyboardType: TextInputType.number,
            ),
            InputTextFieldWidget(
              controller: remarksController,
              title: Strings.remarks,
              hintText: Strings.enterRemarks,
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: PrimaryButtonWidget(
          title: Strings.exchange,
          onPressed: () {
            Get.toNamed(Routes.paymentPreviewScreen);
          }
      ),
    );
  }

}
