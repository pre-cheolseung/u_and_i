import 'package:flutter/material.dart';

class CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),   // 양옆 여백을 20으로 설정
      // 중앙 정렬
      child: Center(
        child: Image.asset(
          'assets/img/middle_image.png',
          height: MediaQuery.of(context).size.height / 2,   // 화면의 반만큼 높이 구현
        ),
      )
    );
  }
}