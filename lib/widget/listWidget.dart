import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallerywidget/components/searchWidget.dart';
import 'package:gallerywidget/models/dataWidgets.dart';
import 'package:gallerywidget/providers/searchWidgets.dart';
import 'package:gallerywidget/widget/viewDetail.dart';
import 'package:provider/provider.dart';

class ListWidgetsScreen extends StatefulWidget {
  @override
  _ListWidgetsScreenState createState() => _ListWidgetsScreenState();
}

class _ListWidgetsScreenState extends State<ListWidgetsScreen> {
  List<DataWidget> dataWidget = dataWidgets;
  TextEditingController textController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchWidgetsProvider>(context, listen: false).reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    SearchWidgetsProvider searchWidgetsProvider = Provider.of<SearchWidgetsProvider>(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              child: SearchField(
                  textController: textController,
                  placeHolder: "Search Name Widget",
                  onChanged: (value) => searchWidgetsProvider.search(textController.text))),
          Expanded(
//            child: BoxGridWidget(searchWidgetsProvider: searchWidgetsProvider),
            child: ListView.builder(
                itemCount: searchWidgetsProvider.dataWidget.length,
                itemBuilder: (context, index) {
                  return _boxRowWidget(searchWidgetsProvider.dataWidget[index]);
                }),
          ),
        ],
      ),
    );
  }

  Widget _boxRowWidget(DataWidget dataWidget) {
    return InkWell(
        onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => DetailWidgetScreen(
                      dataWidget: dataWidget,
                    ))),
        child: Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 8),
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 8, offset: Offset(3, 3), color: Colors.blueAccent.withOpacity(0.1))
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                    child: dataWidget.image.length == 0
                        ? FlutterLogo(size: 60)
                        : CachedNetworkImage(
                            imageUrl: dataWidget.image,
                            fit: BoxFit.cover,
                            height: double.infinity,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => FlutterLogo(size: 60),
                          )),
              ),
              SizedBox(width: 16),
              Expanded(flex: 3, child: Text(dataWidget.title, style: TextStyle(fontSize: 18))),
              Icon(Icons.arrow_forward_ios, color: Colors.grey)
            ],
          ),
        ));
  }

  Widget _boxWidget(DataWidget dataWidget) {
    return InkWell(
        onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => DetailWidgetScreen(
                      dataWidget: dataWidget,
                    ))),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 8, offset: Offset(3, 3), color: Colors.blueAccent.withOpacity(0.1))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width * 0.3,
                child: Center(
                    child: dataWidget.image.length == 0
                        ? FlutterLogo(size: 60)
                        : CachedNetworkImage(
                            imageUrl: dataWidget.image,
                            height: MediaQuery.of(context).size.width * 0.3,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => FlutterLogo(size: 60),
                          )),
              ),
              Divider(),
              Expanded(
                  child: Text(
                dataWidget.title,
                style: TextStyle(fontSize: 15),
              ))
            ],
          ),
        ));
  }
}

class BoxGridWidget extends StatelessWidget {
  const BoxGridWidget({
    Key key,
    @required this.searchWidgetsProvider,
  }) : super(key: key);

  final SearchWidgetsProvider searchWidgetsProvider;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: searchWidgetsProvider.dataWidget.map((data) {
                return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => DetailWidgetScreen(
                                  dataWidget: data,
                                ))),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                blurRadius: 8,
                                offset: Offset(3, 3),
                                color: Colors.blueAccent.withOpacity(0.1))
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width * 0.3,
                            child: Center(
                                child: data.image.length == 0
                                    ? FlutterLogo(size: 60)
                                    : CachedNetworkImage(
                                        imageUrl: data.image,
                                        height: MediaQuery.of(context).size.width * 0.3,
                                        placeholder: (context, url) => CircularProgressIndicator(),
                                        errorWidget: (context, url, error) => FlutterLogo(size: 60),
                                      )),
                          ),
                          Divider(),
                          Expanded(
                              child: Text(
                            data.title,
                            style: TextStyle(fontSize: 15),
                          ))
                        ],
                      ),
                    ));
              }).toList()),
        ),
      ],
    );
  }
}
