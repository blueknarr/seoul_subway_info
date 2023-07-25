import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'subway.freezed.dart';

part 'subway.g.dart';

@freezed
class Subway with _$Subway {
  /// trainLineNm - 당고개행 - 총신대입구(이수)방면
  /// statnNm - 현재 지하철역 명
  /// updnLine - (0 : 상행/내선, 1 : 하행/외선)
  /// subwayId - 100x x호선, 이 값으로 호선 정보를 나눌 수 있음
  /// bstatnNm - 종착 지하철역 이름
  /// arvlMsg2 - 당역에 첫번째로 도착할 열차
  /// arvlMsg3 - 당역에 두번째로 도착할 열차
  /// barvlDt - 열차 도착 시간 (초)
  /// arvlCd 도착코드 0: 진입, 1: 도착, 2: 출발, 3: 전역출발, 4: 전역 진입, 5: 전역 도착
  const factory Subway(
      {@JsonKey(name: 'trainLineNm') required String subwayDirection,
      @JsonKey(name: 'statnNm') required String currentStation,
      @JsonKey(name: 'updnLine') required String upDownLine,
      @JsonKey(name: 'subwayId') required String lineNumber,
      @JsonKey(name: 'bstatnNm') required String terminalStation,
      @JsonKey(name: 'arvlMsg2') required String firstSubway,
      @JsonKey(name: 'arvlMsg3') required String secondSubway,
      @JsonKey(name: 'barvlDt') required String arrivalTime}) = _Subway;

  factory Subway.fromJson(Map<String, Object?> json) => _$SubwayFromJson(json);
}
