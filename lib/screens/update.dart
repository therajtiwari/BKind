import "package:flutter/material.dart";
import '../utils/widget_functions.dart';
import "../utils/constants.dart";

import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final _formKey = GlobalKey<FormState>();

  final String url = "https://api.first.org/data/v1/countries";
  List countries = [];
  List countriess = ['xyz'];

  String name = "Riya Joy";
  String email = "riyajoy@somaiya.edu";
  String country = "India";
  String password = "123456";

  String role = "Vol";

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
  }

  dynamic _value = 1;
  dynamic _languageValue = "English";
  dynamic _countryValue = "India";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    //Name
    final nameField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.name,
      initialValue: name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (value) {
        setState(() {
          name = value;
          print(name);
        });
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
      initialValue: email,
      onChanged: (value) {
        setState(() {
          email = value;
          print(email);
        });
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
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
            // register(emailEditingController.text.trim(),
            //     passwordEditingController.text);
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
                    emailField,
                    const SizedBox(height: 20),
                    passwordField,

                    const SizedBox(height: 20),
                    countryField,
                    const SizedBox(height: 20),
                    languageField,
                    // const SizedBox(height: 20),
                    // timeField,
                    (role == "Vol")
                        ? const SizedBox(height: 20)
                        : const SizedBox(height: 0),
                    (role == "Vol") ? timeFromField : const Text(''),
                    (role == "Vol")
                        ? const SizedBox(height: 20)
                        : const SizedBox(height: 0),
                    (role == "Vol") ? timeTillField : const Text(''),
                    (role == "Vol")
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
}
