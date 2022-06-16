

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/screen_size.dart';

import '../constants/common_size.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  SelectedTap _selectedTap = SelectedTap.left;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView( // CustomScrollView는 ListView 나 GridView 를 섞어서 사용할 때 쓰임
        slivers: [
          SliverList(// SliverList는 아래의 _username(),... 이하 총 5 개의 위젯만 차지할뿐 다른 위젯은 차지 하지 않는데
            //GridView는 모든 영역을 다 차지해버리기 때문에 SliverToBoxAdapter 라는것으로 감싸줘야한다
            delegate: SliverChildListDelegate(
              [
                _username(), // 아래 이하 5가지는 위젯들
                _userBio(),
                _editProfileButton(),
                _tapButtons(),
                _selectedIndicator()
              ],
            ),
          ),
          SliverToBoxAdapter( //일반적인 위젯을 사용하고 싶을때는 SliverToBoxAdapter 로 감싸야한다.
            child: AnimatedContainer(duration: const Duration(milliseconds: 300),transform: Matrix4.translationValues(x, y, z),
              child: GridView.count(//GridView는 모든 영역을 다 차지해버리기 때문에 SliverToBoxAdapter 라는것으로 감싸줘야한다
                physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics(),),// NeverScrollableScrollPhysics는 안쓰면 그리드뷰에서 제스처 작동이 안되어서 스크롤이 안됨
                crossAxisCount: 3, // 사진 갯수는 가로로 몇개 나타낼건지
                shrinkWrap: true, // true 선택시 아이템 갯수 만큼만 차지함. false 선택시 모든 영역을 차지해버려서 앱 먹통됨,
                childAspectRatio: 1, // 사진 갯수 비율은 3개의 이미지 사진을 1:1:1로 할건지 확인
                children:
                List.generate(30, (index) =>
                    CachedNetworkImage(
                    fit: BoxFit.cover,
                        imageUrl: "https://picsum.photos/id/$index/100/100)")
                ),
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget tabMenu() {
    return TabBar(tabs: [
      Container(),
      Container(),
      Container(),
    ]);
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200), // 탭 밑에 '바'가 왔다 갔다 하는 시간
      alignment: _selectedTap == SelectedTap.left
          ? Alignment.centerLeft
          : Alignment.centerRight, // 왼쪽 탭 클릭시 왼쪽에 '바' 위치 아니면 오른쪽 위치
      curve: Curves.bounceInOut, // 왔다 갔다 하는 형태(여러가지 있음)
      child: Container(
        color: Colors.black,
        height: 3,
        width: size!.width / 2, // size는 MediaQuary 로 기기에 맞춰서 home_page에 초기화 해둠
      ),
    );
  }

  Row _tapButtons() {
    return Row(
      children: [
        Expanded(
            child: IconButton(
              icon: const ImageIcon(AssetImage('assets/images/grid.png')),
              color:
              _selectedTap == SelectedTap.left ? Colors.black : Colors.black45,
              // 왼쪽탭을 누르면 검은색 보여주고 : 아니면 회색 보여줘
              onPressed: () {
                setState(() {
                  _selectedTap = SelectedTap.left; // 왼쪽 누르면 왼쪽 탭으로 설정됨
                });
              },
            )),
        Expanded(
            child: IconButton(
              icon: const ImageIcon(AssetImage('assets/images/saved.png')),
              color:
              _selectedTap == SelectedTap.right ? Colors.black45 : Colors.black,
              onPressed: () {
                setState(() {
                  _selectedTap = SelectedTap.right;
                });
              },
            ))
      ],
    );
  }

  Padding _editProfileButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: SizedBox(
        height: 24,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.black45), // 테두리 둥글게 할거임
              shape: RoundedRectangleBorder( // 둥글게 하는데 크기는 6으로 줄거임
                  borderRadius: BorderRadius.circular(6))),
          child: const Text('OutlineButton with custom shape and border'),
        ),
      ),
    );
  }

  Widget _username() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'username',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _userBio() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'this is what I believe!!',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}

enum SelectedTap { left, right } // 선택하는 탭이 왼쪽이냐 오른쪽이냐 정함
