import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/custom_style.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final ValueChanged? onChanged;

  const InputTextFieldWidget({Key? key, required this.controller, required this.title, required this.hintText, this.keyboardType, this.readOnly = false, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimensions.largeTextSize
          ),
        ),
        SizedBox(height: Dimensions.heightSize * 0.5,),
        TextFormField(
          readOnly: readOnly!,
          style: CustomStyle.textStyle,
          controller: controller,
          keyboardType: keyboardType,
          validator: (String? value){
            if(value!.isEmpty){
              return Strings.pleaseFillOutTheField;
            }else{
              return null;
            }
          },
          onChanged: onChanged,
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
              hintText: hintText,
              hintStyle: CustomStyle.hintTextStyle
          ),
        ),
        SizedBox(height: Dimensions.heightSize * 2,)
      ],
    );
  }
}
