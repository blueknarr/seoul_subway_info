import '../../data/dto/subway_dto.dart';

abstract interface class SubwayApi {
  Future<SubwayDto> getSubwayInfo(String station);
}
