import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seoul_subway_info/presentation/main/main_ui_event.dart';
import 'package:seoul_subway_info/presentation/main/main_view_model.dart';

import '../../data/data_source/local/station_location_info.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<MainViewModel>().eventStream.listen((event) {
        switch (event) {
          case ShowSnackBar(:final message):
            final snackBar = SnackBar(content: Text(message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case EndLoading():
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: state.isSearched
            ? Text('가장 가까운 역 : ${state.timeTables[0].currentStation}역')
            : const Text('가장 가까운 역'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
                child: state.isLoading
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height *
                            0.7, //MediaQuery.of(context).size.height,
                        child: const Center(child: CircularProgressIndicator()))
                    : state.isSearched
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ...state.timeTables.map((e) => ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          subwayLineColor[e.lineNumber],
                                      child: Text(e.lineNumber.substring(3)),
                                    ),
                                    title: Text(e.subwayDirection),
                                    subtitle: Text(e.firstSubway),
                                  )),
                            ],
                          )
                        : const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '검색 버튼을 누르면 현재 위치에서 가장 가까운 지하철 역의 시간표를 제공합니다.',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )),
                          )),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              viewModel.resetMainScreen();
            },
            child: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        onTap: (index) {
          viewModel.setBottomNavBarIndex(index);
          if (index == 0) {
            context.push('/map');
          } else if (index == 1) {
            viewModel.fetchNearestStationTimeTables();
          }
        },
        currentIndex: state.bottomNavBarIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '지하철 노선도',
            icon: Icon(Icons.map_outlined),
          ),
          BottomNavigationBarItem(
            label: '검색',
            icon: Icon(Icons.search_outlined),
          ),
        ],
      ),
    );
  }
}
