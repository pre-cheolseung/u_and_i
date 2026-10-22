import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8BBD0),   // 파스텔톤 핑크 배경색 적용
      body: SafeArea(   // 시스템 UI 피해서 화면에 출력
        top: true,
        bottom: false,
        child: Column(
          // 상단 및 하단 끝에 위젯 배치
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // 반대축 최대 크기로 확장
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
}

class _DDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Text(   // 최상단 글자
          'U & I',
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(   // 두 번째 글자
          'The Day We First Met',
        ),
        Text(   // 임시로 지정한 만난 날짜
          '2026.10.23'
        ),
        const SizedBox(
          height: 16.0,
        ),
        IconButton(   // 하트 아이콘 버튼
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
          ),
          iconSize: 60.0,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(   // 만난 후 D-Day
          'D + 365',
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),   // 양옆 여백을 20으로 설정
      child: Center(   // 이미지 중앙 정렬
        child: Image.asset(
          'assets/img/middle_image.png',
          height: MediaQuery.of(context).size.height / 2,   // 화면의 반만큼 높이 구현
        ),
      )
    );
  }
}