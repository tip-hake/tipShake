import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/custom_style.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateTextFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? readOnly;

  const UpdateTextFieldWidget({Key? key, required this.controller, required this.hintText, this.keyboardType, this.readOnly = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          readOnly: readOnly!,
          style: CustomStyle.updateTextStyle,
          controller: controller,
          keyboardType: keyboardType,
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
                borderSide: const BorderSide(color: Colors.transparent, width: 0),
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
              fillColor: CustomColor.primaryColor.withOpacity(0.7),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              hintText: hintText,
              hintStyle: CustomStyle.updateTextStyle
          ),
        ),
        SizedBox(height: Dimensions.heightSize,)
      ],
    );
  }

}
