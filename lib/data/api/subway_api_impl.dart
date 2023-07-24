import 'dart:convert';

import 'package:seoul_subway_info/data/dto/subway_dto.dart';

import '../../domain/api/subway_api.dart';
import 'package:http/http.dart' as http;

class SubwayApiImpl implements SubwayApi {
  @override
  Future<SubwayDto> getSubwayTimeTables(String station) async {
    final url =
        'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/$station';

    final http.Response response = await http.get(Uri.parse(url));
    final jsonString = jsonDecode(response.body);

    return SubwayDto.fromJson(jsonString);
  }
}
