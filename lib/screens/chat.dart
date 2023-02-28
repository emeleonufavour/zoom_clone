import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              const Text(
                'Team Chat',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Icon(Icons.chat_bubble_outline_rounded)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * (3 / 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[700]),
            child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 20),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search"),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SvgPicture.asset(
            'assets/chatintro.svg',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Find people and start chatting!',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Add People'))
        ],
      ),
    );
  }
}
