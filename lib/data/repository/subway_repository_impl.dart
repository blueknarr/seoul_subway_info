import 'package:injectable/injectable.dart';
import 'package:seoul_subway_info/data/mapper/subway_mapper.dart';
import 'package:seoul_subway_info/domain/model/subway.dart';
import 'package:seoul_subway_info/domain/repository/subway_repository.dart';

import '../api/subway_api_impl.dart';

@Singleton(as: SubwayRepository)
class SubwayRepositoryImpl implements SubwayRepository {
  final SubwayApiImpl api;

  SubwayRepositoryImpl(this.api);

  @override
  Future<List<Subway>> getSubwayTimeTables(String station) async {
    final resultDto = await api.getSubwayTimeTables(station);

    if (resultDto.realtimeArrivalList == null) {
      return [];
    }
    return resultDto.realtimeArrivalList!.map((e) => e.toSubway()).toList();
  }
}
