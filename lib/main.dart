import 'package:flutter/material.dart';
import 'package:Tonnage/view/dashboard/index.dart';
import 'package:Tonnage/view/calendar/index.dart';
import 'package:Tonnage/view/settings/index.dart';
import 'dart:ui';
import 'dart:io';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/services.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: TonnageApp(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class TonnageApp extends StatefulWidget {
  TonnageApp({Key key}) : super(key: key);

  @override
  _TonnageAppState createState() => _TonnageAppState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TonnageAppState extends State<TonnageApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    CalendarPage(title: 'Table Calendar Demo'),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: _selectedIndex == 3 ? Color(0xffF5F6F8) : Colors.white ,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 22,
        // unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.indigo,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '主页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: '数据',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '日历',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '设置',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
