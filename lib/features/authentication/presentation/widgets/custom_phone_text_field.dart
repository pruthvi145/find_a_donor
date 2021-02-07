import 'package:find_a_donor/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPhoneTextField extends StatelessWidget {
  final TextEditingController countryCodeController;
  final TextEditingController phoneController;

  CustomPhoneTextField({
    @required this.countryCodeController,
    @required this.phoneController,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: CustomTextField(
            onChanged: (String val) {},
            enabled: false,
            controller: countryCodeController,
            fontWeight: FontWeight.w600,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(width: ScreenUtil().setHeight(8)),
        Expanded(
          flex: 4,
          child: CustomTextField(
            // TODO: change to true
            autofocus: false,
            maxLength: 10,
            onChanged: (String val) {},
            controller: phoneController,
            keyboardType: TextInputType.number,
            hintText: "Enter Phone Number",
          ),
        ),
      ],
    );
  }
}
