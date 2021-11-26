import 'package:bkind/models/call.dart';
import 'package:bkind/provider/user_provider.dart';
import 'package:bkind/resources/call_methods.dart';
import 'package:bkind/screens/callscreens/pickup/pick_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PickupLayout extends StatelessWidget {
  final Widget scaffold;
  final CallMethods callMethods = CallMethods();

  PickupLayout({
    required this.scaffold,
  });

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return (userProvider != null && userProvider.getUser != null)
        ? StreamBuilder<DocumentSnapshot>(
            stream: callMethods.callStream(uid: userProvider.getUser.uid),
            builder: (context, snapshot) {
              print(userProvider.getUser.uid);
              print("here I");
              // print(snapshot.data!.exists);
              if (snapshot.hasError) {
                return scaffold;
              }
              print("ok");
              if (snapshot.hasData && !snapshot.data!.exists) {
                return scaffold;
              }
              // print("okkkkkkkkkkkkkkkkkkkk");

              Map<String, dynamic> data =
                  snapshot.data?.data() as Map<String, dynamic>;
              // print("downnnnnnnnnn");
              Call call = Call.fromMap(data);
              if (!call.hasDialled) {
                return PickupScreen(call: call);
              } else {
                return scaffold;
              }
            },
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
