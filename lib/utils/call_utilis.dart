import 'dart:math';

import 'package:bkind/models/call.dart';
import 'package:bkind/models/user_model.dart';
import 'package:bkind/resources/call_methods.dart';
import 'package:bkind/screens/callscreens/call_screen.dart';
import 'package:flutter/material.dart';

class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({required UserModel from, required UserModel to, context}) async {
    print("in call wtf this");

    Call call = Call(
      callerId: from.uid,
      callerName: from.name,
      callerPic: "",
      receiverId: to.uid,
      receiverName: to.name,
      receiverPic: "",
      channelId: Random().nextInt(1000).toString(),
      hasDialled: true,
    );
    print("done this");

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      print("we will push now");

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallScreen(call: call),
          ));
    }
  }
}
