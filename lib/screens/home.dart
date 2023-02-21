import 'package:flutter/material.dart';
import 'package:zoom_clone/widgets/homeIcons.dart';
import 'package:zoom_clone/widgets/homeSideIcon.dart';

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
              ),
              //team chat
              HomeSideIcon(
                homeIcon: Icons.chat_bubble_outline_rounded,
                title: "Team Chat",
                selected: false,
              ),
              //meeting
              HomeSideIcon(
                homeIcon: Icons.video_call_outlined,
                title: "Meetings",
                selected: false,
              ),
              //contacts
              HomeSideIcon(
                homeIcon: Icons.contact_page_outlined,
                title: "Contacts",
                selected: false,
              ),
              //more
              HomeSideIcon(
                homeIcon: Icons.more_horiz_rounded,
                title: "More",
                selected: false,
              ),
            ],
          ),
        ),
        //main big icons
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * (4 / 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //top icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    HomeIcon(
                      icon: Icons.video_call_rounded,
                      title: "New Meeting",
                      main: true,
                    ),
                    HomeIcon(
                      icon: Icons.add_box_rounded,
                      title: "Join",
                      main: false,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //bottom icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    HomeIcon(
                      icon: Icons.calendar_month_rounded,
                      title: "Schedule",
                      main: false,
                    ),
                    HomeIcon(
                      icon: Icons.arrow_upward_rounded,
                      title: "Share Screen",
                      main: false,
                    ),
                  ],
                )
              ],
            ))
      ],
    ));
  }
}
