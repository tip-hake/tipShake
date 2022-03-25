import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:tipShake/widgets/input/input_text_field_widget.dart';
import 'package:flutter/material.dart';


class CreateNewTicketScreen extends StatefulWidget {
  const CreateNewTicketScreen({Key? key}) : super(key: key);


  @override
  _CreateNewTicketScreenState createState() => _CreateNewTicketScreenState();
}

class _CreateNewTicketScreenState extends State<CreateNewTicketScreen> {

  final formKey = GlobalKey<FormState>();
  final subjectController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    subjectController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.createNewTicket
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        _inputWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.heightSize,
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            InputTextFieldWidget(
              controller: subjectController,
              title: Strings.subject,
              hintText: Strings.enterSubject,
            ),
            InputTextFieldWidget(
              controller: bodyController,
              title: Strings.body,
              hintText: Strings.explainYourProblem,
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
          title: Strings.createTicket,
          onPressed: () {

          }
      ),
    );
  }

}
