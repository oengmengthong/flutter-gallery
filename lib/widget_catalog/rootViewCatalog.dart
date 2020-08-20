import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallerywidget/models/dataBottomNavigationBarList.dart';
import 'package:gallerywidget/models/dataList.dart';
import 'package:gallerywidget/models/dataListCatalog.dart';

class BaseViewCatalog extends StatefulWidget {
  BaseViewCatalog({Key key, this.lists}) : super(key: key);
  Lists lists;
  @override
  _BaseViewCatalogState createState() => _BaseViewCatalogState();
}

class _BaseViewCatalogState extends State<BaseViewCatalog> {
  @override
  Widget build(BuildContext context) {
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
        children: [
          Expanded(
            child: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    children: dataCatalogs.map((item) {
                      return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => item.child)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      blurRadius: 8,
                                      offset: Offset(3, 3),
                                      color: Colors.blueAccent.withOpacity(0.1))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.3,
                                  width: double.infinity,
                                  child: Center(
                                    child: CachedNetworkImage(
                                      imageUrl: item.image,
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          FlutterLogo(size: 60),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    item.title,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.blueGrey),
                                  ),
                                )
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
