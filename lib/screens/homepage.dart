import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zoom_clone/widgets/joinbox.dart';
import 'package:zoom_clone/widgets/vcdialogbox.dart';

import '../widgets/homeIcons.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * (4 / 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //top icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return VideoCallBox();
                        });
                  },
                  child: const HomeIcon(
                    icon: Icons.video_call_rounded,
                    title: "New Meeting",
                    main: true,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return JoinMeetingBox();
                        });
                  },
                  child: const HomeIcon(
                    icon: Icons.add_box_rounded,
                    title: "Join",
                    main: false,
                  ),
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
        ));
  }
}
