import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // @override
  // State<HomeScreen> createState() => _HomeScreenState();
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // 상단 상태바 아이콘 색상 (밝게: light, 어둡게: dark)
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );

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
    // 설정한 테마 호출
    final TextTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Text(   // 최상단 글자
          'U&I',
          style: TextTheme.displayLarge,   // headline1 스타일 적용
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(   // 두 번째 글자
          'The Day We First Met',
          style: TextTheme.bodyLarge,   // bodyText1 스타일 적용
        ),
        Text(   // 임시로 지정한 만난 날짜
          '2026.10.23',
          style: TextTheme.bodyMedium,   // bodyText2 스타일 적용
        ),
        const SizedBox(
          height: 16.0,
        ),
        IconButton(   // 하트 아이콘 버튼
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: Colors.red,   // 빨간색으로 색상 변경
          ),
          iconSize: 60.0,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(   // 만난 후 D-Day
          'D + 365',
          style: TextTheme.displayMedium,   // headline2 스타일 적용
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