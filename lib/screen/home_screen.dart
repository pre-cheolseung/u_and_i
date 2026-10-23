import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);   // const 생성자 : 최초 선언 후 변경 불가능한 빌드 타임 함수

  @override
  // State<HomeScreen> createState() => _HomeScreenState();
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();   // 시작일

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
            _DDay(
              onHeartPressed: onHeartPressed,   // 하트 눌렀을 때 실행할 함수 전달
              firstDay: firstDay,
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }

  // 하트 눌렀을 때 실행할 함수
  void onHeartPressed() {
    // 상태 변경 시 setState() 함수 실행
    // 값 변경 시 build() 함수 재실행
    // Clean -> setState() -> Dirty -> build() -> Clean
    setState(() {
      firstDay = firstDay.subtract(Duration(days: 1));   // firstDay 변수에서 1일 차감
    });
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;   // 하트 눌렀을 때 실행할 함수 변수로 선언
  final DateTime firstDay;   // 시작일 변수로 선언

  _DDay({
    required this.onHeartPressed,   // 상위에서 하트 눌렀을 때 실행할 함수 수신
    required this.firstDay,   // 상위에서 시작일 변수로 수신
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;   // 설정한 테마 호출
    final now = DateTime.now();   // 현재 날짜 및 시간

    return Column(
      children: [
        const SizedBox(height: 16.0),
        // 최상단 글자
        Text(
          'U&I',
          style: TextTheme.displayLarge,   // headline1 스타일 적용
        ),
        const SizedBox(height: 16.0),
        // 두 번째 글자
        Text(
          'The Day We First Met',
          style: TextTheme.bodyLarge,   // bodyText1 스타일 적용
        ),
        // 임시로 지정한 만난 날짜
        Text(
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',   // DateTime을 년.월.일 형태로 변경
          style: TextTheme.bodyMedium,   // bodyText2 스타일 적용
        ),
        const SizedBox(height: 16.0),
        // 하트 아이콘 버튼
        IconButton(
          onPressed: onHeartPressed,   // 아이콘 눌렀을 때 실행할 함수
          icon: Icon(
            Icons.favorite,
            color: Colors.red,   // 색상 변경
          ),
          iconSize: 60.0,
        ),
        const SizedBox(height: 16.0),
        // 만난 후 DDay
        Text(
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',   // DDay 계산
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