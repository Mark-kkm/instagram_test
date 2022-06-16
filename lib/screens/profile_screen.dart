import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/common_size.dart';
import 'package:flutter_testing/widget/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            ProfileBody()
          ],
        ),
      ),
    );
  }
}


Row _appBar() {
  return Row(
    children: [
      const SizedBox(
        width: 40,
      ),
      const Expanded(child: Text(' Text ')),
      IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
    ],
  );
}
