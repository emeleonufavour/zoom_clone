import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VideoCallBox extends StatelessWidget {
  const VideoCallBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        height: 300,
        decoration: BoxDecoration(color: Colors.grey[700]),
        child: Column(
          children: [
            //start a meeting box
            Container(
              width: 300,
              height: 45,
              color: Colors.grey[800],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //cancel button
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel')),
                  const Text(
                    'Start a Meeting',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 70,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Video On'),
                    Switch(
                        activeColor: Colors.white,
                        activeTrackColor: Colors.green,
                        value: true,
                        onChanged: (value) {})
                  ],
                ),
              ),
            ),
            Container(
                width: 300,
                height: 45,
                color: Colors.grey[800],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'Start a Meeting',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
