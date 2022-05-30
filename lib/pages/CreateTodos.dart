import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:moovntech/API/UserTODO.dart';
import 'package:moovntech/API/createUserdata.dart';
import 'package:moovntech/pages/UpdateTodo.dart';
import 'package:moovntech/pages/createtolistmain.dart';

class UserTodoHomePage extends StatefulWidget {
  final UserData value;
  const UserTodoHomePage({Key? key, required this.value}) : super(key: key);

  @override
  _UserTodoHomePageState createState() => _UserTodoHomePageState();
}

class _UserTodoHomePageState extends State<UserTodoHomePage> {
  var userid;
  static int id = 11;
  @override
  void initState() {
    userid = widget.value.id;
    setState(() {
      id = userid;
    });
    fetchToDoList();
    super.initState();
  }

  List<UserTodo> _items = [];
  bool loading = false;

  List<UserTodo> get items {
    return [..._items];
  }

  Future<Null> fetchToDoList() async {
    var userid = widget.value.id;
    const jsonEndpoint = 'https://gorest.co.in/public/v2/users/2888/todos';
    final response = await http.get(Uri.parse(jsonEndpoint));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("here");
      print(data);
      if (mounted) {
        setState(() {
          for (Map i in data) {
            _items.add(UserTodo.fromJson(i));
            loading = false;
          }
        });
      }
    }
  }

  DeleteToDoLIst() async {
    var userid = widget.value.id;
    const jsonEndpoint = 'https://gorest.co.in/public/v2/users/2888/todos';
    // final response = await http.get(Uri.parse(jsonEndpoint))   'https://gorest.co.in/public/v2/users/2795/todos';

    var headerData = {
      'X-Requested-With': 'XMLHttpRequest',
      'Accept': 'application/json',
    };
    var body = {'id': "1483"};
    setState(() {
      // _isLoadingButton = true;
    });
    const token =
        '351a7902d5170404fa8d2ee9d8ec7ae738f0b6f9300d8e49e7fcc3d797f77ce3';
    var response = await http
        .delete(Uri.parse(jsonEndpoint), body: jsonEncode(body), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    });

    // var response = await http.post(Uri.parse(jsonEndpoint), body: json.encode(body));
    var message = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      Fluttertoast.showToast(
          msg: "Deleted Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => UpdateMaintodolist(
      //               value: _items[i],
      //             )));
    } else {
      Fluttertoast.showToast(
          msg: "Authentication Failed",
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
        title: Text("To-do List"),
      ),
      // drawer: Drawer(),
      body: Stack(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(10.0),
            itemCount: _items.length,
            itemBuilder: (context, int i) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title:  ${_items[i].title}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("due_on:  ${_items[i].due_on}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("status:  ${_items[i].status}"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateMaintodolist(
                                                value: _items[i],
                                              )));
                                },
                                child: const Text("Update")),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  DeleteToDoLIst();
                                },
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // Container(
          //     child: Center(
          //         child: Text(
          //   "No available To-do-List",
          // ))),
        ],
      ),

      floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateMaintodolist(
                          value: widget.value,
                        )));
          },
          child: const Text("Create To-DO")),
    );
  }
}
