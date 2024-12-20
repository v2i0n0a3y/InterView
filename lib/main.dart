import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interview/bloc/interview_bloc.dart';
import 'package:interview/bloc/interview_state.dart';
import 'package:interview/provider/provider_home.dart';
import 'package:interview/provider/provider_model.dart';
import 'package:provider/provider.dart';
import 'API_pactice/Apipractice.dart';
import 'CRUD API/crud_api.dart';
import 'RESTful/complexJson.dart';
import 'RESTful/display.dart';
import 'RESTful/singleItem.dart';
import 'bloc/bloc_screen.dart';
import 'getx/gexhome.dart';
import 'getx/kandivali/kandivali.dart';
import 'laravel_api/larahome.dart';
import 'laravel_api/postmethod.dart';
import 'model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CrudDemo(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDoList> vinayList = [];


  Future<List<ToDoList>> getData() async {
    final response = await http.get(Uri.parse("https://mocki.io/v1/996532b2-5815-4c10-b3da-0bd42d81e7a0"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        vinayList.add(ToDoList.fromJson(index));
      }
    }
    return vinayList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031338),
      appBar: AppBar(
        title: Text('ToDo List',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF031338),
      ),
      body: FutureBuilder<List<ToDoList>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error Found'));
          }
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                return Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child: Icon(item.completed == true ? Icons.check : Icons.close, color:Colors.blue,),
                          ),
                          SizedBox(width: 18,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${item.title}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                              Row(
                                children: [
                                  Text("Completed - ${item.completed} :", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white)),
                                  SizedBox(width: 10,),
                                  Text("priority - ${item.priority}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white)),

                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}




















