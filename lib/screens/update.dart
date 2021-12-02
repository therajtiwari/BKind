import 'package:bkind/models/user_model.dart';
import 'package:bkind/screens/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/widget_functions.dart';
import "../utils/constants.dart";

import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Update extends StatefulWidget {
  UserModel? loggedInUser;

  Update(this.loggedInUser, {Key? key}) : super(key: key);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  User? user = FirebaseAuth.instance.currentUser;

  final _formKey = GlobalKey<FormState>();

  final String url = "https://api.first.org/data/v1/countries";
  List countries = [];
  List countriess = ['xyz'];

  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final timeEditingController = TextEditingController();
  final timeFromInput = TextEditingController();
  final timeTillInput = TextEditingController();

  Future<String> getSWData() async {
    var res =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    // print(res);
    var resBody = await json.decode(res.body);
    // print(resBody);
    // setState(() {
    //   data = resBody;
    // });

    // print(resBody["data"]["DZ"]["country"]);
    final userdata = Map<String, dynamic>.from(resBody['data']);
    // final userdata2 = new Map<String, dynamic>.from(userdata['DZ']);
    List countriesTemp = [];
    userdata.forEach((k, v) {
      countriesTemp.add(resBody['data'][k]['country']);
      // print(resBody['data'][k]['country']);
    });

    setState(() => countries = countriesTemp);
    // sort countries
    countries.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    // print(countries);
    print("done");
    return "success";
  }

  @override
  void initState() {
    super.initState();
    // print("doing");
    getSWData();
    // print("done");
    Fluttertoast.showToast(msg: "Please enter your all details ");
  }

  dynamic _value = 1;
  dynamic _languageValue = "English";
  dynamic _countryValue = "India";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    String name = widget.loggedInUser!.name;
    String email = widget.loggedInUser!.email;

    String password = "123456";
    bool role = widget.loggedInUser!.isVol;

    //Name
    final nameField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: name,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (value) {
        nameEditingController.text = value;
        print(name);
      },
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Please Enter Your Name");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
      },
    );

    // email field
    final emailField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        emailEditingController.text = value;
        print(email);
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: email,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      initialValue: password,
      obscureText: true,
      onChanged: (value) {
        setState(() {
          password = value;
          print(password);
        });
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter a Password");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password (Min. 6 Characters)");
        }
      },
    );

    final countryField = DropdownButtonFormField(
      value: _countryValue,
      isExpanded: true,
      items: countries
          .map((value) => DropdownMenuItem(
                child: Text(value),
                value: value,
              ))
          .toList(),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.flag_sharp),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Select Country",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _countryValue = value;
          // print(_languageValue);
        });
      },
      validator: (value) {
        if (_countryValue!.isEmpty) {
          return ("Please select a country");
        }
      },
    );

    final languageField = DropdownButtonFormField(
      value: _languageValue,
      items: const [
        DropdownMenuItem(
          child: Text("Hindi"),
          value: "Hindi",
        ),
        DropdownMenuItem(
          child: Text("English"),
          value: "English",
        ),
        DropdownMenuItem(
          child: Text("French"),
          value: "French",
        ),
        DropdownMenuItem(
          child: Text("Spanish"),
          value: "Spanish",
        )
      ],
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.language),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Preferred Language",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _languageValue = value;
          print(_languageValue);
        });
      },
      validator: (value) {
        if (_languageValue!.isEmpty) {
          return ("Please select a language");
        }
      },
    );

    final timeFromField = TextFormField(
      controller: timeFromInput, //editing controller of this TextField
      validator: (value) {
        if (timeFromInput.text.isEmpty) {
          return ("Please Select Time");
        }
      },

      readOnly: true, //set it true, so that user will not able to edit text
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.access_time),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Preferred Time From",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
        );

        if (pickedTime != null) {
          // print(pickedTime.format(context)); //output 10:51 PM
          DateTime parsedTime =
              DateFormat.jm().parse(pickedTime.format(context).toString());
          //converting to DateTime so that we can further format on different pattern.
          // print(parsedTime); //output 1970-01-01 22:53:00.000
          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
          print(formattedTime); //output 14:59:00
          //DateFormat() is from intl package, you can format the time on any pattern you need.

          setState(
            () {
              timeFromInput.text = formattedTime; //set the value of text field.
            },
          );
        } else {
          print("Time is not selected");
        }
      },
    );

    final timeTillField = TextFormField(
      controller: timeTillInput, //editing controller of this TextField
      validator: (value) {
        if (timeTillInput.text.isEmpty) {
          return ("Please Select Time");
        }
      },
      readOnly: true, //set it true, so that user will not able to edit text
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.access_time),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Preferred Time Till",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
        );

        if (pickedTime != null) {
          // print(pickedTime.format(context)); //output 10:51 PM
          DateTime parsedTime =
              DateFormat.jm().parse(pickedTime.format(context).toString());
          //converting to DateTime so that we can further format on different pattern.
          // print(parsedTime); //output 1970-01-01 22:53:00.000
          String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
          print(formattedTime); //output 14:59:00
          //DateFormat() is from intl package, you can format the time on any pattern you need.

          setState(
            () {
              timeTillInput.text = formattedTime; //set the value of text field.
            },
          );
        } else {
          print("Time is not selected");
        }
      },
    );

    //update button
    final updateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: colorDarkBlue,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            updateDetailsToFirestore(email, name);
          },
          child: const Text(
            "Update",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: colorDarkBlue),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                        height: 50,
                        child: Text('Update',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ))),
                    const SizedBox(height: 20),
                    nameField,

                    const SizedBox(height: 20),

                    passwordField,

                    const SizedBox(height: 20),
                    countryField,
                    const SizedBox(height: 20),
                    languageField,
                    // const SizedBox(height: 20),
                    // timeField,
                    (role == true)
                        ? const SizedBox(height: 20)
                        : const SizedBox(height: 0),
                    (role == true) ? timeFromField : const Text(''),
                    (role == true)
                        ? const SizedBox(height: 20)
                        : const SizedBox(height: 0),
                    (role == true) ? timeTillField : const Text(''),
                    (role == true)
                        ? const SizedBox(height: 20)
                        : const SizedBox(height: 0),
                    updateButton,
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  updateDetailsToFirestore(String email, String name) async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    UserModel userModel = UserModel(
      country: '',
      email: '',
      language: '',
      name: '',
      pTimeFrom: '',
      pTimeTill: '',
      uid: '',
      userSince: '',
      isVol: false,
      rating: widget.loggedInUser!.rating,
    );
    print("hereeeeeeeeeee");
    print(email);
    print(name);
    // writing all the values

    userModel.uid = user!.uid;
    userModel.name = nameEditingController.text;
    userModel.email = emailEditingController.text;
    userModel.country = _countryValue;
    userModel.language = _languageValue;
    userModel.pTimeFrom = timeFromInput.text;
    userModel.pTimeTill = timeTillInput.text;
    // userModel.userSince = DateTime.now().millisecondsSinceEpoch as String?;
    userModel.userSince =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    // print("Account created successfully 1:) ");

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({
          'name': userModel.name,
          'email': userModel.email,
          'country': userModel.country,
          'language': userModel.language,
          'pTimeFrom': userModel.pTimeFrom,
          'pTimeTill': userModel.pTimeTill
        })
        .then((value) =>
            Fluttertoast.showToast(msg: "Account updated successfully :) "))
        .then((value) => Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(builder: (context) => const Profile()),
            (route) => false));

    // print("Account created successfully :) ");
  }
}
