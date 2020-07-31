import 'package:flutter/cupertino.dart';
import 'package:gallerywidget/models/dataWidgets.dart';

class SearchWidgetsProvider with ChangeNotifier {
  List<DataWidget> _dataWidgets = dataWidgets;
  
  List<DataWidget> get dataWidget => _dataWidgets;
  
  void search(String data){
    print(data);
    _dataWidgets = dataWidgets.where((element) {
      return element.title.toLowerCase().contains(data.toLowerCase());
    }).toList();
    notifyListeners();
  }

  void reset(){
    _dataWidgets = dataWidgets;
    notifyListeners();
  }
}