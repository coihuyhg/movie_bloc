import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main/main_cubit.dart';
import '../account/account.dart';
import '../favorite/favorite.dart';
import '../home/home.dart';
import '../shuffle/shuffle.dart';
import '../ticket/ticket.dart';
import 'main_view.dart';

class MainUi extends StatefulWidget {
  const MainUi({Key? key}) : super(key: key);

  @override
  State<MainUi> createState() => _MainUiState();
}

class _MainUiState extends State<MainUi> {
  late List<Widget> pageList;
  late PageController pageController;

  final tabs = [
    MainTab.home,
    MainTab.favorite,
    MainTab.ticket,
    MainTab.account,
    MainTab.shuffle,
  ];

  late MainCubit _cubit;

  @override
  void initState() {
    _cubit = MainCubit();
    // TODO: implement initState
    super.initState();
    pageList = const [
      Home(),
      Favorite(),
      Ticket(),
      Account(),
      Shuffle(),
    ];
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: pageController,
      children: pageList,
      onPageChanged: (index) {
        _cubit.switchTap(index);
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    final theme = Theme.of(context);
    return BlocConsumer<MainCubit, MainState>(
      bloc: _cubit,
      listenWhen: (prev, current) {
        return prev.selectIndex != current.selectIndex;
      },
      listener: (context, state) {
        pageController.jumpToPage(state.selectIndex);
      },
      buildWhen: (prev, current) {
        return prev.selectIndex != current.selectIndex;
      },
      builder: (context, state) {
        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: const Color(0xFF466289),
          elevation: 8,
          type: BottomNavigationBarType.fixed,
          currentIndex: state.selectIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: theme.accentColor,
          items: tabs.map((e) => e.tab).toList(),
          onTap: (index) {
            _cubit.switchTap(index);
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}