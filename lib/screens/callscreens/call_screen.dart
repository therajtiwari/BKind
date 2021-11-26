import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:bkind/models/call.dart';
import 'package:bkind/provider/user_provider.dart';
import 'package:bkind/resources/call_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class CallScreen extends StatefulWidget {
  final Call call;

  CallScreen({
    Key? key,
    required this.call,
  }) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final CallMethods callMethods = CallMethods();
  late UserProvider userProvider;
  late StreamSubscription callStreamSubscription;

  @override
  void initState() {
    super.initState();
    addPostFrameCallback();
  }

  @override
  void dispose() {
    // clear users
    // _users.clear();
    // destroy sdk
    // AgoraRtcEngine.leaveChannel();
    // AgoraRtcEngine.destroy();
    callStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Call Screen'),
            MaterialButton(
              // add text

              child: Text('End Call'),
              onPressed: () {
                callMethods.endCall(call: widget.call);
                Navigator.pop(context);
              },
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }

  addPostFrameCallback() {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      userProvider = Provider.of<UserProvider>(context, listen: false);

      callStreamSubscription = callMethods
          .callStream(uid: userProvider.getUser.uid)
          .listen((DocumentSnapshot ds) {
        // defining the logic
        // check if ds is null
        bool isNull = (ds.data == null);
        switch (isNull) {
          case true:
            Navigator.pop(context);
            break;
          default:
            break;
        }
      });
    });
  }
}
