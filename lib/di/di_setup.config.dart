// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:seoul_subway_info/data/api/subway_api_impl.dart' as _i3;
import 'package:seoul_subway_info/data/repository/subway_repository_impl.dart'
    as _i5;
import 'package:seoul_subway_info/domain/repository/subway_repository.dart'
    as _i4;
import 'package:seoul_subway_info/domain/use_case/find_nearest_station_use_case.dart'
    as _i6;
import 'package:seoul_subway_info/presentation/main/main_view_model.dart'
    as _i7;

const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.SubwayApiImpl>(_i3.SubwayApiImpl());
    gh.singleton<_i4.SubwayRepository>(
      _i5.SubwayRepositoryImpl(gh<_i3.SubwayApiImpl>()),
      registerFor: {_prod},
    );
    gh.singleton<_i6.FindNearestStationUseCase>(
        _i6.FindNearestStationUseCase(gh<_i4.SubwayRepository>()));
    gh.factory<_i7.MainViewModel>(
        () => _i7.MainViewModel(gh<_i6.FindNearestStationUseCase>()));
    return this;
  }
}
