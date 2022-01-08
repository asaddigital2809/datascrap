void getData()async{
  var response = await http.Client().get(Uri.parse('https://psopk.com/en/product-and-services/product-prices/pol/'));
  dom.Document document = parser.parse(response.body);
  var date = document.getElementsByClassName('eff-date')[0];
  dataController.setDate(date.text);

  for(int k=0; k<=1;k++) {
    var element = document.querySelectorAll('table>tbody')[k];
    var data = element.querySelectorAll('tr');
    for (int i = 0; i < data.length; i++) {
      print(data[i].children[0].text.toString().trim());
      dataController.addValue(data[i].children[1].text.toString().trim());
    }
  }
}