import 'package:flutter/cupertino.dart';
import 'package:gallerywidget/models/dataTemplates.dart';

class SearchTemplatesProvider with ChangeNotifier{

  List<Template> _listTemplate = templateItem;

  List<Template> get listTemplate => _listTemplate;

  void search(String data){
    print(data);
    _listTemplate = templateItem.where((element) {
      return element.name.toLowerCase().contains(data.toLowerCase());
    }).toList();
    notifyListeners();
  }

  void reset(){
    _listTemplate = templateItem;
    notifyListeners();
  }

}