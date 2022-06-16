import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/common_size.dart';
import 'package:flutter_testing/widget/my_progress_indicator.dart';
import 'package:flutter_testing/widget/rounded_avatar.dart';
import '../constants/screen_size.dart';

class Post extends StatelessWidget {
  final int index;

  Post(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size; // size 가 null 이면 해당 디바이스의 사이즈 값을 넣어라
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postHeader(),
        _postImage(),
        _postAction(),
        _postLikes(),
        _postCaption(),
      ],
    );
  }

  Widget _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: common_gap, horizontal: common_gap),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'username111',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            TextSpan(text: '     '),
            TextSpan(text: 'I love love'),
          ],
        ),
      ),
    );
  }

  Padding _postLikes() {
    return const Padding(
      padding: EdgeInsets.only(left: common_gap),
      child: Text(
        '12000 likes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _postAction() {
    return Row(
      children: const [
        IconButton(
          onPressed: null,
          icon: ImageIcon(
            AssetImage('assets/images/bookmark.png'),
          ),
        ),
        IconButton(
          onPressed: null,
          icon: ImageIcon(
            AssetImage('assets/images/comment.png'),
          ),
        ),
        IconButton(
          onPressed: null,
          icon: ImageIcon(
            AssetImage('assets/images/direct_message.png'),
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: null,
          icon: ImageIcon(
            AssetImage('assets/images/heart_selected.png'),
          ),
        ),
      ],
    );
  }

  Widget _postHeader() {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.all(common_xxs_gap),
          child: ClipOval(child: RoundedAvatar()),
        ),
        Expanded(child: Text('')),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_horiz, // 가로 점점점 ... 효과
              color: Colors.black,
            ))
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
        imageUrl: 'https://picsum.photos/id/$index/2000/3000',
        placeholder: (
          // 로딩할때 데이터 늦게 받아와지면 빙글빙글 돌아가는 기능
          BuildContext context,
          String url,
        ) {
          return MyProgressIndicator(
              containerSize: size!.width, progressSize: 50);

          // return Container(
          //   width: size?.width,// 해당디바이스의 컨테이너 안에 가로 최고 사이즈
          //   height: size?.width,// 해당디바이스의 컨테이너 안에 세로 최고 사이즈
          //   child: const Center(
          //       child: SizedBox(
          //     width: 60,
          //     height: 60,
          //     child: CircularProgressIndicator(),
          //   )),
          // );
        },
        imageBuilder: (BuildContext context, ImageProvider imageProvider) {
          return AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
          );
        });
  }
}
