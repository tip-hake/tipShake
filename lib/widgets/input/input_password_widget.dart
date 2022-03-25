import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/custom_style.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputPasswordWidget extends StatefulWidget {

  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType? keyboardType;

  const InputPasswordWidget({Key? key, required this.controller, required this.title, required this.hintText, this.keyboardType}) : super(key: key);

  @override
  _InputPasswordWidgetState createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {

  bool isVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.largeTextSize
          ),
        ),
        SizedBox(height: Dimensions.heightSize * 0.5,),
        TextFormField(
          readOnly: false,
          style: CustomStyle.textStyle,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          validator: (String? value){
            if(value!.isEmpty){
              return Strings.pleaseFillOutTheField;
            }else{
              return null;
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide: const BorderSide(
                  color: Colors.transparent, width: 0
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide: const BorderSide(color: CustomColor.accentColor, width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide: const BorderSide(color: CustomColor.secondaryColor, width: 0.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide: const BorderSide(color: Colors.red, width: 0.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide: const BorderSide(color: Colors.red, width: 0.5),
            ),
            filled: true,
            fillColor: CustomColor.primaryColor.withOpacity(0.03),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            hintText: widget.hintText,
            hintStyle: CustomStyle.hintTextStyle,
            suffixIcon: IconButton(
              icon: Icon(
                isVisibility ? Icons.visibility_off : Icons.visibility,
              ),
              color: CustomColor.primaryColor,
              onPressed: () {
                setState(() {
                  isVisibility = !isVisibility;
                });
              },
            ),
          ),
          obscureText: isVisibility,
        ),
        SizedBox(height: Dimensions.heightSize * 2,),
      ],
    );
  }
}
