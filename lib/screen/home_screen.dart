import 'package:flutter/cupertino.dart';   // 쿠퍼티노 (iOS) 위젯 사용
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:u_and_i/widget/couple_image.dart';
import 'package:u_and_i/widget/d_minus_day.dart';
import 'package:u_and_i/widget/d_plus_day.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);   // const 생성자 : 최초 선언 후 변경 불가능한 빌드 타임 함수

  @override
  // State<HomeScreen> createState() => _HomeScreenState();
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime specifiedDate = DateTime.now();   // 지정일 (기본 값은 오늘 날짜)

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);   // 상단 상태바 아이콘 색상 (밝게: light, 어둡게: dark)
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,   // 상단 상태바 아이콘 색상 (밝게: light, 어둡게: dark)
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFFF8BBD0),   // 파스텔톤 핑크 배경색 적용
      // 시스템 UI 피해서 화면에 출력
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,   // 상단 및 하단 끝에 위젯 배치
          crossAxisAlignment: CrossAxisAlignment.stretch,   // 반대축 최대 크기로 확장
          children: [
            // D-Day
            // D_Minus_Day(
            //   onHeartPressed: onHeartPressed,   // 하트 눌렀을 때 실행할 함수 전달
            //   specifiedDate: specifiedDate,
            // ),
            // D+Day
            D_Plus_Day(
              onHeartPressed: onHeartPressed,   // 하트 눌렀을 때 실행할 함수 전달
              specifiedDate: specifiedDate,
            ),
            CoupleImage(),
          ],
        ),
      ),
    );
  }

  final String _storageKey = 'saved_date';

  @override
  void initState() {
    super.initState();
    _loadSavedDate(); // 앱 실행 시 저장된 날짜 불러오기
  }

  // 저장된 날짜 호출
  Future<void> _loadSavedDate() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDateStr = prefs.getString(_storageKey);

    if (savedDateStr != null) {
      setState(() {
        specifiedDate = DateTime.parse(savedDateStr);
      });
    }
  }

  // 선택한 날짜 저장
  Future<void> _saveDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_storageKey, date.toIso8601String());   // DateTime을 문자열 형식으로 변환하여 저장
  }

  // 하트 눌렀을 때 실행할 함수
  void onHeartPressed() {
    // 상태 변경 시 setState() 함수 실행
    // 값 변경 시 build() 함수 재실행
    // Clean -> setState() -> Dirty -> build() -> Clean
    // setState(() {
    //   specifiedDate = specifiedDate.subtract(Duration(days: 1));   // specifiedDate 변수에서 1일 차감
    // });

    // 쿠퍼티노 날짜 선택 다이얼로그 실행
    showCupertinoDialog(
      context: context,   // 보여줄 다이얼로그 빌드
      builder: (BuildContext context) {
        // 날짜 선택하는 다이얼로그
        // 정렬을 지정하는 위젯
        return Align(
          alignment: Alignment.bottomCenter,   // 하단 중앙으로 정렬
          child: Container(
            color: Colors.white,   // 배경색 지정
            height: 300,   // 높이 지정
            child: CupertinoDatePicker(
              initialDateTime: specifiedDate,   // 초기 선택 날짜 (저장된 날짜)
              maximumDate: DateTime.now(),   // 미래 날짜 선택 불가
              // 날짜가 변경되면 실행되는 함수
              onDateTimeChanged: (DateTime date) {
                // 상태 변경 시 setState() 함수 실행
                // 값 변경 시 build() 함수 재실행
                // Clean -> setState() -> Dirty -> build() -> Clean
                setState(() {
                  specifiedDate = date;
                });
                _saveDate(date);   // 날짜가 변경될 때마다 로컬에 저장
              },
              mode: CupertinoDatePickerMode.date,   // 시간 제외하고 날짜만 선택
            ),
          ),
        );
      },
      barrierDismissible: true,   // 외부를 탭 하면 다이얼로그 종료
    );
  }
}