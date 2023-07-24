import 'package:flutter_test/flutter_test.dart';
import 'package:seoul_subway_info/data/api/subway_api_impl.dart';

void main() {
  test('지하철 공공 api 데이터 검증', () async {
    final dto = SubwayApiImpl();
    final api = await dto.getSubwayTimeTables('문래');

    expect(api.errorMessage!.total, 4);
  });
}
