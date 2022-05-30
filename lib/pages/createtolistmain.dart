import 'dart:convert';
import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:moovntech/API/createUserdata.dart';
import 'package:moovntech/pages/CreateTodos.dart';

class CreateMaintodolist extends StatefulWidget {
  final UserData value;
  const CreateMaintodolist({Key? key, required this.value}) : super(key: key);
  @override
  _CreateMaintodolistState createState() => _CreateMaintodolistState();
}

class _CreateMaintodolistState extends State<CreateMaintodolist> {
  bool checkBoxValue = false;
  late DateTime date = DateTime.now();
  bool _isLoadingButton = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController dueonController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String countryCode = '254';

  void RegisterNow() async {
    // Random rand = Random();
    int userid = widget.value.id;
    String url = 'auth/signup';
    var headerData = {
      'X-Requested-With': 'XMLHttpRequest',
      'Accept': 'application/json',
    };
    var body = {
      "user_id": 2888,
      "title": titleController.text,
      "due_on": date.toString(),
      "status": "pending"
    };
    setState(() {
      _isLoadingButton = true;
    });

    const token =
        '351a7902d5170404fa8d2ee9d8ec7ae738f0b6f9300d8e49e7fcc3d797f77ce3';
    const jsonEndpoint = 'https://gorest.co.in/public/v1/users/2888/todos';
    var response = await http
        .post(Uri.parse(jsonEndpoint), body: jsonEncode(body), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    });
    var message = jsonDecode(response.body);
    print("RESPONSE" + response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        _isLoadingButton = false;
      });
      // if (message == "Success") {
      Fluttertoast.showToast(
          msg: "You have Successfully Created To-Do",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => UserTodoHomePage(
                    value: widget.value,
                  )));
      // } else {
      //   Fluttertoast.showToast(
      //       msg: "Error Occured",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       backgroundColor: Colors.green,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
      // }
    } else {
      setState(() {
        _isLoadingButton = false;
      });

      Fluttertoast.showToast(
          msg: "Authentication failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<Null> selectedTimePiker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      helpText: 'Select Activity date',
    );
    if (picked != null) {
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Create ToDo")),
        body: Container(
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 35,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                            hintText: "Enter Title ...",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      selectedTimePiker(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: date == null
                            ? const Text("Select Date ...")
                            : Text(date.toString()),
                        // TextField(
                        //   enabled: false,
                        //   controller: dueonController,
                        //   decoration: const InputDecoration(
                        //       hintText: "Enter due Date ...",
                        //       border: InputBorder.none),
                        // ),
                      ),
                    ),
                  ),
                ), // button(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
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
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              gradient: LinearGradient(
                                colors: <Color>[Colors.blue, Colors.blueAccent],
                              ),
                            ),
                            padding: const EdgeInsets.all(12.0),
                            child: const Text('Create ToDo',
                                style: TextStyle(fontSize: 13)),
                          ),
                  ),
                ),

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
