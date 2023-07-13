import 'package:seoul_subway_info/data/dto/subway_dto.dart';
import 'package:seoul_subway_info/domain/model/subway.dart';

extension ToSubway on RealtimeArrivalList {
  Subway toSubway() {
    return Subway(
      subwayDirection: trainLineNm ?? '',
      currentStation: statnNm ?? '',
      nextStation: statnTid ?? '',
      lineNumber: subwayId ?? '',
      terminalStation: bstatnNm ?? '',
      firstSubway: arvlMsg2 ?? '',
      secondSubway: arvlMsg3 ?? '',
      arrivalTime: arvlCd ?? '',
    );
  }
}
