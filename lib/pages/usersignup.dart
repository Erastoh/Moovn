import 'dart:convert';
import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkBoxValue = false;

  bool _isLoadingButton = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String countryCode = '254';

  void RegisterNow() async {
    String url = 'auth/signup';
    var headerData = {
      'X-Requested-With': 'XMLHttpRequest',
      'Accept': 'application/json',
    };
    var body = {
      'name': nameController.text,
      'email': emailController.text,
      'gender': genderController.text,
      'status': statusController.text
    };
    setState(() {
      _isLoadingButton = true;
    });
    const jsonEndpoint = 'https://gorest.co.in/public/v2/users';
    var response =
        await http.post(Uri.parse(jsonEndpoint), body: json.encode(body));
    var message = jsonDecode(response.body);
    //print("RESPONSE" + response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        _isLoadingButton = false;
      });
      if (message == "Success") {
        Fluttertoast.showToast(
            msg: "You have Successfully Created an account",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => OPTMessage(
        //               value: msidn,
        //             )));
      } else {
        Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      setState(() {
        _isLoadingButton = false;
      });
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void _onCountryChange(CountryCode ccp) {
    this.countryCode = ccp.toString().substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Create Account")),
        body: Container(
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 35,
                ),

                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      hintText: "Enter Name ...", border: InputBorder.none),
                ),

                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: "Enter Email ...", border: InputBorder.none),
                ),

                TextField(
                  controller: genderController,
                  decoration: const InputDecoration(
                      hintText: "Enter Gender ...", border: InputBorder.none),
                ),

                button(),

                signInTextRow(),
                infoTextRow(),
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        RegisterNow();
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: _isLoadingButton
          ? Container(
              width: 19,
              height: 19,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                gradient: LinearGradient(
                  colors: <Color>[Colors.red, Colors.redAccent],
                ),
              ),
              padding: const EdgeInsets.all(12.0),
              child: const Text('SIGN UP', style: TextStyle(fontSize: 13)),
            ),
    );
  }

  Widget infoTextRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
              "By signing up, you agree to our Terms of Service and Privacy Policy",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13)),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              // Navigator.of(context).pop();
              // print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
