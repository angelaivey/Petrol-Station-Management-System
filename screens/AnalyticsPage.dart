import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnalyticsPage extends StatefulWidget {
  final Widget child;

  AnalyticsPage({Key key, this.child}) : super (key: key);

  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {

  List<charts.Series<Pollution, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Sales, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      new Pollution(1980, 'Nairobi', 30),
      new Pollution(1980, 'Mombasa', 40),
      new Pollution(1980, 'Nakuru', 10),
    ];
    var data2 = [
      new Pollution(1985, 'Nairobi', 100),
      new Pollution(1980, 'Mombasa', 150),
      new Pollution(1985, 'Nakuru', 80),
    ];
    var data3 = [
      new Pollution(1985, 'Nairobi', 200),
      new Pollution(1980, 'Mombasa', 300),
      new Pollution(1985, 'Nakuru', 180),
    ];

    var piedata = [
      new Task('Diesel', 35.8, Color(0xff3366cc)),
      new Task('Unleaded Premium', 8.3, Color(0xff990099)),
      new Task('Kerosene', 10.8, Color(0xff109618)),
      new Task('Lubricants', 15.6, Color(0xfffdbe19)),
      new Task('Engine Oil', 19.2, Color(0xffff9900)),
      new Task('Gas', 10.3, Color(0xffdc3912)),
    ];

    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];
    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata2 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Pollution, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Sales, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Sales Analysis Graphs'),
            backgroundColor: Color(0xff07239d),
            bottom: TabBar(
              indicatorColor: Color(0xff07239d),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.chartPie),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.chartLine),
                ),
              ],
            ),
          ),
          body: TabBarView(
              children: [
                Padding(padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text('Sales from the past month',
                            style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                          Expanded(
                              child: charts.BarChart(
                                _seriesData,
                                animate: true,
                                barGroupingType: charts.BarGroupingType.grouped,
                                animationDuration: Duration(seconds: 5),
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
               Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Container(
                   child: Center(
                     child: Column(
                       children: <Widget>[
                         Text(
                           'Sales made on different oils',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                         SizedBox(height: 10.0,),
                         Expanded(
                           child: charts.PieChart(
                               _seriesPieData,
                               animate: true,
                               animationDuration: Duration(seconds: 5),
                               behaviors: [
                                 new charts.DatumLegend(
                                   outsideJustification: charts.OutsideJustification.endDrawArea,
                                   horizontalFirst: false,
                                   desiredMaxRows: 2,
                                   cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                   entryTextStyle: charts.TextStyleSpec(
                                       color: charts.MaterialPalette.purple.shadeDefault,
                                       fontFamily: 'Georgia',
                                       fontSize: 11),
                                 )
                               ],
                               defaultRenderer: new charts.ArcRendererConfig(
                                   arcWidth: 100,
                                   arcRendererDecorators: [
                                     new charts.ArcLabelDecorator(
                                         labelPosition: charts.ArcLabelPosition.inside)
                                   ])),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Sales for the past 5 months',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                          Expanded(
                            child: charts.LineChart(
                                _seriesLineData,
                                defaultRenderer: new charts.LineRendererConfig(
                                    includeArea: true, stacked: true),
                                animate: true,
                                animationDuration: Duration(seconds: 5),
                                behaviors: [
                                  new charts.ChartTitle('Months',
                                      behaviorPosition: charts.BehaviorPosition.bottom,
                                      titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                                  new charts.ChartTitle('Sales',
                                      behaviorPosition: charts.BehaviorPosition.start,
                                      titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                                  new charts.ChartTitle('Stations',
                                    behaviorPosition: charts.BehaviorPosition.end,
                                    titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
                                  )
                                ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}