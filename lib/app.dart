import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/home_page.dart';
import 'pages/chores_page.dart';
import 'pages/schedule_page.dart';
import 'pages/household_page.dart';

class TogetherTabApp extends StatefulWidget {
  const TogetherTabApp({Key? key}) : super(key: key);

  @override
  State<TogetherTabApp> createState() => _TogetherTabAppState();
}

class _TogetherTabAppState extends State<TogetherTabApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ChoresPage(),
    const SchedulePage(),
    const HouseholdPage(),
  ];

  final List<String> _pageNames = [
    'Dashboard',
    'Chores',
    'Schedule',
    'Household',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TogetherTab',
      theme: AppTheme.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TogetherTab'),
          centerTitle: false,
        ),
        body: _buildBody(context),
        bottomNavigationBar: _buildBottomNav(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    if (isMobile) {
      return _pages[_selectedIndex];
    }

    // Desktop layout with side navigation
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.all,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Dashboard'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.checklist_outlined),
              selectedIcon: Icon(Icons.checklist),
              label: Text('Chores'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.calendar_today_outlined),
              selectedIcon: Icon(Icons.calendar_today),
              label: Text('Schedule'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.people_outlined),
              selectedIcon: Icon(Icons.people),
              label: Text('Household'),
            ),
          ],
        ),
        Expanded(
          child: _pages[_selectedIndex],
        ),
      ],
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    if (!isMobile) {
      return const SizedBox.shrink();
    }

    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.checklist_outlined),
          activeIcon: Icon(Icons.checklist),
          label: 'Chores',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          activeIcon: Icon(Icons.calendar_today),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outlined),
          activeIcon: Icon(Icons.people),
          label: 'Household',
        ),
      ],
    );
  }
}
