import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:tipShake/widgets/dropdown_widget.dart';
import 'package:tipShake/widgets/image_upload_widget.dart';
import 'package:tipShake/widgets/input/input_text_field_widget.dart';
import 'package:flutter/material.dart';

class KYCVerificationScreen extends StatefulWidget {
  const KYCVerificationScreen({Key? key}) : super(key: key);


  @override
  _KYCVerificationScreenState createState() => _KYCVerificationScreenState();
}

class _KYCVerificationScreenState extends State<KYCVerificationScreen> {

  final formKey = GlobalKey<FormState>();
  final remarksController = TextEditingController();

  List identityList = ['Passport', 'ID', 'Driving', 'GBP', 'NGN'];
  late String selectedIdentity;

  //image upload
  final picker = ImagePicker();
  File? _file;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedIdentity = identityList[0];

  }

  @override
  void dispose() {
    // TODO: implement dispose
    remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.kycVerification
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: Dimensions.heightSize,),
        _identityWidget(context),
        _imageUploadWidget(context),
        _inputWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _identityWidget(BuildContext context) {
    return DropdownWidget(
        title: Strings.selectYourIdentityCard,
        selectedItem: selectedIdentity,
        list: identityList,
      onChanged: (value) {
          setState(() {
            selectedIdentity = value;
          });
      },
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
        child: InputTextFieldWidget(
          controller: remarksController,
          title: Strings.remarks,
          hintText: Strings.enterRemarks,
          keyboardType: TextInputType.text,
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
          title: Strings.submit,
          onPressed: () {

          }
      ),
    );
  }

  _imageUploadWidget(BuildContext context) {
    return ImageUploadWidget(
      child: _file != null ? Image.file(
        _file!,
        height: 100.h,
      ) : const Icon(
        Icons.upload,
        size: 60,
        color: Colors.white,
      ),
      title: _file != null ? Strings.reUpload : Strings.uploadIDCard,
      onTap: () {
        _openGallery();
      },
    );
  }

  Future<void> _openGallery() async{

    XFile? pickedFile;

    pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920
    );

    // final String fileName = path.basename(pickedFile!.path);
    setState(() {
      _file = File(pickedFile!.path);
    });

  }
}
