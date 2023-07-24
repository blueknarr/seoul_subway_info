import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seoul_subway_info/presentation/main/main_ui_event.dart';
import 'package:seoul_subway_info/presentation/main/main_view_model.dart';

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
      body: Center(
        child: state.isLoading
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(child: CircularProgressIndicator()))
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...state.timeTables.map((e) => ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text(e.lineNumber.substring(3)),
                        ),
                        title: Text(e.subwayDirection),
                        subtitle: Text(e.firstSubway),
                      )),
                ],
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        onTap: (index) {
          viewModel.fetchNearestStationTimeTables();
        },
        currentIndex: state.bottomNavBarIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '가까운 역 시간표 찾기',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: '지하철 노선도',
            icon: Icon(Icons.map_outlined),
          ),
        ],
      ),
    );
  }
}
