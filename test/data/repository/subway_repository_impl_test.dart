import 'package:flutter_test/flutter_test.dart';
import 'package:seoul_subway_info/data/api/subway_api_impl.dart';
import 'package:seoul_subway_info/data/repository/subway_repository_impl.dart';

void main() {
  test('지하철 공공 api repository 테스트', () async {
    String currentStation = '문래';
    final repository = SubwayRepositoryImpl(SubwayApiImpl());
    final subwayInfo = await repository.getSubwayTimeTables(currentStation);

    expect(subwayInfo[0].currentStation, currentStation);
  });
}
