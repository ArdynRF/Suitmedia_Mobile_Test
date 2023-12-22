import 'package:flutter/material.dart';
import 'package:suitmedia_internship/core/app_export.dart';
import 'package:suitmedia_internship/widgets/app_bar/appbar_leading_image.dart';
import 'package:suitmedia_internship/widgets/app_bar/appbar_title.dart';
import 'package:suitmedia_internship/widgets/app_bar/custom_app_bar.dart';
import 'package:suitmedia_internship/widgets/custom_elevated_button.dart';

class SecondScreen extends StatelessWidget {
  final String name;
  final String selectedUserName;

  const SecondScreen(
      {Key? key, required this.name, required this.selectedUserName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: 376.h,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 21.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text("Welcome",
                              style: theme.textTheme.bodySmall)),
                      Text(name, style: CustomTextStyles.titleMediumSemiBold),
                      Spacer(flex: 43),
                      Align(
                        alignment: Alignment.center,
                        child: Text(selectedUserName,
                            style: theme.textTheme.headlineSmall),
                      ),
                      Spacer(flex: 56)
                    ])),
            bottomNavigationBar: _buildChooseAUser(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowRight,
            margin: EdgeInsets.only(left: 20.h, top: 12.v, bottom: 15.v),
            onTap: () {
              onTapArrowRight(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Second Screen"),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildChooseAUser(BuildContext context) {
    return CustomElevatedButton(
        text: "Choose a User",
        margin: EdgeInsets.only(left: 29.h, right: 37.h, bottom: 32.v),
        onPressed: () {
          onTapChooseAUser(context);
        });
  }

  /// Navigates to the firstScreen when the action is triggered.
  onTapArrowRight(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.firstScreen);
  }

  /// Navigates to the thirdScreen when the action is triggered.
  onTapChooseAUser(BuildContext context) async {
    final result = await Navigator.pushNamed(context, AppRoutes.thirdScreen);
    if (result is String) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SecondScreen(name: name, selectedUserName: result),
        ),
      );
    }
  }
}
