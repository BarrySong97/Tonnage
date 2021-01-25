import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:Tonnage/model/exercise.dart';

final List<Exercise> exercises = [
  Exercise(4, 90, 5, "半程硬拉"),
  Exercise(5, 60, 4, "高位下拉"),
  Exercise(3, 45, 10, "高位下拉"),
  Exercise(12, 70, 4, "绳索划船"),
  Exercise(10, 40, 4, "面拉"),
  Exercise(4, 20, 8, "杠铃二头弯举"),
  Exercise(4, 7.5, 6, "哑铃二头弯举"),
];
final List<Plan> plans = [
  Plan("背 & 二头", DateTime.parse("2020-01-12 12:30"),
      DateTime.parse("2020-01-12 14:30"), exercises),
];

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 1)): plans,
      _selectedDay.subtract(Duration(days: 2)): plans,
      _selectedDay.subtract(Duration(days: 3)): plans,
      _selectedDay.subtract(Duration(days: 5)): plans,
      _selectedDay.subtract(Duration(days: 0)): plans,
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildTableCalendar(),
          Container(
              margin: EdgeInsetsDirectional.fromSTEB(26, 0, 0, 0),
              child: Text(
                "13日 训练记录",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              )),
          Container(
            height: 300,
            padding: EdgeInsets.all(16),
            margin: EdgeInsetsDirectional.fromSTEB(26, 10, 26, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff1a73e8),
                    Colors.indigo,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                )
            ),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                    margin: EdgeInsetsDirectional.fromSTEB(10, 0, 0,6),

                    child: Text(
                      "训练时间段：13:30 ~ 14:30",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  width: 275,
                  alignment: Alignment.topLeft,

                  child: Table(
                    columnWidths: {},
                    textDirection: TextDirection.ltr,
                    children: [

                      TableRow(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              "名称",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                            child: Text(
                              "重量",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Text(
                              "组数",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Text(
                              "次数",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            alignment: Alignment.center,
                          )
                        ],
                      ),
                      TableRow(

                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              "半程硬拉",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                            child: Text(
                              "10",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Text(
                              "12",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.center,
                          )
                        ],
                      ),
                      TableRow(

                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              "硬拉",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                            child: Text(
                              "10",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Text(
                              "12",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.center,
                          )
                        ],
                      ),
                      TableRow(

                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              "半程硬拉",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                            child: Text(
                              "10",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Text(
                              "12",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.center,
                          )
                        ],
                      ),
                      TableRow(

                        children: [
                          Container(
                            child: Text(
                              "半程硬拉",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                            child: Text(
                              "10",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Text(
                              "12",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            alignment: Alignment.center,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ])
        // Switch out 2 lines below to play with TableCalendar's settings
        //-----------------------

        );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      locale: 'zh_CN',
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.blue,
        // todayColor: Colors.blue,
        highlightToday: false,
        markersColor: Colors.indigo,
        markersMaxAmount: 1,
        outsideDaysVisible: true,
        outsideWeekendStyle: TextStyle(color: Colors.grey),
        renderSelectedFirst: true,
        weekendStyle: TextStyle(color: Colors.black38),
      ),
      headerStyle: HeaderStyle(
          formatButtonTextStyle:
              TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
          formatButtonDecoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16.0),
          ),
          formatButtonVisible: false,
          leftChevronVisible: false,
          rightChevronVisible: false,
          headerMargin: EdgeInsets.fromLTRB(16, 0, 0, 0),
          titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
      builders: CalendarBuilders(
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];
          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 10,
                left: 10,
                bottom: 9,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          return children;
        },
        dowWeekendBuilder: (BuildContext context, String weekday) {
          return Container(
              child: Text(
                weekday,
                style: TextStyle(color: Colors.black38),
              ),
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0));
        },
      ),
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _calendarController.isSelected(date) ||
                (_calendarController.isSelected(date) &&
                    _calendarController.isToday(date))
            ? Colors.white
            : Colors.blue[400],
      ),
      width: 5.0,
      height: 5.0,
    );
  }
}
