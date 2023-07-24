import 'package:seoul_subway_info/domain/model/subway.dart';

abstract interface class SubwayRepository {
  Future<List<Subway>> getSubwayTimeTables(String station);
}
