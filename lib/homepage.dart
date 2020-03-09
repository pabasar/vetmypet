import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'data_receive.dart';

class HomePage extends StatefulWidget {
  //final Widget child;
  String word;

  int n1,n2,n3,n4,n5,n6;

  //HomePage({Key key, this.child}) : super(key: key);

  HomePage({Key key, @required this.word}) :
        n1 = int.parse(word.substring(0,2)),
        n2 = int.parse(word.substring(2,4)),
        n3 = int.parse(word.substring(4,6)),
        n4 = int.parse(word.substring(6,8)),
        n5 = int.parse(word.substring(8,10)),
        n6 = int.parse(word.substring(10,12)),
        super(key: key);

  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<charts.Series<Pollution, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Sales, int>> _seriesLineData;

  generateData() {
    var data1 = [
      new Pollution(1980, 'USA', 30),
      new Pollution(1980, 'Asia', 40),
      new Pollution(1980, 'Europe', 10),
    ];
    var data2 = [
      new Pollution(1985, 'USA', 100),
      new Pollution(1980, 'Asia', 150),
      new Pollution(1985, 'Europe', 80),
    ];
    var data3 = [
      new Pollution(1985, 'USA', 200),
      new Pollution(1980, 'Asia', 300),
      new Pollution(1985, 'Europe', 180),
    ];

    var piedata = [
      new Task('Work', 35.8, Color(0xff3366cc)),
      new Task('Eat', 8.3, Color(0xff990099)),
      new Task('Commute', 10.8, Color(0xff109618)),
      new Task('TV', 15.6, Color(0xfffdbe19)),
      new Task('Sleep', 19.2, Color(0xffff9900)),
      new Task('Other', 10.3, Color(0xffdc3912)),
    ];

    //-----------------------

    if(widget.n1>=53 && widget.n1<=55)
    {
      widget.n1 = widget.n1-18;

    }
    else if(widget.n1>=56 && widget.n1<=57)
    {
      widget.n1 = widget.n1-18;

    }
    else if(widget.n1>=48 && widget.n1<=52)
    {
      widget.n1 = widget.n1-8;

    }
    else
    {
      widget.n1 = 0;
    }

    //-----------------------

    var linesalesdata = [
      new Sales(0, this.widget.n1),
      new Sales(1, this.widget.n2),
      new Sales(2, this.widget.n3),
      new Sales(3, this.widget.n4),
      new Sales(4, this.widget.n5),
      new Sales(5, this.widget.n6),
    ];

    var linesalesdata1 = [
      new Sales(0, 50),
      new Sales(1, 50),
      new Sales(2, 50),
      new Sales(3, 50),
      new Sales(4, 50),
      new Sales(5, 50),
    ];

    var linesalesdata2 = [
      new Sales(0, 50),
      new Sales(1, 50),
      new Sales(2, 50),
      new Sales(3, 50),
      new Sales(4, 50),
      new Sales(5, 50),
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
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.teal),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.transparent),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.transparent),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<Pollution, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Sales, int>>();
    generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              //indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
            title: Text('Temperature Variation'),
          ),
          body: Center(
            child:
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'Body Temperature Variation',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.LineChart(
                            _seriesLineData,
                            defaultRenderer: new charts.LineRendererConfig(
                                includeArea: true, stacked: true),
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            behaviors: [
        new charts.ChartTitle('Time',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('Temperature Celcius',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('',
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
