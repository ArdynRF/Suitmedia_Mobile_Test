import 'package:flutter/material.dart';
import 'package:suitmedia_internship/core/app_export.dart';
import 'package:suitmedia_internship/presentation/second_screen/second_screen.dart';
import 'package:suitmedia_internship/widgets/custom_elevated_button.dart';
import 'package:suitmedia_internship/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController palindromeValueEditTextController =
      TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPalindrome(String text) {
    String lowerCaseText = text.toLowerCase();
    String reversedText = lowerCaseText.split('').reversed.join('');
    return lowerCaseText == reversedText;
  }

  void checkPalindrome(BuildContext context) {
    String text = palindromeValueEditTextController.text;
    bool palindrome = isPalindrome(text);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Palindrome Check'),
          content: Text(palindrome ? 'isPalindrome' : 'notPalindrome'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Stack(alignment: Alignment.center, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgBackground1,
                      alignment: Alignment.center),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 32.h, top: 142.v, right: 32.h),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgIcPhoto,
                                height: 116.adaptSize,
                                width: 116.adaptSize),
                            SizedBox(height: 58.v),
                            _buildNameEditText(context),
                            SizedBox(height: 22.v),
                            _buildPalindromeValueEditText(context),
                            SizedBox(height: 45.v),
                            _buildCheckButton(context),
                            SizedBox(height: 15.v),
                            _buildNextButton(context),
                            SizedBox(height: 66.v)
                          ])))
                ]))));
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return CustomTextFormField(
        controller: nameEditTextController, hintText: "Name");
  }

  /// Section Widget
  Widget _buildPalindromeValueEditText(BuildContext context) {
    return CustomTextFormField(
        controller: palindromeValueEditTextController,
        hintText: "Palindrome",
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildCheckButton(BuildContext context) {
    return CustomElevatedButton(
      text: "CHECK",
      onPressed: () {
        checkPalindrome(context);
      },
    );
  }

  /// Section Widget
  Widget _buildNextButton(BuildContext context) {
    return CustomElevatedButton(
        text: "NEXT",
        onPressed: () {
          onTapNextButton(context);
        });
  }

  /// Navigates to the secondScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    String name = nameEditTextController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(
          name: name,
          selectedUserName: 'Selected User Name',
        ),
      ),
    );
  }
}
