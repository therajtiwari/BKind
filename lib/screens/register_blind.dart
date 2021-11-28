import 'package:bkind/models/user_model.dart';
import 'package:bkind/screens/_home_blind.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/widget_functions.dart';
import "../utils/constants.dart";
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// error @ 540, 552
class RegisterBlind extends StatefulWidget {
  // const Register({Key? key}) : super(key: key);

  // our form key
  @override
  _RegisterBlindState createState() => _RegisterBlindState();
}

class _RegisterBlindState extends State<RegisterBlind> {
  final _formKey = GlobalKey<FormState>();

  final String url = "https://api.first.org/data/v1/countries";
  List countries = [];
  List countriess = ['xyz'];

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
    final userdata = new Map<String, dynamic>.from(resBody['data']);
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

  // firebase
  final _auth = FirebaseAuth.instance;

  String? errorMessage;

  final nameEditingController = TextEditingController();

  final countryEditingController = TextEditingController();

  final emailEditingController = TextEditingController();

  final passwordEditingController = TextEditingController();

  final confirmPasswordEditingController = TextEditingController();

  final languageEditingController = TextEditingController();
//
  final timeEditingController = TextEditingController();

  bool isVolunteer = false;

  String timeFromField = "00:00:00";
  String timeTillInput = "01:00:00";

  dynamic _value = 1;
  dynamic _languageValue = "English";
  dynamic _countryValue = "Select Country";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    //Name
    final nameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        nameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
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

    //country field
    // final countryField = TextFormField(
    //   autofocus: false,
    //   controller: countryEditingController,
    //   keyboardType: TextInputType.name,
    //   onSaved: (value) {
    //     countryEditingController.text = value!;
    //   },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //     prefixIcon: const Icon(Icons.flag_sharp),
    //     contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    //     hintText: "Country",
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //   ),
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       return ("Please Enter Your Name");
    //     }
    //   },
    // );

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailEditingController.text = value!;
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
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value) {
        passwordEditingController.text = value!;
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

    //confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Confirm your Password");
        }
        if (value != passwordEditingController.text) {
          return ("Passwords do not Match");
        }
      },
    );
    final countryField = DropdownButtonFormField(
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

    // TextFormField(
    //   controller: timeFromInput, //editing controller of this TextField
    //   validator: (value) {
    //     if (timeFromInput.text.isEmpty) {
    //       return ("Please Select Time");
    //     }
    //   },

    //   readOnly: true, //set it true, so that user will not able to edit text
    //   decoration: InputDecoration(
    //     prefixIcon: const Icon(Icons.access_time),
    //     contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    //     hintText: "Preferred Time From",
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //   ),
    //   onTap: () async {
    //     TimeOfDay? pickedTime = await showTimePicker(
    //       initialTime: TimeOfDay.now(),
    //       context: context,
    //     );

    //     if (pickedTime != null) {
    //       // print(pickedTime.format(context)); //output 10:51 PM
    //       DateTime parsedTime =
    //           DateFormat.jm().parse(pickedTime.format(context).toString());
    //       //converting to DateTime so that we can further format on different pattern.
    //       // print(parsedTime); //output 1970-01-01 22:53:00.000
    //       String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
    //       print(formattedTime); //output 14:59:00
    //       //DateFormat() is from intl package, you can format the time on any pattern you need.

    //       setState(
    //         () {
    //           timeFromInput.text = formattedTime; //set the value of text field.
    //         },
    //       );
    //     } else {
    //       print("Time is not selected");
    //     }
    //   },
    // );

    // final timeTillField = "01:00:00";
    // TextFormField(
    //   controller: timeTillInput, //editing controller of this TextField
    //   validator: (value) {
    //     if (timeTillInput.text.isEmpty) {
    //       return ("Please Select Time");
    //     }
    //   },
    //   readOnly: true, //set it true, so that user will not able to edit text
    //   decoration: InputDecoration(
    //     prefixIcon: const Icon(Icons.access_time),
    //     contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    //     hintText: "Preferred Time Till",
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //   ),
    //   onTap: () async {
    //     TimeOfDay? pickedTime = await showTimePicker(
    //       initialTime: TimeOfDay.now(),
    //       context: context,
    //     );

    //     if (pickedTime != null) {
    //       // print(pickedTime.format(context)); //output 10:51 PM
    //       DateTime parsedTime =
    //           DateFormat.jm().parse(pickedTime.format(context).toString());
    //       //converting to DateTime so that we can further format on different pattern.
    //       // print(parsedTime); //output 1970-01-01 22:53:00.000
    //       String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
    //       print(formattedTime); //output 14:59:00
    //       //DateFormat() is from intl package, you can format the time on any pattern you need.

    //       setState(
    //         () {
    //           timeTillInput.text = formattedTime; //set the value of text field.
    //         },
    //       );
    //     } else {
    //       print("Time is not selected");
    //     }
    //   },
    // );

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: colorDarkBlue,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            register(emailEditingController.text.trim(),
                passwordEditingController.text);
          },
          child: const Text(
            "Register",
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
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                        height: 50,
                        child: Text('Hi there, Kind Person',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                    const SizedBox(
                        height: 50,
                        child: Text('Register to continue',
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
                    confirmPasswordField,
                    const SizedBox(height: 20),
                    countryField,
                    const SizedBox(height: 20),
                    languageField,
                    // const SizedBox(height: 20),
                    // timeField,
                    const SizedBox(height: 20),
                    // timeFromField,
                    // const SizedBox(height: 20),
                    // timeTillField,
                    // const SizedBox(height: 20),
                    signUpButton,
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

  void register(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel(
      country: '',
      email: '',
      language: '',
      name: '',
      pTimeFrom: '',
      pTimeTill: '',
      uid: '',
      userSince: '',
      // isVol: '',
    );
    print("hereeeeeeeeeee");
    // writing all the values
    userModel.email = user!.email!;
    userModel.uid = user.uid;
    userModel.name = nameEditingController.text;
    userModel.email = emailEditingController.text;
    userModel.country = countryEditingController.text;
    userModel.language = _languageValue;
    userModel.pTimeFrom = timeFromField;
    userModel.pTimeTill = timeTillInput;
    // userModel.isVol = isVolunteer;

    // userModel.userSince = DateTime.now().millisecondsSinceEpoch as String?;
    userModel.userSince =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    // print("Account created successfully 1:) ");

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
    // print("Account created successfully :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }
}
