import 'dart:convert';
import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:moovntech/API/UserTODO.dart';
import 'package:moovntech/API/createUserdata.dart';

class UpdateMaintodolist extends StatefulWidget {
  final UserTodo value;
  const UpdateMaintodolist({Key? key, required this.value}) : super(key: key);
  @override
  _UpdateMaintodolistState createState() => _UpdateMaintodolistState();
}

class _UpdateMaintodolistState extends State<UpdateMaintodolist> {
  bool checkBoxValue = false;

  bool _isLoadingButton = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController due_onController = TextEditingController();
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
      "id": widget.value.id,
      "title": nameController.text,
      "due_on": due_onController.text,
      "status": statusController.text
    };
    setState(() {
      _isLoadingButton = true;
    });
    int userid = widget.value.id;
    const token =
        "351a7902d5170404fa8d2ee9d8ec7ae738f0b6f9300d8e49e7fcc3d797f77ce3";
    const jsonEndpoint = 'https://gorest.co.in/public/v2/users/2888/todos';
    var response = await http
        .patch(Uri.parse(jsonEndpoint), body: jsonEncode(body), headers: {
      "X-Requested-With": "XMLHttpRequest",
      "Authorization": "Bearer $token",
      "Content-Type": "application/json"
    });

    // var response = await http.post(Uri.parse(jsonEndpoint), body: json.encode(body));
    var message = jsonDecode(response.body);
    //print("RESPONSE" + response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        _isLoadingButton = false;
      });
      if (message == "Success") {
        Fluttertoast.showToast(
            msg: "You have Successfully updated To-Do",
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
            msg: "Authentication failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
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

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      nameController.text = widget.value.title;
      due_onController.text = widget.value.due_on;
      statusController.text = widget.value.status;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Update To Do")),
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            hintText: "Enter Title ...",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: due_onController,
                        decoration: const InputDecoration(
                            hintText: "Enter due Date ...",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: statusController,
                        decoration: const InputDecoration(
                            hintText: "Status", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                /// button(),
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
                                colors: <Color>[Colors.red, Colors.redAccent],
                              ),
                            ),
                            padding: const EdgeInsets.all(12.0),
                            child: const Text('Update ToDo',
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
