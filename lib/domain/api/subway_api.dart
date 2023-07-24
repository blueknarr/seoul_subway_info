import '../../data/dto/subway_dto.dart';

abstract interface class SubwayApi {
  Future<SubwayDto> getSubwayTimeTables(String station);
}
