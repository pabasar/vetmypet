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

  List<charts.Series<Sales, int>> _seriesLineData;

  generateData() {

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

    //----

    if(widget.n2>=53 && widget.n2<=55)
    {
      widget.n2 = widget.n2-18;

    }
    else if(widget.n2>=56 && widget.n2<=57)
    {
      widget.n2 = widget.n2-18;

    }
    else if(widget.n2>=48 && widget.n2<=52)
    {
      widget.n2 = widget.n2-8;

    }
    else
    {
      widget.n2 = 0;
    }

    //----

    if(widget.n3>=53 && widget.n3<=55)
    {
      widget.n3 = widget.n3-18;

    }
    else if(widget.n3>=56 && widget.n3<=57)
    {
      widget.n3 = widget.n3-18;

    }
    else if(widget.n3>=48 && widget.n3<=52)
    {
      widget.n3 = widget.n3-8;

    }
    else
    {
      widget.n3 = 0;
    }

    //----

    if(widget.n4>=53 && widget.n4<=55)
    {
      widget.n4 = widget.n4-18;

    }
    else if(widget.n4>=56 && widget.n4<=57)
    {
      widget.n4 = widget.n4-18;

    }
    else if(widget.n4>=48 && widget.n4<=52)
    {
      widget.n4 = widget.n4-8;

    }
    else
    {
      widget.n4 = 0;
    }

    //----

    if(widget.n5>=53 && widget.n5<=55)
    {
      widget.n5 = widget.n5-18;

    }
    else if(widget.n5>=56 && widget.n5<=57)
    {
      widget.n5 = widget.n5-18;

    }
    else if(widget.n5>=48 && widget.n5<=52)
    {
      widget.n5 = widget.n5-8;

    }
    else
    {
      widget.n5 = 0;
    }

    //----

    if(widget.n6>=53 && widget.n6<=55)
    {
      widget.n6 = widget.n6-18;

    }
    else if(widget.n6>=56 && widget.n6<=57)
    {
      widget.n6 = widget.n6-18;

    }
    else if(widget.n6>=48 && widget.n6<=52)
    {
      widget.n6 = widget.n6-8;

    }
    else
    {
      widget.n6 = 0;
    }

    //----

    //-----------------------

    var linesalesdata = [
      new Sales(0, this.widget.n6),
      new Sales(1, this.widget.n5),
      new Sales(2, this.widget.n4),
      new Sales(3, this.widget.n3),
      new Sales(4, this.widget.n2),
      new Sales(5, this.widget.n1),
    ];

    var linesalesdata1 = [
      new Sales(0, 10),
      new Sales(1, 10),
      new Sales(2, 10),
      new Sales(3, 10),
      new Sales(4, 10),
      new Sales(5, 10),
    ];

    var linesalesdata2 = [
      new Sales(0, 10),
      new Sales(1, 10),
      new Sales(2, 10),
      new Sales(3, 10),
      new Sales(4, 10),
      new Sales(5, 10),
    ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xFF3da4ab)),
        id: 'Temperature',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );

    //----------------------------------------------------
    /*
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.transparent),
        id: 'Temperature',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.transparent),
        id: 'Temperature',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    
     */

    //---------------------------------------------------
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesLineData = List<charts.Series<Sales, int>>();
    generateData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          appBar: AppBar(
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
                        Expanded(
                          child: charts.LineChart(
                            _seriesLineData,
                            defaultRenderer: new charts.LineRendererConfig(
                                includeArea: false, stacked: false),
                            //animate: false,
                            //animationDuration: Duration(seconds: 2),
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
