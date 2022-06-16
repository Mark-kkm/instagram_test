import 'package:flutter/material.dart';
import 'package:flutter_testing/widget/post.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.camera_alt),
        title: const Text(
          'instagram',
          style: TextStyle(fontFamily: 'VeganStyle'),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: ImageIcon(
              AssetImage('assets/images/actionbar_camera.png'),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: feedListBuilder,
        itemCount: 30,
      ),
    );
  }

  Widget feedListBuilder(BuildContext context, int index) {
    return Post(index);
  }
}

