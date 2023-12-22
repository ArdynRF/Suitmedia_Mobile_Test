import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:suitmedia_internship/core/app_export.dart';

/// Model Pengguna
class User {
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});
}

// Fungsi untuk mengambil data dari API
Future<List<User>> fetchUsers(int page, int perPage) async {
  final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$page&per_page=$perPage'));

  if (response.statusCode == 200) {
    List<User> users = [];
    for (var user in jsonDecode(response.body)['data']) {
      users.add(User(
        email: user['email'],
        firstName: user['first_name'],
        lastName: user['last_name'],
        avatar: user['avatar'],
      ));
    }
    return users;
  } else {
    throw Exception('Failed to load users');
  }
}

// Widget untuk menampilkan data pengguna
class UseritemlistItemWidget extends StatelessWidget {
  final User user;

  const UseritemlistItemWidget({Key? key, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, user.firstName + ' ' + user.lastName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18.h,
          vertical: 15.v,
        ),
        decoration: AppDecoration.fillPrimaryContainer,
        child: Row(
          children: [
            CustomImageView(
              imagePath: user.avatar,
              height: 49.adaptSize,
              width: 49.adaptSize,
              margin: EdgeInsets.only(top: 1.v),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.h,
                top: 1.v,
                bottom: 3.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 5.v),
                  Text(
                    user.email.toUpperCase(),
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}