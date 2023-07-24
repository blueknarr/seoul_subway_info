import 'package:geolocator/geolocator.dart';
import 'package:seoul_subway_info/domain/repository/subway_repository.dart';

import '../../core/result/result.dart';
import '../../data/data_source/local/station_location_info.dart';
import '../model/subway.dart';

class FindNearestStationUseCase {
  final SubwayRepository repository;

  FindNearestStationUseCase(this.repository);

  Future<Result<List<Subway>>> execute() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const Result.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const Result.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return const Result.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position currentPosition = await Geolocator.getCurrentPosition();
    // 두 좌표간 거리
    double minDistance = 50000;
    String nearestStation = '';

    try {
      for (final data in stationLocationInfo['DATA']!) {
        double distanceInMeters = Geolocator.distanceBetween(
          currentPosition.latitude,
          currentPosition.longitude,
          double.parse(data["crdnt_y"]!),
          double.parse(data["crdnt_x"]!),
        );

        if (minDistance > distanceInMeters) {
          minDistance = distanceInMeters;
          nearestStation = '${data["statn_nm"]}';
        }
      }
      return Result.success(
          await repository.getSubwayTimeTables(nearestStation));
    } catch (e) {
      return Result.error(
          '서울시 공공 API에서 가장 가까운 $nearestStation역의 도착 정보를 제공하지 않습니다.');
    }
  }
}
