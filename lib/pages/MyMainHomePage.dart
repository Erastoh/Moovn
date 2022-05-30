import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:moovntech/API/createUserdata.dart';
import 'package:moovntech/pages/CreateTodos.dart';

class MyMainHomepage extends StatefulWidget {
  @override
  _MyMainHomepageState createState() => _MyMainHomepageState();
}

class _MyMainHomepageState extends State<MyMainHomepage> {
  @override
  void initState() {
    fetchToDoList();
    super.initState();
  }

  List<UserData> _items = [];
  bool loading = false;

  List<UserData> get items {
    return [..._items];
  }

  Future<Null> fetchToDoList() async {
    const jsonEndpoint = 'https://gorest.co.in/public/v2/users';
    final response = await http.get(Uri.parse(jsonEndpoint));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print(data);
      if (mounted) {
        setState(() {
          for (Map i in data) {
            _items.add(UserData.fromJson(i));
            loading = false;
          }
        });
      }
    }
  }

  Future<Null> LoginMeth() async {
    String url = 'auth/signup';
    var headerData = {
      'X-Requested-With': 'XMLHttpRequest',
      'Accept': 'application/json',
    };
    // var body = {
    //   'name': nameController.text,
    //   'email': emailController.text,
    //   'gender': genderController.text,
    //   'status': statusController.text
    // };
    // setState(() {
    //   _isLoadingButton = true;
    // });
    const jsonEndpoint = 'https://gorest.co.in/public/v2/users';
    var response = await http.get(Uri.parse(jsonEndpoint));
    var message = jsonDecode(response.body);
    //print("RESPONSE" + response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        // _isLoadingButton = false;
      });
      if (message == "Success") {
        // Fluttertoast.showToast(
        //     msg: "You have Successfully Created an account",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     backgroundColor: Colors.green,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

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
        // _isLoadingButton = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
      ),
      drawer: Drawer(),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(10.0),
          itemCount: _items.length,
          itemBuilder: (context, int i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("id:    ${_items[i].id}"),
                        Text("Name:    ${_items[i].name}"),
                        Text("Email:     ${_items[i].email}"),
                        Text("Gender:  ${_items[i].gender}"),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UserTodoHomePage(
                                                  value: _items[i],
                                                )));
                                  },
                                  child: const Text("View To-DO")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
