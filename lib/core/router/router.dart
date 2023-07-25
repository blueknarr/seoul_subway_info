import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seoul_subway_info/data/api/subway_api_impl.dart';
import 'package:seoul_subway_info/data/repository/subway_repository_impl.dart';
import 'package:seoul_subway_info/presentation/main/main_view_model.dart';

import '../../di/di_setup.dart';
import '../../domain/use_case/find_nearest_station_use_case.dart';
import '../../presentation/main/main_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(
            FindNearestStationUseCase(
              SubwayRepositoryImpl(SubwayApiImpl()),
            ),
          ),
          child: const MainScreen(),
        );
      },
    ),
  ],
);
// getIt<MainViewModel>(),
