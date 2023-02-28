import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeSideIcon extends StatelessWidget {
  final IconData homeIcon;
  final String title;
  final bool selected;
  final VoidCallback action;

  HomeSideIcon(
      {required this.homeIcon,
      required this.title,
      required this.selected,
      required this.action,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: SizedBox(
          height: 71,
          child: Column(
            children: [
              Icon(
                homeIcon,
                color: selected ? Colors.white : Colors.white.withOpacity(0.3),
                size: 50,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
