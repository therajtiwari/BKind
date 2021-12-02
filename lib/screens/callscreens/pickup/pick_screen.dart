import 'package:bkind/models/call.dart';
import 'package:bkind/resources/call_methods.dart';
import 'package:bkind/screens/callscreens/call_screen.dart';
import 'package:bkind/utils/permissions.dart';
// import 'package:bkind/utils/permissions.dart';
import 'package:flutter/material.dart';

class PickupScreen extends StatelessWidget {
  final Call call;
  final CallMethods callMethods = CallMethods();

  PickupScreen({
    required this.call,
  });

  // make an async fucntion names getTotalUsers


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100),
              const Text(
                "Someone needs your help",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 200),
              Text(
                call.callerName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.call_end),
                    iconSize: 40,
                    color: Colors.redAccent,
                    onPressed: () async {
                      await callMethods.endCall(call: call);
                    },
                  ),
                  const SizedBox(width: 60),
                  IconButton(
                    icon: const Icon(Icons.call),
                    iconSize: 40,
                    color: Colors.green,
                    onPressed: () async => await Permissions
                            .cameraAndMicrophonePermissionsGranted()
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CallScreen(call: call),
                            ),
                          )
                        : {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
