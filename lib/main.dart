import 'package:datascrap/controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataController dataController = Get.put(DataController());
  @override
  void initState() {
    getData();
    super.initState();
  }
  getData()async{
    DataController dataController = Get.put(DataController());
    var response = await http.Client().get(Uri.parse('https://en.wikipedia.org/wiki/List_of_universities_in_Pakistan'));
    dom.Document document = parser.parse(response.body);

    for(int k = 0; k<=3;k++) {
      var element = document.querySelectorAll('table>tbody')[k];
      var data = element.querySelectorAll('tr');
      for (int i = 1; i < data.length; i++) {
        dataController.addName(data[i].children[0].text.toString().trim());
        dataController.addLocation(data[i].children[1].text.toString().trim());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(builder: (_) => Scaffold(
      appBar: AppBar(
        title: Text('Data Scrap'),
      ),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
            itemCount: dataController.name.length,
            itemBuilder: (BuildContext context,int index)
          {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                 children: [
                   Expanded(child: Text(dataController.name[index].toString().trim(),style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
                   Text(dataController.location[index].toString().trim(),style: const TextStyle(fontSize: 15,color: Colors.blueGrey),),
                 ],
                ),
              ),
            );
          }
        ),
      ),
    ));
  }

}


