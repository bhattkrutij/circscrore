import 'package:circ_scrorer/screens/create_tournament_screen.dart';
import 'package:circ_scrorer/screens/match_list_screen.dart';
import 'package:circ_scrorer/screens/settings_screen.dart';
import 'package:circ_scrorer/screens/sign_in_screen.dart';
import 'package:circ_scrorer/screens/teams_list_screen.dart';
import 'package:circ_scrorer/screens/tournament_list_screen.dart';
import 'package:circ_scrorer/utils/app_colors.dart';
import 'package:circ_scrorer/utils/app_images.dart';
import 'package:circ_scrorer/utils/app_strings.dart';
import 'package:circ_scrorer/utils/diamentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidable/hidable.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final tab = [
    const TournamentListScreen(),
    const MatchListScreen(),
    const TeamsListScreen(),
    const SettingsScreen(),
  ];
  // Create scroll controller that will be given to scrollable widget and hidable.
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Scrollable widget of main widget
      bottomNavigationBar: Hidable(
        controller: scrollController,

        enableOpacityAnimation: true, // As default it's true
        child: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: primaryColor,
          onTap: (i) => setState(() => index = i),
          items: bottomBarItems(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: tab[index],
        ),
      ),
      floatingActionButton: Hidable(
        controller: scrollController,
        child: Align(
          alignment: Alignment.centerRight,
          child: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              if (index == 0) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateTorunament()));
              }
              // Do something ...
            },
            child: const Icon(
              Icons.add,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(.4),
        ),
      ),
      title: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Container(
              height: 15,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(.5),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      subtitle: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          children: [
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(.3),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<BottomNavigationBarItem> bottomBarItems() {
  return [
    BottomNavigationBarItem(
        label: tournaments,
        activeIcon: Image.asset(ic_tournament, color: primaryColor, width: 24, height: 24, fit: BoxFit.cover),
        icon: Image.asset(ic_tournament, color: Colors.grey, width: 24, height: 24, fit: BoxFit.cover),
        backgroundColor: whiteColor),
    BottomNavigationBarItem(
      label: matches,
      activeIcon: Image.asset(ic_match, color: primaryColor, width: 24, height: 24, fit: BoxFit.cover),
      icon: Image.asset(ic_match, color: Colors.grey, width: 24, height: 24, fit: BoxFit.cover),
      backgroundColor: whiteColor,
    ),
    BottomNavigationBarItem(
      label: teams,
      activeIcon: Image.asset(ic_team, color: primaryColor, width: 24, height: 24, fit: BoxFit.cover),
      icon: Image.asset(ic_team, color: Colors.grey, width: 24, height: 24, fit: BoxFit.cover),
      backgroundColor: whiteColor,
    ),
    BottomNavigationBarItem(
        activeIcon: Icon(Icons.settings, color: primaryColor),
        label: settings,
        icon: const Icon(Icons.settings, color: Colors.grey),
        backgroundColor: whiteColor),
  ];
}