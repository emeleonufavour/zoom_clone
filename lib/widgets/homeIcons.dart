import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class HomeIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool main;
  const HomeIcon(
      {required this.icon, required this.title, required this.main, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * (1 / 10),
          width: MediaQuery.of(context).size.width * (1 / 5),
          child: Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),
          decoration: BoxDecoration(
              color: main ? Colors.orange : Colors.blueAccent,
              borderRadius: BorderRadius.circular(30)),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
