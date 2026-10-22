import 'package:flutter/material.dart';

import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,   // 우측 상단 DEBUG 빨간색 배너 삭제
      home: HomeScreen(),
    )
  );
}