import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yottasens/screens/drawer.dart';
import 'package:yottasens/utils/global_translations.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) => new AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)),
        title: new Text(allTranslations.text("dialog.title")),
        content: new Text(allTranslations.text("dialog.content")),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              allTranslations.text("dialog.no"),
              style: TextStyle(fontSize: 16.0, color: Colors.red),
            ),
          ),
          FlatButton(
            onPressed: () => SystemChannels.platform
                .invokeMethod<void>('SystemNavigator.pop'),
            child: Text(
              allTranslations.text("dialog.yes"),
              style: TextStyle(fontSize: 16.0, color: Colors.blue),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  //BuildContext _scaffoldContext;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget dashboard = new StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Experience the",
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 16.0)),
                      Text("True Audio",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 34.0))
                    ],
                  ),
                  Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(FontAwesomeIcons.music,
                                color: Colors.white, size: 30.0),
                          )))
                ]),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      color: Colors.teal,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FaIcon(FontAwesomeIcons.store,
                            color: Colors.white, size: 30.0),
                      )),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text("Shop",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                  Text("YottaMusic Products",
                      style: TextStyle(color: Colors.black45, fontSize: 16.0)),
                ]),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      color: Colors.amber,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: FaIcon(FontAwesomeIcons.globe,
                            color: Colors.white, size: 30.0),
                      )),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text("Worldwide",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                  Text("Global Support",
                      style: TextStyle(color: Colors.black45, fontSize: 16.0)),
                ]),
          ),
        ),
        _buildTile(
          Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Statistics",
                              style: TextStyle(
                                  color: Colors.green, fontSize: 16.0)),
                          Text("Play Songs",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34.0)),
                          Text("Device Detected",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34.0)),
                        ],
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4.0)),
                ],
              )),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Learn More",
                          style: TextStyle(color: Colors.redAccent)),
                      Text("Watch Videos",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 34.0))
                    ],
                  ),
                  Material(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(FontAwesomeIcons.youtube,
                                color: Colors.white, size: 30.0),
                          )))
                ]),
          ),
          onTap: () => debugPrint("I'm Clicked"),
        )
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, 110.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(2, 220.0),
        StaggeredTile.extent(2, 110.0),
      ],
    );
    return new WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
          //backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          appBar: AppBar(
            elevation: 0.1,
            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
            title: Text(allTranslations.text("dashboard.title")),
          ),
          drawer: Drawer(child: yottaSensDrawer(context)),
          body: new Builder(builder: (BuildContext context) {
            //_scaffoldContext = context;
            return dashboard;
          }),
        ));
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
              debugPrint('Not set yet');
            },
            child: child));
  }
}
