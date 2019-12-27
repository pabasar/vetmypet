import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

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
                color: Colors.teal[300],
                onPressed: () {
                  Navigator.of(context).pop();
                },
                textColor: Colors.white,
                child: const Text('Diagnose'),
              ),
      ],
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
          color: Colors.teal[300],
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => differentialDialog(context),
                    );
                    // Perform some action
                  },
                tooltip: 'Differential Diagnosis',
                child: Icon(Icons.add_box,color: Colors.white,),
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
      body: Container(
        child: buttons(),
      ),

    );
  }
}