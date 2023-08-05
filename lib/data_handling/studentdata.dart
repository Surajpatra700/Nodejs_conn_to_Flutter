// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:node_js_integration_flutter/student_model.dart';

// class StudentData extends ChangeNotifier {
//   final httpclient = http.Client();
//   List<dynamic> studentData = [];

//   // Get Request
//   Future fetchData() async {
//     final Uri restApiUrl = Uri.parse("http://localhost:4500/user/getData");
//     http.Response response = await httpclient.get(restApiUrl);
//     final Map parsedData = await json.decode(response.body.toString());
//     for(int i = 0;i< parsedData.length; i++){
//       studentData.add(
//       StudentModel(
//         parsedData[i]['Name'],
//         parsedData[i]['RegNo'],
//         parsedData[i]['Branch'],
//         parsedData[i]['Location'],
//       ),
//     );
//     }
    
//   }
// }
