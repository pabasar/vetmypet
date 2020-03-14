import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:grouped_list/grouped_list.dart';

class Detect2 extends StatefulWidget {
  @override
  _Detect2State createState() => _Detect2State();
}

class _Detect2State extends State<Detect2> {
  Future<File> imageFile;

  bool notEat = false;
  bool dull = false;
  bool vomit = false;
  bool aggressive = false;
  bool clingy = false;
  bool breathDifficult = false;
  bool walkingDifficult = false;
  bool shivering = false;
  bool coughing = false;
  bool dryNose = false;
  bool dehydrate = false;

  List _elements = [
    {'name': 'Jimmy, Bacterial Infection', 'group': 'March'},
    {'name': 'Jimmy, Canine Lupus', 'group': 'March'},
    {'name': 'Jimmy, Infection', 'group': 'March'},
    {'name': 'Jimmy, Ear Infection', 'group': 'February'},
    {'name': 'Jimmy, Ringworm', 'group': 'January'},
    {'name': 'Jimmy, Weak Tissues', 'group': 'December'},
    {'name': 'Jimmy, Acral lick dermatitis', 'group': 'December'},
    {'name': 'Jimmy, Heart Trouble', 'group': 'December'},
    {'name': 'Jimmy, Weak Breath', 'group': 'December'},
    {'name': 'Jimmy, Dry Nose', 'group': 'November'},
    {'name': 'Jimmy, Ringworm', 'group': 'November'},


  ];

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }


  TapGestureRecognizer _flutterTapRecognizer;
  TapGestureRecognizer _githubTapRecognizer;


  @override
  void dispose() {
    _flutterTapRecognizer.dispose();
    _githubTapRecognizer.dispose();
    super.dispose();
  }


  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            height: 160,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            "" ,
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  Widget contactVet(BuildContext context)
  {
    return new AlertDialog(
      title: const Text('Nearby Vets',style: TextStyle(fontWeight: FontWeight.bold),),
      content: new ListView(
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          Text("Dr. P. Dillip"),
          Text("024 222 1633"),
          Text("Vavuniya"),
          SizedBox(height: 10,),
          new Divider(
            color: Color(0xFF03a678),
            height: 1.0,
          ),
          SizedBox(height: 10,),
          Text("Dr(Mrs). T. Thabothini"),
          Text("024 2222219  "),
          Text("Vavuniya"),
          SizedBox(height: 10,),
          new Divider(
            color: Color(0xFF03a678),
            height: 1.0,
          ),
          SizedBox(height: 10,),
          Text("Dr. I. M. Sandamali"),
          Text("024 2222219"),
          Text("Vavuniya"),
          SizedBox(height: 10,),
          new Divider(
            color: Color(0xFF03a678),
            height: 1.0,
          ),
          SizedBox(height: 10,),
          Text("Dr. K.G.M.P. Kumara"),
          Text("024 2222119"),
          Text("Vavuniya"),
          SizedBox(height: 10,),
          new Divider(
            color: Color(0xFF03a678),
            height: 1.0,
          ),
          SizedBox(height: 10,),
          Text("Dr. S. Sutharini"),
          Text("024 2223533"),
          Text("Vavuniya"),
          SizedBox(height: 10,),
          new Divider(
            color: Color(0xFF03a678),
            height: 1.0,
          ),
          SizedBox(height: 10,),
          Text("Dr. S. Thirualan"),
          Text("024 3243649"),
          Text("Vavuniya"),
          SizedBox(height: 10,),
          new Divider(
            color: Color(0xFF03a678),
            height: 1.0,
          ),
          SizedBox(height: 10,),
          Text("Dr. P N C Fernando"),
          Text("025 2226875"),
          Text("Anuradhapura"),
          SizedBox(height: 10,),
          new Divider(
            color: Color(0xFF03a678),
            height: 1.0,
          ),
          SizedBox(height: 10,),
          Text("Dr. G. Karawita"),
          Text("025 2225976"),
          Text("Anuradhapura"),
          SizedBox(height: 10,),
          new Divider(
            color: Color(0xFF03a678),
            height: 1.0,
          ),
          SizedBox(height: 10,),
          Text("Dr. S.Gowrithilagan"),
          Text("021 3208077"),
          Text("Kilinochchi"),
          SizedBox(height: 10,),
        ],
      ),
    );

  }

  Widget differentialDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('My Pet is,',style: TextStyle(fontWeight: FontWeight.bold),),
      content: new ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                value: notEat,
                onChanged: (bool value) {
                  setState(() {
                    notEat = value;
                  });
                },
              ),
              Text("Not eating"),
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: dull,
                onChanged: (bool value) {
                  setState(() {
                    dull = value;
                  });
                },
              ),
              Text("Dull & listless"),
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: vomit,
                onChanged: (bool value) {
                  setState(() {
                    vomit = value;
                  });
                },
              ),
              Text("Vomitting"),
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: aggressive,
                onChanged: (bool value) {
                  setState(() {
                    aggressive = value;
                  });
                },
              ),
              Text("Aggressive"),
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: clingy,
                onChanged: (bool value) {
                  setState(() {
                    clingy = value;
                  });
                },
              ),
              Text("Clingy"),
            ],
          ),

          Row(
            children: <Widget>[
              Checkbox(
                value: breathDifficult,
                onChanged: (bool value) {
                  setState(() {
                    breathDifficult = value;
                  });
                },
              ),
              Text("Hardly breathing"),
            ],
          ),

          Row(
            children: <Widget>[
              Checkbox(
                value: walkingDifficult,
                onChanged: (bool value) {
                  setState(() {
                    walkingDifficult = value;
                  });
                },
              ),
              Text("Hardly walking"),
            ],
          ),

          Row(
            children: <Widget>[
              Checkbox(
                value: shivering,
                onChanged: (bool value) {
                  setState(() {
                    shivering = value;
                  });
                },
              ),
              Text("Shivering"),
            ],
          ),

          Row(
            children: <Widget>[
              Checkbox(
                value: coughing,
                onChanged: (bool value) {
                  setState(() {
                    coughing = value;
                  });
                },
              ),
              Text("Coughing"),
            ],
          ),

          Row(
            children: <Widget>[
              Checkbox(
                value: dryNose,
                onChanged: (bool value) {
                  setState(() {
                    dryNose = value;
                  });
                },
              ),
              Text("Having dry nose"),
            ],
          ),

        ],
      ),
      actions: <Widget>[
              RaisedButton(
                color: Color(0xFF03a678),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                textColor: Colors.white,
                child: const Text('Diagnose'),
              ),
      ],
    );
  }

  Widget history()
  {
    return new GroupedListView<dynamic, String>(
      groupBy: (element) => element['group'],
      elements: _elements,
      order: GroupedListOrder.DESC,
      groupSeparatorBuilder: (String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
      ),
      itemBuilder: (c, element) {
        return Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            child: ListTile(
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Icon(Icons.history),
              title: Text(element['name']),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        );
      },
    );
  }


  Widget detectDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Canine Lupus',style: TextStyle(fontWeight: FontWeight.bold),),
      content: new ListView(
        children: <Widget>[
          showImage(),
          SizedBox(height: 20.0),
          Text('Other possibilities',style: TextStyle(fontSize: 20),),
          Text('Acral lick dermatitis, Ringworm',),
          SizedBox(height: 15.0),
          Text('Type',style: TextStyle(fontSize: 20),),
          Text('Symptom',),
          SizedBox(height: 15.0),
          Text('Condition',style: TextStyle(fontSize: 20),),
          Text('Critical',),
          SizedBox(height: 15.0),
          Text('Recommandation',style: TextStyle(fontSize: 20),),
          Text('Visit vet immediately',),
          SizedBox(height: 15.0),
          Text('Treatments',style: TextStyle(fontSize: 20),),
          Text('Prednisone or other oral steroids might be given until the condition is under control. Antibiotics and supplements, including Vitamins B and E and Omega-3 fatty acids, may also be given.',),
          SizedBox(height: 15.0),
          Text('Additional information',style: TextStyle(fontSize: 20),),
          Text('Disease in which the immune system attacks the body’s own cells and tissue. Limit your dogs’ exposure to ultraviolet light, including sunlight, as this worsens the condition.',),



        ],
      ),
      actions: <Widget>[
        RaisedButton(
          color: Color(0xFF03a678),
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Colors.white,
          child: const Text('Done'),
        ),
      ],
    );
  }


  Widget buttons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 15),
              child:
              FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/monitor');
                    // Perform some action
                  },
                tooltip: 'Monitor',
                child: Icon(Icons.add_to_home_screen,color: Colors.white,),
              ),)
        ),

        Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 15),
              child:
              FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => contactVet(context),
                  );
                  // Perform some action
                },
                tooltip: 'Nearby Veterinary Surgeons',
                child: Icon(Icons.contacts,color: Colors.white,),
              ),)
        ),


        Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 15),
              child:
              FloatingActionButton(
                onPressed: () {
                  pickImageFromGallery(ImageSource.gallery);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => detectDialog(context),
                  );
                },
                tooltip: 'Pick Image From Gallery',
                child: Icon(Icons.image,color: Colors.white,),
              ),)
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 15),
              child:
              FloatingActionButton(
                onPressed: () {
                  pickImageFromGallery(ImageSource.camera);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => detectDialog(context),
                  );
                },
                tooltip: 'Pick Image From Camera',
                child: Icon(Icons.camera_alt,color: Colors.white,),
              ),)
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vet My Pet',style: new TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,
      ),
      body:
      Stack(
        children: <Widget>[
          history(),
          Container(
            child: buttons(),
          ),
        ],
      ),
    );
  }
}