// ignore_for_file: prefer_const_constructors

import 'dart:convert';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:node_js_integration_flutter/cryptography/encrypt_decrypt.dart';
import 'package:node_js_integration_flutter/student_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Encrypt_Decrypt(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final regController = TextEditingController();
  final branchController = TextEditingController();
  final locationController = TextEditingController();

  List<StudentModel> studentList = [];

  //by using this function to insert student data in db

  void insertStudentData() async {
    Map<String, dynamic> map = {
      "Name": nameController.text.toString().trim(),
      "RegNo": regController.text.toString().trim(),
      "Branch": branchController.text.toString().trim(),
      "Location": locationController.text.toString().trim(),
    };
    var body = json.encode(map);
    var encoding = Encoding.getByName('utf-8');
    const header = {"Content-Type": "application/json"};
    await http.post(Uri.parse('https://node-first-project-gths.onrender.com/user/insertData'),
        headers: header, body: body, encoding: encoding);
    //.then((value) {
    print("Inserted..........");
    getAllStudentData();
    //});
  }

  void getAllStudentData() {
    http.get(Uri.parse('https://node-first-project-gths.onrender.com/user/getData')).then((value) {
      print("Hello.....");
      setState(() {
        List data = json.decode(value.body.toString());
        for (int i = 0; i < data.length; i++) {
          print("name=${data[i]}");
          studentList.add(
            StudentModel(
              data[i]['Name'].toString(),
              data[i]['RegNo'].toString(),
              data[i]['Branch'].toString(),
              data[i]['Location'].toString(),
              //data[i]['widgetId']
            ),
          );
        }
      });
    });
  }

  void deleteSingleStudentData(String id) async {
    await http
        .delete(Uri.parse('https://node-first-project-gths.onrender.com/user/deleteOneById/${id}'));
    //.then((value) {
    getAllStudentData();
    //});
  }

  void deleteAllStudentData() {
    http
        .delete(Uri.parse('https://node-first-project-gths.onrender.com/user/deleteAll'))
        .then((value) {
      print("value= ${value.body}");
      getAllStudentData();
    });
  }

  @override
  void initState() {
    super.initState();
    getAllStudentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Enter Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: TextFormField(
                    controller: regController,
                    decoration: InputDecoration(
                      hintText: "Enter Reg No.",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: TextFormField(
                    controller: branchController,
                    decoration: InputDecoration(
                      hintText: "Enter Branch",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: TextFormField(
                    controller: locationController,
                    decoration: InputDecoration(
                      hintText: "Enter Location",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            insertStudentData();
                          },
                          child: Text("Insert")),
                      OutlinedButton(
                          onPressed: () {
                            deleteAllStudentData();
                          },
                          child: Text("Delete")),
                    ],
                  ),
                ),
                ListView.builder(
                    itemCount: studentList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      studentList[index].Name,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(studentList[index].Branch),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      studentList[index].RegNo,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(studentList[index].Location),
                                  ),
                                ],
                              ),
                              // Expanded(child: InkWell(
                              //   onTap: () {
                              //     deleteSingleStudentData(
                              //         studentList[index].widgetId);
                              //   },
                              // ))
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
