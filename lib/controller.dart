class DataController extends GetxController{
  List<String> name = [];
  List<String> value = [];
  String? date ;
  double height=Get.height;
  double width=Get.width;
  bool isDataLoading = true;
  @override
  void onInit(){
    if (width> 600) {
      height = width;
    } else if (height< 600) {
      height = 650;
      width = 370;
    }
  }
  void addName(String text){
    name.add(text);
    update();
  }
  void addValue(String text){
    value.add(text);
    update();
  }
  void setDate(String text){
    date = text;
  }
}