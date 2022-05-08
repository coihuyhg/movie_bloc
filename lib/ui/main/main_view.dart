import 'package:flutter/material.dart';

enum MainTab { home, favorite, ticket, account, shuffle }

extension MainTabExtension on MainTab {
  Widget get page {
    switch (this) {
      case MainTab.home:
      // return HomeTabPage();
      // return Container(color: Colors.red,);
      case MainTab.favorite:
      // return DiscoverTabPage();
      case MainTab.ticket:
      // return TvShowTabPage();
      case MainTab.account:
      // return WatchlistTabPage();
      case MainTab.shuffle:
      // return ProfileTabPage();
    }
    return Container();
  }

  BottomNavigationBarItem get tab {
    switch (this) {
      case MainTab.home:
        return BottomNavigationBarItem(
            icon: Image.asset('assets/icons/ic_home.png'), label: 'Home');
      case MainTab.favorite:
        return BottomNavigationBarItem(
            icon: Image.asset('assets/icons/ic_favorite.png'),
            label: 'Favorite');
      case MainTab.ticket:
        return BottomNavigationBarItem(
            icon: Image.asset('assets/icons/ic_ticket.png'), label: 'Ticket');
      case MainTab.account:
        return BottomNavigationBarItem(
            icon: Image.asset('assets/icons/ic_account.png'), label: 'Account');
      case MainTab.shuffle:
        return BottomNavigationBarItem(
            icon: Image.asset('assets/icons/ic_shuffle.png'), label: 'Shuffle');
    }
  }

  String get title {
    switch (this) {
      case MainTab.home:
        return 'Home';
      case MainTab.favorite:
        return 'Favorite';
      case MainTab.ticket:
        return 'Ticket';
      case MainTab.account:
        return 'Account';
      case MainTab.shuffle:
        return 'Shuffle';
    }
  }
}