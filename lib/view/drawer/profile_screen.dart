import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:tipShake/widgets/input/update_text_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final zipController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();

  bool isEdit = true;

  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        appBar: AppBar(
          title: const Text(
              Strings.profile
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
            top: Dimensions.topHeight
        ),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: CustomColor.accentColor.withOpacity(0.3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius * 2),
                topRight: Radius.circular(Dimensions.radius * 2),
              )
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _headingWidget(context),
              Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.heightSize * 2
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _inputFiledWidget(context),
                    SizedBox(height: Dimensions.heightSize * 2),
                    _buttonWidget(context),
                    SizedBox(height: Dimensions.heightSize),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _headingWidget(BuildContext context) {
    return Positioned(
      top: -50,
      left: 0,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                _image == null ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/user.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                )
                    : Image.file(
                  _image!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  right: -5,
                  bottom: 0,
                  child: GestureDetector(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: CustomColor.primaryColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    onTap: () {
                      _openImageSourceOptions(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _inputFiledWidget(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.only(
              top: Dimensions.heightSize * 2,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleData(Strings.fullName),
              UpdateTextFieldWidget(
                  controller: emailController,
                  hintText: 'Jhon Doe',
                readOnly: isEdit,
              ),
              _titleData(Strings.email),
              UpdateTextFieldWidget(
                  controller: emailController,
                  hintText: 'jhon@gmail.com',
                readOnly: true,
              ),
              _titleData(Strings.phoneNumber),
              UpdateTextFieldWidget(
                controller: emailController,
                hintText: '+15247784632',
                readOnly: isEdit,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleData(Strings.address),
                        UpdateTextFieldWidget(
                          controller: addressController,
                          hintText: 'New York City RD',
                          readOnly: isEdit,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Dimensions.widthSize,),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleData(Strings.zip),
                        UpdateTextFieldWidget(
                          controller: zipController,
                          hintText: '12541',
                          readOnly: isEdit,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleData(Strings.city),
                        UpdateTextFieldWidget(
                          controller: cityController,
                          hintText: 'NY',
                          readOnly: isEdit,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Dimensions.widthSize,),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleData(Strings.country),
                        UpdateTextFieldWidget(
                          controller: countryController,
                          hintText: 'USA',
                          readOnly: isEdit,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }

  _buttonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize
      ),
      child: PrimaryButtonWidget(
        title: isEdit? Strings.edit : Strings.update,
        onPressed: () {
          setState(() {
            isEdit = !isEdit;
          });
        },
      ),
    );
  }

  _titleData(String title) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.heightSize * 0.5,
      ),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }

  _openImageSourceOptions(BuildContext context){
    showGeneralDialog(
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.6),
        transitionDuration: const Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(Icons.camera_alt, size: 40.0, color: Colors.blue,),
                          onTap: (){
                            Navigator.of(context).pop();
                            _chooseFromCamera();
                          },
                        ),
                        Text(
                          Strings.fromCamera,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.defaultTextSize
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(Icons.photo, size: 40.0, color: Colors.green,),
                          onTap: (){
                            Navigator.of(context).pop();
                            _chooseFromGallery();
                          },
                        ),
                        Text(
                          Strings.fromGallery,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.defaultTextSize
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
            Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim),
            child: child,
          );
        });
  }

  Future _chooseFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {

      }
    });
  }

  Future _chooseFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {

      }
    });
  }

}
