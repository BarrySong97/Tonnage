import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:Tonnage/component/dashboardchart/chartcard.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Greeting(),
            Mention(),
            Title('训练总览'),
            TotalData(),
            ExerciseTitle(),
            ChartCardBox()
          ],
        ));
  }
}

class Greeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'BarrySong4Real，下午好',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Mention extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
        child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Color(0xffF3F3F3),
            ),
            child: Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 50,
                      margin: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        color: Color(0xff1a73e8),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '2',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              '4月',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ]),
                    ),
                    Container(
                        margin: EdgeInsetsDirectional.fromSTEB(8, 2, 0, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '上一次训练',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffB2B2B2)),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 6, 0, 10),
                                  child: Text(
                                    '背 & 二头',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Text(
                                '6 个动作 | 训练量 1000kg | 训练时间 1:20',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ]))
                  ],
                ))));
  }
}

class Title extends StatelessWidget {
  String title;

  Title(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600]),
        ));
  }
}

class ExerciseTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
        child: Row(children: [
          Text(
            '当前训练计划',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600]),
          ),
          Spacer(flex: 1),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
            child: const Text('查看全部'),
          )
        ]));
  }
}

class TotalData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey[300]),
            bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
          ),
        ),
        child: Table(children: [
          TableRow(children: [
            Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1.0, color: Colors.grey[300]),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1000 kg',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '总训练量',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500]),
                      )
                    ])),
            Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1.0, color: Colors.grey[300]),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '01:10',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '平均训练时间',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500]),
                      )
                    ])),
            Container(
                height: 80,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '13.2 %',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '目前体脂',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500]),
                      )
                    ]))
          ]),
        ]));
  }
}

class ChartCardBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: 325,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: Colors.indigo,
      ),
      child: Column(children: [
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Text(
              "背 & 二头",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )),
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsetsDirectional.fromSTEB(2, 6, 0, 0),
            child: Text(
              "上次训练：2020-1-08",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            )),
        Container(
            alignment: Alignment.topLeft,
            height: 180,
            child: Echarts(
              option: '''
     {
     tooltip: {},
     backgroundColor:'#3F51B5',
      grid: {
        top:30,
        left:30,
        bottom:10,
        right:10
    },
    xAxis: [{
        type: 'category',
        axisTick:{
            show:false
        },
        axisLine:{
            show:false
        },
        axisLabel:{
            color:'#4D4D4D',
            fontSize:14,
            margin:21,
            fontWeight:'bold'
        },
        data: [],
       
    }],
    yAxis: [{
        
        nameTextStyle:{
            color:'#fff',
            fontSize:12,
            padding:[0, 0, 0, -5]
        },
        	
        max: function(value) {
            if(value.max<5){
                return 5
            }else{
                return value.max
            }
        },
        type: 'value',
        axisLine:{
            show:false
        },
        axisLabel:{
            color:'#fff',
            fontSize:12,
            margin:5
        },
        splitLine:{
            show:false
        },
        axisTick:{
            show:false
        }
    }],
    series: [
        {
            name: '猕猴桃',
            type: 'bar',
            label:{
                show:false,
                position:'top',
                fontSize:12,
                color:'#3DC3F0',
                fontWeight:'bold'
            },
            barMaxWidth:60,
            itemStyle:{
                color: '#04befe'
            },
            data: [14, 20, 18, 9]
        }, 
        
    ]
}
                    ''',
            )),
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: Table(children: [
              TableRow(children: [
                Container(
                    margin: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 6),
                          child: Text(
                            '7',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          '训练动作',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      child: const Text('        开始        ',
                          style: TextStyle(fontSize: 20)),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff1a73e8),
                            Colors.indigo,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    ),
                  ),
                ),
              ])
            ])),
      ]),
    );
  }
}
