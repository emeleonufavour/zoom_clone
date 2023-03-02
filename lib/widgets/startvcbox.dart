import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:permission_handler/permission_handler.dart';

import '../screens/vcscreen.dart';

class VideoCallBox extends StatefulWidget {
  const VideoCallBox({super.key});

  @override
  State<VideoCallBox> createState() => _VideoCallBoxState();
}

class _VideoCallBoxState extends State<VideoCallBox> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _validateError = false;

  @override
  void dispose() {
    _textEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> _onJoin() async {
    setState(() {
      _textEditingController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_textEditingController.text.isNotEmpty) {
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VideoCallScreen(
                    channel: _textEditingController.text,
                  )));
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    log(status.toString());
  }

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
            //text field to create a meeting name
            Container(
                width: 300,
                height: 45,
                color: Colors.grey[800],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        errorText:
                            _validateError ? "Meeting ID is required" : null,
                        hintText: "Create a meeting ID",
                        border: InputBorder.none),
                  ),
                )),
            Container(
                width: 300,
                height: 45,
                color: Colors.grey[700],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: _onJoin,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'Start Meeting',
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
