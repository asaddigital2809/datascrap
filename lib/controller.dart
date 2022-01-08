import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DataController extends GetxController{
  List<String> name = [];
  List<String> location = [];


  void addName(String text){
    name.add(text);
    update();
  }
  void addLocation(String text){
    location.add(text);
    update();
  }
}