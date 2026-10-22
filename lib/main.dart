import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:u_and_i/screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 화면 전체(Edge-to-Edge) 영역까지 앱이 그려지도록 설정
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // 상단 상태바 및 하단 내비게이션바 설정
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,   // 상단 상태바 투명
      // statusBarIconBrightness: Brightness.light,   // 상단 상태바 아이콘 색상 (밝게: light, 어둡게: dark)
      systemNavigationBarColor: Colors.transparent,   // 하단 내비게이션바 투명
      systemNavigationBarDividerColor: Colors.transparent,   // 하단 구분선 제거
      // systemNavigationBarIconBrightness: Brightness.light,   // 하단 내비게이션바 아이콘 색상 (밝게: light, 어둡게: dark)
    ),
  );
  // 상단 상태바 및 하단 내비게이션바 숨김
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,   // 우측 상단 DEBUG 빨간색 배너 삭제

      theme: ThemeData(   // 테마를 지정할 수 있는 클래스
        fontFamily: 'sunflower',   // 기본 글씨체
        textTheme: TextTheme(   // 글씨 테마를 적용할 수 있는 클래스
          displayLarge: TextStyle(   // headline1 스타일 정의
            color: Colors.white,   // 글 색상
            fontFamily: 'parisienne',   // 글씨체
            fontSize: 80.0,   // 글씨 크기
            fontWeight: FontWeight.w700,   // 글씨 두께
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      home: HomeScreen(),
    )
  );
}