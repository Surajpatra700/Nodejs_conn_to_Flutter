// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:node_js_integration_flutter/data_handling/studentdata.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   final data = StudentData();

//   @override
//   void initState() {
//     super.initState();
//     data.fetchData();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Student List"),
//         centerTitle: true,
//       ),
//       body: FutureBuilder(
//           future: data.fetchData(),
//           builder: (context, AsyncSnapshot snapshot) {
//             return ListView.builder(
//                 itemCount: data.studentData.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Center(
//                       child: Column(
//                         children: [
//                           Text(data.studentData[index]['Name']),
//                           Text(data.studentData[index]['RegNo']),
//                           Text(data.studentData[index]['Branch']),
//                           Text(data.studentData[index]['Location']),
//                         ],
//                       ),
//                     ),
//                   );
//                 });
//           }),
//     );
//   }
// }
