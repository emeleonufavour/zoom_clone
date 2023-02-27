import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_clone/screens/chat.dart';
import 'package:zoom_clone/services/navService.dart';
import 'package:zoom_clone/widgets/homeIcons.dart';
import 'package:zoom_clone/widgets/homeSideIcon.dart';

import 'homepage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        //icons at the right
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * (1 / 5),
          color: Colors.grey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //home icon
              HomeSideIcon(
                homeIcon: Icons.home_filled,
                title: "Home",
                selected: true,
                action: () {
                  Provider.of<NavService>(context, listen: false).currentPage =
                      'home';
                },
              ),
              //team chat
              HomeSideIcon(
                homeIcon: Icons.chat_bubble_outline_rounded,
                title: "Team Chat",
                selected: false,
                action: () {
                  Provider.of<NavService>(context, listen: false).currentPage =
                      'chat';
                },
              ),
              //meeting
              HomeSideIcon(
                homeIcon: Icons.video_call_outlined,
                title: "Meetings",
                selected: false,
                action: () {
                  Provider.of<NavService>(context, listen: false).currentPage =
                      'meeting';
                },
              ),
              //contacts
              HomeSideIcon(
                homeIcon: Icons.contact_page_outlined,
                title: "Contacts",
                selected: false,
                action: () {
                  Provider.of<NavService>(context, listen: false).currentPage =
                      'contact';
                },
              ),
              //more
              HomeSideIcon(
                homeIcon: Icons.more_horiz_rounded,
                title: "More",
                selected: false,
                action: () {
                  Provider.of<NavService>(context, listen: false).currentPage =
                      'more';
                },
              ),
            ],
          ),
        ),
        //main big icons
        Consumer<NavService>(builder: (context, value, Widget) {
          if (value.currentPage == 'chat') {
            return ChatScreen();
          }
          if (value.currentPage == 'home') {
            return HomeBody();
          }
          return HomeBody();
        })
      ],
    ));
  }
}
