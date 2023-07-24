import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:seoul_subway_info/domain/model/subway.dart';
import 'package:seoul_subway_info/domain/use_case/find_nearest_station_use_case.dart';
import 'package:seoul_subway_info/presentation/main/main_state.dart';

import '../../core/result/result.dart';
import 'main_ui_event.dart';

class MainViewModel with ChangeNotifier {
  final FindNearestStationUseCase _findNearestStationUseCase;

  final _eventController = StreamController<MainUiEvent>();

  Stream<MainUiEvent> get eventStream => _eventController.stream;

  MainViewModel(this._findNearestStationUseCase);

  MainState _state = const MainState();

  MainState get state => _state;

  Future<void> fetchNearestStationTimeTables() async {
    _state = state.copyWith(
      isLoading: true,
      isSearched: false,
    );
    notifyListeners();

    final result = await _findNearestStationUseCase.execute();

    switch (result) {
      case Success(:final data):
        _state = state.copyWith(
          timeTables: data,
          isLoading: false,
          isSearched: true,
        );
        notifyListeners();

        _eventController.add(const EndLoading());
      case Error(:final e):
        _eventController.add(ShowSnackBar(e));
    }
  }

  void setBottomNavBarIndex(int index) {
    _state = state.copyWith(
      bottomNavBarIndex: index,
    );
    notifyListeners();
  }
}
