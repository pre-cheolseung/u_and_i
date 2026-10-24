import 'package:flutter/cupertino.dart';   // 쿠퍼티노 (iOS) 위젯 사용
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class D_Minus_Day extends StatelessWidget {
  final GestureTapCallback onHeartPressed;   // 하트 눌렀을 때 실행할 함수 변수로 선언
  final DateTime specifiedDate;   // 지정일 변수로 선언

  D_Minus_Day({
    required this.onHeartPressed,   // 상위에서 하트 눌렀을 때 실행할 함수 수신
    required this.specifiedDate,   // 상위에서 시작일 변수로 수신
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;   // 설정한 테마 호출
    final now = DateTime.now();   // 현재 날짜 및 시간
    final int differenceDays = DateTime(specifiedDate.year, specifiedDate.month, specifiedDate.day)
                                        .difference(DateTime(now.year, now.month, now.day))
                                        .inDays;   // 지정일과 현재의 날짜 차이를 년.월.일 형태로 변경
    // 경우에 따른 출력 형태
    final String displayText = differenceDays == 0 
        ? 'D-Day' 
        : differenceDays > 0 
            ? 'D-$differenceDays' 
            : 'D+${differenceDays.abs()}';

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
          'A Special Day',
          style: TextTheme.bodyLarge,   // bodyText1 스타일 적용
        ),
        // 지정일
        Text(
          '${specifiedDate.year}.${specifiedDate.month}.${specifiedDate.day}',   // DateTime을 년.월.일 형태로 변경
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
        // 지정일로부터 D-Day
        Text(
          displayText,   // D-Day 출력
          style: TextTheme.displayMedium,   // headline2 스타일 적용
        ),
        const SizedBox(height: 16.0),
        // 1초마다 현재 시간을 흘려보내는 Stream
        StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now()),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFCDB3FF)),   // 색상 지정
              );
            }

            final DateTime now = snapshot.data!;   // 현재 날짜 및 시간
            final Duration difference = specifiedDate.difference(now);   // 지정일과 현재의 날짜 및 시간 차이

            // D-Day 당일 시간 미출력
            if (difference.inDays == 0 && difference.inHours <= 24 && difference.inDays <= 60 && difference.inSeconds <= 60) {
              return const Text('');
            // D+Day 출력 문구 (차이가 음수일 경우)
            } else if (difference.isNegative) {
              return const Text('Already past the time');
            }

            // 원하는 포맷으로 가공
            final int days = difference.inDays;
            final int hours = difference.inHours.remainder(24);   // difference.inHours % 24
            final int minutes = difference.inMinutes.remainder(60);   // difference.inMinutes % 60
            final int seconds = difference.inSeconds.remainder(60);   // difference.inSeconds % 60

            // padLeft(2, '0')를 사용해 두 자릿수로 맞춤
            // final String formattedTime = [
            //   days.toString().padLeft(2, '0'),
            //   hours.toString().padLeft(2, '0'),
            //   minutes.toString().padLeft(2, '0'),
            //   seconds.toString().padLeft(2, '0'),
            // ].join(':');

            // padLeft(2, '0')를 사용해 두 자릿수로 맞춤
            final String formattedTime =
              'After\n'
              '${days.toString()} days '
              '${hours.toString().padLeft(2, '0')} hours '
              '${minutes.toString().padLeft(2, '0')} minutes '
              '${seconds.toString().padLeft(2, '0')} seconds';

            return Text(
              formattedTime,
              style: TextTheme.bodyMedium,   // bodyText2 스타일 적용
              textAlign: TextAlign.center,
            );
          },
        ),
      ],
    );
  }
}