import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:u_and_i/screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();   // 플러터 프레임워크가 앱을 실행할 준비가 될 때까지 대기

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);   // 화면 전체(Edge-to-Edge) 영역까지 앱이 그려지도록 설정
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
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);   // 상단 상태바 및 하단 내비게이션바 숨김

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,   // 우측 상단 DEBUG 빨간색 배너 삭제

      // 테마를 지정할 수 있는 클래스
      theme: ThemeData(
        fontFamily: 'sunflower',   // 기본 글씨체
        // 글씨 테마를 적용할 수 있는 클래스
        textTheme: TextTheme(
          // headline1 스타일 정의
          displayLarge: TextStyle(
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