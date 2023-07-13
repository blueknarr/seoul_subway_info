// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subway.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Subway _$$_SubwayFromJson(Map<String, dynamic> json) => _$_Subway(
      subwayDirection: json['trainLineNm'] as String,
      currentStation: json['statnNm'] as String,
      nextStation: json['statnTid'] as String,
      lineNumber: json['subwayId'] as String,
      terminalStation: json['bstatnNm'] as String,
      firstSubway: json['arvlMsg2'] as String,
      secondSubway: json['arvlMsg3'] as String,
      arrivalTime: json['arvlCd'] as String,
    );

Map<String, dynamic> _$$_SubwayToJson(_$_Subway instance) => <String, dynamic>{
      'trainLineNm': instance.subwayDirection,
      'statnNm': instance.currentStation,
      'statnTid': instance.nextStation,
      'subwayId': instance.lineNumber,
      'bstatnNm': instance.terminalStation,
      'arvlMsg2': instance.firstSubway,
      'arvlMsg3': instance.secondSubway,
      'arvlCd': instance.arrivalTime,
    };
