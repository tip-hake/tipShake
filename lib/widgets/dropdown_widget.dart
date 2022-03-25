import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/custom_style.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {

  final String title, selectedItem;
  final List list;
  final ValueChanged? onChanged;

  const DropdownWidget({Key? key, required this.title, required this.selectedItem, required this.list, this.onChanged}) : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
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
          Container(
            height: Dimensions.amountFieldHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius * 0.5),
                  bottomRight: Radius.circular(Dimensions.radius * 0.5),
                ),
                border: Border.all(color: CustomColor.accentColor.withOpacity(0.6))
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: Dimensions.marginSize * 0.5, right: Dimensions
                    .marginSize * 0.5),
                child: DropdownButton(
                  isExpanded: true,
                  dropdownColor: CustomColor.secondaryColor,
                  underline: Container(),
                  hint: Text(
                    widget.selectedItem,
                    style: CustomStyle.textStyle,
                  ), // Not necessary for Option 1
                  value: widget.selectedItem,
                  onChanged: widget.onChanged,
                  items: widget.list.map((value) {
                    return DropdownMenuItem(
                      child: Text(
                        value,
                        style: CustomStyle.textStyle,
                      ),
                      value: value,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 2,)
        ],
      ),
    );
  }
}
