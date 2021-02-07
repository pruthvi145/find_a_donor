import 'package:find_a_donor/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTextField extends StatefulWidget {
  @override
  _OtpTextFieldState createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  List<TextEditingController> _textEditingController;
  List<FocusNode> _focusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController =
        List.generate(6, (int index) => TextEditingController(text: "*"));
    _focusNode = List.generate(6, (int index) => FocusNode());
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController
        .forEach((tEditingController) => tEditingController.dispose());
    _focusNode.forEach((_fNode) => _fNode.dispose());
  }

  Widget _buildOtpTextField(int index) {
    _focusNode[index].addListener(() {
      if (_focusNode[index].hasFocus) {
        _textEditingController[index].clear();
      }
    });
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(3),
        ),
        child: CustomTextField(
          autofocus: index == 0,
          focusNode: _focusNode[index],
          controller: _textEditingController[index],
          maxLength: 1,
          hintText: "",
          textAlign: TextAlign.center,
          onChanged: (String value) {
            if (index + 1 != 6) {
              FocusScope.of(context).requestFocus(_focusNode[index + 1]);
            } else {
              FocusScope.of(context).requestFocus(FocusNode());
            }
          },
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }

  Widget _generateOtpTextField() {
    return Row(
      children: List.generate(6, (int index) {
        return _buildOtpTextField(index);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _generateOtpTextField();
  }
}
