import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallerywidget/components/searchWidget.dart';
import 'package:gallerywidget/models/dataList.dart';
import 'package:gallerywidget/providers/searchTemplates.dart';
import 'package:provider/provider.dart';

class BaseViewTemplateScreen extends StatefulWidget {
  BaseViewTemplateScreen({Key key, this.lists}) : super(key: key);
  Lists lists;
  @override
  _BaseViewTemplateScreenState createState() => _BaseViewTemplateScreenState();
}

class _BaseViewTemplateScreenState extends State<BaseViewTemplateScreen> {
  TextEditingController textController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchTemplatesProvider>(context, listen: false).reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    SearchTemplatesProvider searchTemplatesProvider = Provider.of<SearchTemplatesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lists.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Image.asset(
              "assets/images/" + widget.lists.image + ".png",
              width: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              child: SearchField(
                  textController: textController,
                  placeHolder: "Search Name Widget",
                  onChanged: (value) => searchTemplatesProvider.search(textController.text))),
          Expanded(
            child: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: searchTemplatesProvider.listTemplate.map((item) {
                      return InkWell(
                          onTap: item.child == null ? null : () => Navigator.push(
                              context, CupertinoPageRoute(builder: (context) => item.child)),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
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
                                  width: double.infinity,
                                  child: Center(
                                      child: CachedNetworkImage(
                                    imageUrl: item.imageUrl,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.width * 0.3,
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => FlutterLogo(size: 60),
                                  )),
                                ),
                                Divider(),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item.name,
                                    style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                                  ),
                                ))
                              ],
                            ),
                          ));
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

