import '../third_screen/widgets/useritemlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_internship/core/app_export.dart';
import 'package:suitmedia_internship/widgets/app_bar/appbar_leading_image.dart';
import 'package:suitmedia_internship/widgets/app_bar/appbar_title.dart';
import 'package:suitmedia_internship/widgets/app_bar/custom_app_bar.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<User> users = [];
  int page = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchUsers(page, 10).then((newUsers) {
      setState(() {
        users.addAll(newUsers);
      });
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      fetchUsers(++page, 10).then((newUsers) {
        setState(() {
          users.addAll(newUsers);
        });
      });
    }
  }

  Future<void> _refreshData() async {
    page = 1;
    List<User> newUsers = await fetchUsers(page, 10);
    setState(() {
      users = newUsers;
    });
  }

 @override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      appBar: _buildAppBar(context),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: users.isEmpty
            ? Center(child: Text('Tidak ada data untuk ditampilkan'))
            : ListView.builder(
                controller: _scrollController,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  if (index == users.length - 1) {
                    fetchUsers(++page, 10).then((newUsers) {
                      setState(() {
                        users.addAll(newUsers);
                      });
                    });
                  }
                  return UseritemlistItemWidget(user: users[index]);
                },
              ),
      ),
    ),
  );
}

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 61.v,
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowRight,
            margin: EdgeInsets.only(left: 20.h, top: 22.v, bottom: 14.v),
            onTap: () {
              onTapArrowRight(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Third Screen"),
        styleType: Style.bgFill);
  }

  /// Navigates to the secondScreen when the action is triggered.
  onTapArrowRight(BuildContext context) {
    Navigator.pop(context);
  }
}
