import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/scheduler.dart' show timeDilation;

Map TimedataMap = {"总训练时长": "100 h", "平均训练时间": "1h20m", "最常训练时间点": "4.pm"};

Map TrainDataMap = {"总训练量": "100 kg", "平均训练量": "20kg", "最常训练部位": "胸部"};

Map TrinityData = {
  "卧推": "100 kg",
  "深蹲": "200 kg",
  "硬拉": "180 kg",
};

class DataDisplay extends StatelessWidget {
  final Map dataMap;

  DataDisplay(this.dataMap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: Table(children: [
          TableRow(children: getContent()),
        ]));
  }

  List<Widget> getContent() {
    return dataMap.entries
        .map((e) => Container(
            height: 60,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                e.value,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                e.key,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500]),
              )
            ])))
        .toList();
  }
}

var colorList = [
  '#73DDFF',
  '#73ACFF',
  '#FDD56A',
  '#FDB36A',
  '#FD866A',
  '#9E87FF',
  '#58D5FF'
];

class Statistic extends StatefulWidget {
  // This class is the configuration for the state.
  // It holds the values (in this case nothing) provided
  // by the parent and used by the build  method of the
  // State. Fields in a Widget subclass are always marked
  // "final".

  @override
  _StatisticState createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Echarts(
      option: '''
   {
     xAxis: [{
        type: 'category',
        data: ['04-12', '04-13', '04-14', '04-16', '04-17', '04-18', '04-19'],
        axisLine: {
        show: false,
            lineStyle: {
                color: '#DCE2E8'
            }
        },
        axisTick: {
            show: false
        },
        axisLabel: {
            interval: 0,
           
                 textStyle: {
                color: '#999' //坐标轴字颜色
            },
            
            // 默认x轴字体大小
            fontSize: 12,
            // margin:文字到x轴的距离
            margin: 15
        },
        axisPointer: {
            label: {
                // padding: [11, 5, 7],
                padding: [0, 0, 10, 0],
                /*
    除了padding[0]建议必须是0之外，其他三项可随意设置
    
    和CSSpadding相同，[上，右，下，左]
    
    如果需要下边线超出文字，设左右padding即可，注：左右padding最好相同
    
    padding[2]的10:
    
    10 = 文字距下边线的距离 + 下边线的宽度
                
    如：UI图中文字距下边线距离为7 下边线宽度为2
    
    则padding: [0, 0, 9, 0]
                
                */
                // 这里的margin和axisLabel的margin要一致!
                margin: 15,
                // 移入时的字体大小
                fontSize: 12,
                backgroundColor: {
                    type: 'linear',
                    x: 0,
                    y: 0,
                    x2: 0,
                    y2: 1,
                    colorStops: [{
                        offset: 0,
                        color: '#fff' // 0% 处的颜色
                    }, {
                        // offset: 0.9,
                        offset: 0.86,
                        /*
0.86 = （文字 + 文字距下边线的距离）/（文字 + 文字距下边线的距离 + 下边线的宽度）
                        
                        */
                        color: '#fff' // 0% 处的颜色
                    }, {
                        offset: 0.86,
                        color: '#33c0cd' // 0% 处的颜色
                    }, {
                        offset: 1,
                        color: '#33c0cd' // 100% 处的颜色
                    }],
                    global: false // 缺省为 false
                }
            }
        },
        boundaryGap: false
    }],
     yAxis: [{
        type: 'value',
        axisTick: {
            show: false
        },
        axisLine: {
            show: false,
            lineStyle: {
                color: 'rgba(107,107,107,0.37)', //y轴颜色
            }
        },
        axisLabel: {
            textStyle: {
                color: '#999'
            }
        },
        splitLine: {
            show: false
        }
    }],
    grid: {
        top: '15%',
        bottom:'15%',
        right:'5%'
    },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
            label: {
                show: true,
                backgroundColor: '#fff',
                color: '#556677',
                borderColor: 'rgba(0,0,0,0)',
                shadowColor: 'rgba(0,0,0,0)',
                shadowOffsetY: 0
            },
            lineStyle: {
                width: 0
            }
        },
        backgroundColor: '#fff',
        textStyle: {
            color: '#5c6c7c'
        },
        padding: [10, 10],
        extraCssText: 'box-shadow: 1px 0 2px 0 rgba(163,163,163,0.5)'
    },
     
      series: [{
        name: '深蹲',
        type: 'line',
        data: [10, 10, 30, 12, 15, 3, 40],
        symbolSize: 1,
        symbol: 'circle',
        smooth: true,
        yAxisIndex: 0,
        showSymbol: false,
        lineStyle: {
            width: 5,
            color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                    offset: 0,
                    color: '#9effff'
                },
                {
                    offset: 1,
                    color: '#9E87FF'
                }
            ]),
            shadowColor: 'rgba(158,135,255, 0.3)',
            shadowBlur: 10,
            shadowOffsetY: 20
        },
        itemStyle: {
            normal: {
                color: '#9E87FF',
                borderColor: '#9E87FF'
            }
        }
    }]
    }
                    ''',
    ),
    Echarts(
      option: '''
   {
     xAxis: [{
        type: 'category',
        data: ['04-12', '04-13', '04-14', '04-16', '04-17', '04-18', '04-19'],
        axisLine: {
        show: false,
            lineStyle: {
                color: '#DCE2E8'
            }
        },
        axisTick: {
            show: false
        },
        axisLabel: {
            interval: 0,
           
                 textStyle: {
                color: '#999' //坐标轴字颜色
            },
            
            // 默认x轴字体大小
            fontSize: 12,
            // margin:文字到x轴的距离
            margin: 15
        },
        axisPointer: {
            label: {
                // padding: [11, 5, 7],
                padding: [0, 0, 10, 0],
                /*
    除了padding[0]建议必须是0之外，其他三项可随意设置
    
    和CSSpadding相同，[上，右，下，左]
    
    如果需要下边线超出文字，设左右padding即可，注：左右padding最好相同
    
    padding[2]的10:
    
    10 = 文字距下边线的距离 + 下边线的宽度
                
    如：UI图中文字距下边线距离为7 下边线宽度为2
    
    则padding: [0, 0, 9, 0]
                
                */
                // 这里的margin和axisLabel的margin要一致!
                margin: 15,
                // 移入时的字体大小
                fontSize: 12,
                backgroundColor: {
                    type: 'linear',
                    x: 0,
                    y: 0,
                    x2: 0,
                    y2: 1,
                    colorStops: [{
                        offset: 0,
                        color: '#fff' // 0% 处的颜色
                    }, {
                        // offset: 0.9,
                        offset: 0.86,
                        /*
0.86 = （文字 + 文字距下边线的距离）/（文字 + 文字距下边线的距离 + 下边线的宽度）
                        
                        */
                        color: '#fff' // 0% 处的颜色
                    }, {
                        offset: 0.86,
                        color: '#33c0cd' // 0% 处的颜色
                    }, {
                        offset: 1,
                        color: '#33c0cd' // 100% 处的颜色
                    }],
                    global: false // 缺省为 false
                }
            }
        },
        boundaryGap: false
    }],
     yAxis: [{
        type: 'value',
        axisTick: {
            show: false
        },
        axisLine: {
            show: false,
            lineStyle: {
                color: 'rgba(107,107,107,0.37)', //y轴颜色
            }
        },
        axisLabel: {
            textStyle: {
                color: '#999'
            }
        },
        splitLine: {
            show: false
        }
    }],
    grid: {
        top: '15%',
        bottom:'15%',
        right:'5%'
    },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
            label: {
                show: true,
                backgroundColor: '#fff',
                color: '#556677',
                borderColor: 'rgba(0,0,0,0)',
                shadowColor: 'rgba(0,0,0,0)',
                shadowOffsetY: 0
            },
            lineStyle: {
                width: 0
            }
        },
        backgroundColor: '#fff',
        textStyle: {
            color: '#5c6c7c'
        },
        padding: [10, 10],
        extraCssText: 'box-shadow: 1px 0 2px 0 rgba(163,163,163,0.5)'
    },
     
      series: [{
        name: '硬拉',
        type: 'line',
        data: [10, 10, 30, 12, 15, 3, 7],
        symbolSize: 1,
        symbol: 'circle',
        smooth: true,
        yAxisIndex: 0,
        showSymbol: false,
        lineStyle: {
            width: 5,
            color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                    offset: 0,
                    color: '#73DD39'
                },
                {
                    offset: 1,
                    color: '#73DDFF'
                }
            ]),
            shadowColor: 'rgba(115,221,255, 0.3)',
            shadowBlur: 10,
            shadowOffsetY: 20
        },
        itemStyle: {
            normal: {
                color: '#9E87FF',
                borderColor: '#9E87FF'
            }
        }
    }]
    }
                    ''',
    ),
    Echarts(
      option: '''
   {
     xAxis: [{
        type: 'category',
        data: ['04-12', '04-13', '04-14', '04-16', '04-17', '04-18', '04-19'],
        axisLine: {
        show: false,
            lineStyle: {
                color: '#DCE2E8'
            }
        },
        axisTick: {
            show: false
        },
        axisLabel: {
            interval: 0,
           
                 textStyle: {
                color: '#999' //坐标轴字颜色
            },
            
            // 默认x轴字体大小
            fontSize: 12,
            // margin:文字到x轴的距离
            margin: 15
        },
        axisPointer: {
            label: {
                // padding: [11, 5, 7],
                padding: [0, 0, 10, 0],
                /*
    除了padding[0]建议必须是0之外，其他三项可随意设置
    
    和CSSpadding相同，[上，右，下，左]
    
    如果需要下边线超出文字，设左右padding即可，注：左右padding最好相同
    
    padding[2]的10:
    
    10 = 文字距下边线的距离 + 下边线的宽度
                
    如：UI图中文字距下边线距离为7 下边线宽度为2
    
    则padding: [0, 0, 9, 0]
                
                */
                // 这里的margin和axisLabel的margin要一致!
                margin: 15,
                // 移入时的字体大小
                fontSize: 12,
                backgroundColor: {
                    type: 'linear',
                    x: 0,
                    y: 0,
                    x2: 0,
                    y2: 1,
                    colorStops: [{
                        offset: 0,
                        color: '#fff' // 0% 处的颜色
                    }, {
                        // offset: 0.9,
                        offset: 0.86,
                        /*
0.86 = （文字 + 文字距下边线的距离）/（文字 + 文字距下边线的距离 + 下边线的宽度）
                        
                        */
                        color: '#fff' // 0% 处的颜色
                    }, {
                        offset: 0.86,
                        color: '#33c0cd' // 0% 处的颜色
                    }, {
                        offset: 1,
                        color: '#33c0cd' // 100% 处的颜色
                    }],
                    global: false // 缺省为 false
                }
            }
        },
        boundaryGap: false
    }],
     yAxis: [{
        type: 'value',
        axisTick: {
            show: false
        },
        axisLine: {
            show: false,
            lineStyle: {
                color: 'rgba(107,107,107,0.37)', //y轴颜色
            }
        },
        axisLabel: {
            textStyle: {
                color: '#999'
            }
        },
        splitLine: {
            show: false
        }
    }],
    grid: {
        top: '15%',
        bottom:'15%',
        right:'5%'
    },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
            label: {
                show: true,
                backgroundColor: '#fff',
                color: '#556677',
                borderColor: 'rgba(0,0,0,0)',
                shadowColor: 'rgba(0,0,0,0)',
                shadowOffsetY: 0
            },
            lineStyle: {
                width: 0
            }
        },
        backgroundColor: '#fff',
        textStyle: {
            color: '#5c6c7c'
        },
        padding: [10, 10],
        extraCssText: 'box-shadow: 1px 0 2px 0 rgba(163,163,163,0.5)'
    },
     
      series: [{
        name: '臥推',
        type: 'line',
        data: [10, 10, 30, 12, 15, 3, 20],
        symbolSize: 1,
        symbol: 'circle',
        smooth: true,
        yAxisIndex: 0,
        showSymbol: false,
        lineStyle: {
            width: 5,
            color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                    offset: 0,
                    color: '#73DD39'
                },
                {
                    offset: 1,
                    color: '#73DDFF'
                }
            ]),
            shadowColor: 'rgba(115,221,255, 0.3)',
            shadowBlur: 10,
            shadowOffsetY: 20
        },
        itemStyle: {
            normal: {
                color: '#fe9a8b',
                borderColor: '#fe9a8b'
            }
        }
    }]
    }
                    ''',
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).padding.top - 8,
          MediaQuery.of(context).padding.top + 10,
          MediaQuery.of(context).padding.top - 8,
          MediaQuery.of(context).padding.top - 8),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 12, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text("时间数据",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600])),
                ),
                Container(
                  child: DataDisplay(TimedataMap),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 12, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text("平均训练时间走势",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600])),
                ),
                Container(
                  child: Echarts(
                    option: '''
   {
     xAxis: [{
        type: 'category',
        data: ['02-13', '02-14', '02-15', '02-16', '02-17', '02-18', '02-19'],
        axisLine: {
            show:false,
            lineStyle: {
                color: 'rgba(107,107,107,0.37)', //x轴颜色
            }
        },
        axisTick: {
            show: false
        },
        axisLabel: {
            interval: 0,
            textStyle: {
                color: '#999' //坐标轴字颜色
            },
            margin: 15
        },
        axisPointer: {
            label: {
                padding: [11, 5, 7],
                backgroundColor: {
                    type: 'linear',
                    x: 0,
                    y: 0,
                    x2: 0,
                    y2: 1,
                    colorStops: [{
                        offset: 0,
                        color: '#fff' // 0% 处的颜色
                    }, {
                        offset: 0.9,
                        color: '#fff' // 0% 处的颜色
                    }, {
                        offset: 0.9,
                        color: '#33c0cd' // 0% 处的颜色
                    }, {
                        offset: 1,
                        color: '#33c0cd' // 100% 处的颜色
                    }],
                    global: false // 缺省为 false
                }
            }
        },
        boundaryGap: false
    }],
     yAxis: [{
        type: 'value',
        axisTick: {
            show: false
        },
        axisLine: {
            show: false,
            lineStyle: {
                color: 'rgba(107,107,107,0.37)', //y轴颜色
            }
        },
        axisLabel: {
            textStyle: {
                color: '#999'
            }
        },
        splitLine: {
            show: false
        }
    }],
      grid: {
        top: '15%'
       
    },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
            label: {
                show: true,
                backgroundColor: '#fff',
                color: '#556677',
                borderColor: 'rgba(0,0,0,0)',
                shadowColor: 'rgba(0,0,0,0)',
                shadowOffsetY: 0
            },
            lineStyle: {
                width: 0
            }
        },
        backgroundColor: '#fff',
        textStyle: {
            color: '#5c6c7c'
        },
        padding: [10, 10],
        extraCssText: 'box-shadow: 1px 0 2px 0 rgba(163,163,163,0.5)'
    },
      series: [{
        name: '时间',
        type: 'line',
        data: [10, 10, 30, 12, 15, 3, 7],
        symbolSize: 1,
        symbol: 'circle',
        smooth: true,
        yAxisIndex: 0,
        showSymbol: false,
        lineStyle: {
            width: 5,
            color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                    offset: 0,
                    color: '#9effff'
                },
                {
                    offset: 1,
                    color: '#9E87FF'
                }
            ]),
            shadowColor: 'rgba(158,135,255, 0.3)',
            shadowBlur: 10,
            shadowOffsetY: 20
        },
        itemStyle: {
            normal: {
                color: '#9E87FF',
                borderColor: '#9E87FF'
            }
        }
    }, ]
    }
                    ''',
                  ),
                  width: 300,
                  height: 250,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 12, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text("训练数据",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600])),
                ),
                Container(
                  child: DataDisplay(TrainDataMap),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                  child: Text("训练部位分布",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600])),
                ),
                Container(
                  child: Echarts(
                    option: '''
     {
      
    tooltip: {
        trigger: 'item'
    },
    series: [
        {
        type: 'pie',
        center: ['50%', '50%'],
        radius: ['40%', '70%'],
        clockwise: true,
        avoidLabelOverlap: true,
        hoverOffset: 15,
          itemStyle: {
            normal: {
                color: function(params) {
                    var colorList = ['#73DDFF', '#73ACFF', '#FDD56A', '#FDB36A', '#FD866A', '#9E87FF', '#58D5FF']
                    return colorList[params.dataIndex]
                }
            }
        },
        data: [{
            'name': '胸部',
            'value': 1.45
        }, {
            'name': '肩',
            'value': 2.93
        }, {
            'name': '臀腿',
            'value': 3.15
        }, {
            'name': '背',
            'value': 4.78
        }, {
            'name': '手',
            'value': 5.93
        }
        ],
    }]
    }
  ''',
                  ),
                  width: 300,
                  height: 250,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 12, 0, 0),
                      alignment: Alignment.topRight,
                      child: Text("训练数据",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600])),
                    ),
                  ],
                ),
                Container(
                  child: DataDisplay(TrinityData),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 12, 20, 0),
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text("三大项数据",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600])),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () => _onItemTapped(0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(0),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(0),
                                    ),
                                    color: _selectedIndex == 0 ? Colors.blueAccent : Colors.blueGrey,
                                  ),
                                  width: 38,
                                  height: 18,
                                  child: Text("深蹲",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )),
                            GestureDetector(
                                onTap: () => _onItemTapped(1),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _selectedIndex == 1 ? Colors.blueAccent : Colors.blueGrey,
                                  ),
                                  width: 36,
                                  height: 18,
                                  child: Text("硬拉",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )),
                            GestureDetector(
                                onTap: () => _onItemTapped(2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(8),
                                    ),
                                    color: _selectedIndex == 2 ? Colors.blueAccent : Colors.blueGrey,
                                  ),
                                  width: 38,
                                  height: 18,
                                  child: Text("卧推",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: _widgetOptions[_selectedIndex],
                  width: 300,
                  height: 250,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
