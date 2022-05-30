// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../main.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:fluttertoast/fluttertoast.dart';

// class AppDrawer extends StatefulWidget {
//   @override
//   _AppDrawerState createState() => _AppDrawerState();
// }

// var _txt = TextStyle(
//   color: Colors.black,
//   fontFamily: "Sans",
// );

// var _txtCategory = _txt.copyWith(
//     fontSize: 14.5, color: Colors.black54, fontWeight: FontWeight.w500);

// class _AppDrawerState extends State<AppDrawer> {
//   Future mainExpected() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       String login = prefs.getString('email');
//       if (login == null) {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (context) => SignInPage()));
//       } else {
//         // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen()));
//       }
//     });

//     // runApp(MaterialApp(home: login == null ? SignInPage() : ProfileScreen()));
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getUserDetails();
//     // mainExpected();
//   }

//   Future deleteUser(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           // title: Text('Logout?'),
//           content: const Text('Confirm Log out',
//               style: TextStyle(color: Colors.red)),
//           actions: [
//             FlatButton(a
//               child: const Text('CANCEL'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             FlatButton(
//               child: const Text(
//                 'OK',
//                 style: TextStyle(color: Colors.red),
//               ),
//               onPressed: () async {
//                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                 prefs.remove('role');
//                 prefs.remove('email');
//                 prefs.remove('name');
//                 // Navigator.pop(context);

//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (BuildContext ctx) => ecommerce()));
//                 Fluttertoast.showToast(
//                     msg: "You have logged out",
//                     toastLength: Toast.LENGTH_SHORT,
//                     gravity: ToastGravity.CENTER,
//                     backgroundColor: Colors.red,
//                     textColor: Colors.white,
//                     fontSize: 16.0);
//               },
//             )
//           ],
//         );
//       },
//     );
//   }

//   int userID;
//   String names;
//   String email;
//   String phoneNumber;
//   String token;
//   SharedPreferences sharedPreferences;
//   var memail;
//   var role;
//   var main_email;

//   _getUserDetails() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     memail = prefs.getString('email');
//     role = prefs.getString('role');
//     main_email = prefs.getString('main_email');
//     sharedPreferences = await SharedPreferences.getInstance();
//     setState(() {
//       token = sharedPreferences.get('token');
//       userID = sharedPreferences.get('user_id');
//       names = sharedPreferences.get('user_names');
//       phoneNumber = sharedPreferences.get('user_phone');
//       email = sharedPreferences.get('contact_email');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     //AuthBlock auth = Provider.of<AuthBlock>(context);
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           color: Colors.white,
//           child: ListView(
//             children: <Widget>[
//               Row(
//                 children: [
//                   Spacer(),
//                   IconButton(
//                       color: Colors.red,
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       icon: Icon(
//                         Icons.close,
//                         size: 40,
//                       )),
//                 ],
//               ),
//               // if (auth.isLoggedIn)
//               // memail == null
//               //     ? Container()
//               //     :
//               //     // UserAccountsDrawerHeader(
//               //     //     // decoration: BoxDecoration(
//               //     //     //     image: DecorationImage(
//               //     //     //   fit: BoxFit.cover,
//               //     //     //   image: AssetImage('assets/logo.png'),
//               //     //     // )),
//               //     //     // currentAccountPicture: CircleAvatar(
//               //     //     //   backgroundImage: NetworkImage(''),
//               //     //     // ),
//               //     //     accountEmail:
//               //     Padding(
//               //         padding: const EdgeInsets.fromLTRB(10, 4, 4, 4),
//               //         child: Row(
//               //           children: [
//               //             // Padding(
//               //             //   padding: const EdgeInsets.all(4.0),
//               //             //   child: Text("Phone: +$memail"),
//               //             // ),
//               //             RaisedButton(
//               //                 onPressed: () {
//               //                   // Navigator.push(
//               //                   //     context,
//               //                   //     MaterialPageRoute(
//               //                   //         builder: (BuildContext ctx) =>
//               //                   //             MyProfileAccount(
//               //                   //               phone: int.parse(memail),
//               //                   //             )));
//               //                   Navigator.push(
//               //                       context,
//               //                       MaterialPageRoute(
//               //                           builder: (BuildContext ctx) => profil()));
//               //                 },
//               //                 child: Row(
//               //                   children: [
//               //                     Icon(Icons.person),
//               //                     SizedBox(
//               //                       width: 10,
//               //                     ),
//               //                     Text("Profile.",
//               //                         style: TextStyle(
//               //                             fontSize: 18, color: Colors.red)),
//               //                   ],
//               //                 ))
//               //           ],
//               //         ),
//               //       ),
//               // accountName:
//               // ),
//               Padding(
//                 padding:
//                     const EdgeInsets.only(top: 10.0, left: 85.0, right: 30.0),
//                 child: Divider(
//                   color: Colors.black12,
//                   height: 2.0,
//                 ),
//               ),
//               ListTile(
//                 leading: Icon(Icons.home, color: Colors.green),
//                 title: Text('Home'),
//                 onTap: () {
//                   // Navigator.pop(context);
//                   Navigator.pushNamed(context, '/homebodymain');
//                 },
//               ),

//               memail == null
//                   ? Container()
//                   : Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               top: 10.0, left: 85.0, right: 30.0),
//                           child: Divider(
//                             color: Colors.black12,
//                             height: 2.0,
//                           ),
//                         ),
//                         ListTile(
//                           leading: Icon(Icons.person, color: Colors.green),
//                           title: Text('Profile'),
//                           onTap: () {
//                             // Navigator.pop(context);
//                             // Navigator.pushNamed(context, '/homebodymain');
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (BuildContext ctx) => profil()));
//                           },
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               top: 10.0, left: 85.0, right: 30.0),
//                           child: Divider(
//                             color: Colors.black12,
//                             height: 2.0,
//                           ),
//                         ),
//                         // Column(
//                         //   children: <Widget>[
//                         //     Padding(
//                         //       padding:
//                         //           const EdgeInsets.only(top: 15.0, left: 20.0),
//                         //       child: InkWell(
//                         //         onTap: () {
//                         //           Navigator.push(
//                         //               context,
//                         //               MaterialPageRoute(
//                         //                   builder: (context) =>
//                         //                       CurrencySelect()));
//                         //         },
//                         //         child: Row(
//                         //           children: <Widget>[
//                         //             Padding(
//                         //                 padding: EdgeInsets.only(right: 23),
//                         //                 child: FaIcon(
//                         //                   FontAwesomeIcons.dollarSign,
//                         //                   color: Colors.green,
//                         //                   size: 20,
//                         //                 )
//                         //                 //         Icon(
//                         //                 //   Icons.lock_open_rounded,
//                         //                 //   size: 25.0,
//                         //                 //   color: Colors.green,
//                         //                 // ),
//                         //                 ),
//                         //             SizedBox(
//                         //               width: 13,
//                         //             ),
//                         //             Text(
//                         //               "Currency",
//                         //               // style: _txtCategory,
//                         //             ),
//                         //           ],
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ],
//                         // ),

// //=================currency
//                         ListTile(
//                           leading: FaIcon(
//                             FontAwesomeIcons.dollarSign,
//                             color: Colors.green,
//                             size: 20,
//                           ),
//                           title: Text('Currency'),
//                           // trailing: Text('New',
//                           //     style: TextStyle(
//                           //         color: Theme.of(context).primaryColor)),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => CurrencySelect()));
//                           },
//                         ),

//                         Padding(
//                           padding: const EdgeInsets.only(
//                               top: 10.0, left: 85.0, right: 30.0),
//                           child: Divider(
//                             color: Colors.black12,
//                             height: 2.0,
//                           ),
//                         ),
//                         ListTile(
//                           leading:
//                               Icon(Icons.shopping_basket, color: Colors.green),
//                           title: Text('My Orders'),
//                           trailing: Text('New',
//                               style: TextStyle(
//                                   color: Theme.of(context).primaryColor)),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (BuildContext ctx) =>
//                                         Success_payment()));
//                             // Navigator.pop(context);
//                             // Navigator.pushNamed(context, '/shop');
//                           },
//                         ),
//                       ],
//                     ),

//               Padding(
//                 padding:
//                     const EdgeInsets.only(top: 10.0, left: 85.0, right: 30.0),
//                 child: Divider(
//                   color: Colors.black12,
//                   height: 2.0,
//                 ),
//               ),
//               // ListTile(
//               //   leading: Icon(Icons.category,
//               //       color: Theme.of(context).accentColor),
//               //   title: Text('Categories'),
//               //   onTap: () {
//               //     // Navigator.pop(context);
//               //     // Navigator.pushNamed(context, '/categorise');
//               //     Navigator.push(
//               //         context,
//               //         MaterialPageRoute(
//               //             builder: (BuildContext ctx) =>
//               //                 drawercategoriesList()));
//               //   },
//               // ),
//               ListTile(
//                 leading: Icon(Icons.favorite, color: Colors.green),
//                 title: Text('My Wishlist'),
//                 trailing: Container(
//                   padding: const EdgeInsets.all(10.0),
//                   decoration: new BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Theme.of(context).primaryColor,
//                   ),
//                   child: Text('',
//                       style: TextStyle(color: Colors.white, fontSize: 10.0)),
//                 ),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, '/wishlist');
//                 },
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.only(top: 10.0, left: 85.0, right: 30.0),
//                 child: Divider(
//                   color: Colors.black12,
//                   height: 2.0,
//                 ),
//               ),
//               ListTile(
//                 leading: Icon(Icons.shopping_cart, color: Colors.green),
//                 title: Text('My Cart'),
//                 trailing: Container(
//                   padding: const EdgeInsets.all(10.0),
//                   decoration: new BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Theme.of(context).primaryColor,
//                   ),
//                   child: Text('',
//                       style: TextStyle(color: Colors.white, fontSize: 10.0)),
//                 ),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, '/cart');
//                 },
//               ),

//               Padding(
//                 padding:
//                     const EdgeInsets.only(top: 10.0, left: 85.0, right: 30.0),
//                 child: Divider(
//                   color: Colors.black12,
//                   height: 2.0,
//                 ),
//               ),
//               memail != null
//                   ? Container()
//                   : ListTile(
//                       leading: Icon(Icons.lock, color: Colors.green),
//                       title: Text('Login'),
//                       onTap: () {
//                         // Navigator.pop(context);
//                         // Navigator.of(context).pushNamed(SignInPage.routeName);
//                         // //Navigator.pushNamed(context, '/auth');
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext ctx) => SignInPage()));
//                       },
//                     ),

//               // ListTile(
//               //   leading: Icon(Icons.settings,
//               //       color: Theme.of(context).accentColor),
//               //   title: Text(
//               //     // AppLocalizations.of(context).settings
//               //     "Settings",
//               //   ),
//               //   // AppLocalizations.of(context).appTitle
//               //   onTap: () {
//               //     // Navigator.pop(context);
//               //     // Navigator.pushNamed(context, '/settings');
//               //     Navigator.push(
//               //         context,
//               //         MaterialPageRoute(
//               //             builder: (BuildContext ctx) => SettingsPagenew()));
//               //   },
//               // ),
//               memail == null
//                   ? Container()
//                   : ListTile(
//                       leading: Icon(Icons.exit_to_app, color: Colors.green),
//                       title: Text('Logout'),
//                       onTap: () async {
//                         deleteUser(context);
//                       },
//                     ),
//               Padding(
//                 padding:
//                     const EdgeInsets.only(top: 10.0, left: 85.0, right: 30.0),
//                 child: Divider(
//                   color: Colors.black12,
//                   height: 2.0,
//                 ),
//               ),

//               // role != 'Agent'
//               //     ? Container()
//               //     :
//               ListTile(
//                 leading: Icon(Icons.house, color: Colors.green),
//                 title: Text('Agro-Dealer'),
//                 onTap: () async {
//                   // deleteUser(context);
//                   SharedPreferences prefs =
//                       await SharedPreferences.getInstance();
//                   // var email = prefs.getString('email');
//                   var role = prefs.getString("role");
//                   if (role == 'Agent') {
//                     Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: (context) => Agentshome()));
//                   } else {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => AgroSignInPage()));
//                   }
//                 },
//               ),

//               role != 'sales'
//                   ? Container()
//                   : Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               top: 10.0, left: 85.0, right: 30.0),
//                           child: Divider(
//                             color: Colors.black12,
//                             height: 2.0,
//                           ),
//                         ),
//                         ListTile(
//                           leading: Icon(Icons.house, color: Colors.green),
//                           title: Text('Sales Agent'),
//                           onTap: () async {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => SaleHomePage()));
//                           },
//                         ),
//                       ],
//                     ),

//               // Padding(
//               //   padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
//               //   child: RaisedButton(
//               //       color: Colors.blue,
//               //       onPressed: () async {
//               //         SharedPreferences prefs =
//               //             await SharedPreferences.getInstance();
//               //         // var email = prefs.getString('email');
//               //         var role = prefs.getString("role");
//               //         if (role == 'Agent') {
//               //           Navigator.of(context).push(
//               //               MaterialPageRoute(
//               //                   builder: (context) => Agentshome()));
//               //         } else {
//               //           Navigator.of(context).push(MaterialPageRoute(
//               //               builder: (context) => AgroSignInPage()));
//               //         }
//               //       },
//               //       child: Text("Agro-Dealer",
//               //           style: TextStyle(
//               //             color: Colors.white,
//               //             fontSize: 20,
//               //           ))),
//               // ),
//               //
//               Padding(
//                 padding:
//                     const EdgeInsets.only(top: 10.0, left: 85.0, right: 30.0),
//                 child: Divider(
//                   color: Colors.black12,
//                   height: 2.0,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: RaisedButton(
//                   color: Colors.red,
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (BuildContext ctx) => RegisterAsAgent()));
//                   },
//                   child: Text("Register as an Agent",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                       )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
