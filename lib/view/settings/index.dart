import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/scheduler.dart' show timeDilation;

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).padding.top - 8,
          MediaQuery.of(context).padding.top + 10,
          MediaQuery.of(context).padding.top - 8,
          0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: Colors.white),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 12, 0, 0),
                  alignment: Alignment.topLeft,
                  // decoration: BoxDecoration(
                  //   border: Border(
                  //     bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
                  //   ),
                  // ),
                  child: Text("数据相关",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600])),
                ),
                Container(
                  child: Column(
                    children: [
                      ListTile(
                          leading: const Icon(
                            Icons.data_usage,
                            color: Colors.blueAccent,
                          ),
                          title: const Text("身体数据设置"),
                          subtitle: Text("身高，体重是体脂率的计算数据"),
                          enabled: true,
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 220,
                                  margin: EdgeInsets.all(16),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                            child: Text(
                                          "身体数据",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[600]),
                                        )),
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 8, 0, 0),
                                          child: TextFormField(
                                            initialValue: "165",
                                            decoration: InputDecoration(
                                                labelText: '身高 / cm'),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 8, 0, 0),
                                          child: TextFormField(
                                            initialValue: "65",
                                            decoration: InputDecoration(
                                                labelText: '体重 / kg'),
                                          ),
                                        ),
                                        Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 8, 0, 0),
                                            child: FlatButton(
                                              color: Color(0xff1a73e8),
                                              onPressed: () {
                                                /*...*/
                                              },
                                              child: Text(
                                                "确认",
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                      ListTile(
                          leading: const Icon(
                            Icons.handyman,
                            color: Colors.deepOrange,
                          ),
                          title: const Text("单位设置"),
                          subtitle: Text("选择重量单位"),
                          enabled: true,
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              backgroundColor: Color(0xffF5F6F8),
                              builder: (BuildContext context) {
                                return  Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(12, 12, 0, 0),
                                        alignment: Alignment.topLeft,
                                        // decoration: BoxDecoration(
                                        //   border: Border(
                                        //     bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
                                        //   ),
                                        // ),
                                        child: Text("重量单位",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[600])),
                                      ),
                                      CheckboxListTile(
                                        title: const Text('Kg'),
                                        value: timeDilation != 1.0,
                                        onChanged: (bool value) {

                                        },

                                      ),
                                      CheckboxListTile(
                                        title: const Text('pound'),
                                        value: timeDilation != 1.0,
                                        onChanged: (bool value) {

                                        },

                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                        alignment: Alignment.topLeft,
                                        // decoration: BoxDecoration(
                                        //   border: Border(
                                        //     bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
                                        //   ),
                                        // ),
                                        child: Text("时间显示方式",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[600])),
                                      ),
                                      CheckboxListTile(
                                        title: const Text('分钟'),
                                        value: timeDilation != 1.0,
                                        onChanged: (bool value) {

                                        },

                                      ),
                                      CheckboxListTile(
                                        title: const Text('小时'),
                                        value: timeDilation != 1.0,
                                        onChanged: (bool value) {

                                        },

                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                      ListTile(
                          leading: const Icon(
                            Icons.import_export,
                            color: Colors.green,
                          ),
                          title: const Text("数据导出"),
                          subtitle: Text("导出Excel"),
                          enabled: true,
                          onTap: () {
                            showDialog(
                                context: context,
                                child: new SimpleDialog(
                                  title: new Text('正在导出'),
                                  children: <Widget>[
                                    Center(
                                      child: Column(children: [
                                        CircularProgressIndicator(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "正在导出",
                                          style: TextStyle(
                                              color: Colors.blueAccent),
                                        )
                                      ]),
                                    )
                                  ],
                                ));
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: Colors.white),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 12, 0, 0),
                  alignment: Alignment.topLeft,
                  // decoration: BoxDecoration(
                  //   border: Border(
                  //     bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
                  //   ),
                  // ),
                  child: Text("关于App",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600])),
                ),
                ListTile(
                    leading: const Icon(
                      Icons.help_center,
                      color: Colors.teal,
                    ),
                    title: const Text("如何使用"),
                    enabled: true,
                    onTap: () {
                      /* react to the tile being tapped */
                    }),
                ListTile(
                    leading: const Icon(
                      Icons.people,
                      color: Colors.indigoAccent,
                    ),
                    title: const Text("关于作者"),
                    subtitle: Text("请关注微博@带带大师兄"),
                    enabled: true,
                    onTap: () {
                      /* react to the tile being tapped */
                    }),
                ListTile(
                    leading: const Icon(
                      Icons.bug_report,
                      color: Colors.black38,
                    ),
                    title: const Text("报告App Bug"),
                    enabled: true,
                    onTap: () {
                      /* react to the tile being tapped */
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
