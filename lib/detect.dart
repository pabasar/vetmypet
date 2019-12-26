import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

class Detect extends StatefulWidget {
  @override
  _DetectState createState() => _DetectState();
}

class _DetectState extends State<Detect> {
  File _file;
  String _labels;
  bool _result;

  void _openFilePicker() async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _file = file;
    });
    _runMLKitOnDeviceImageLabeler();
  }

  void _runMLKitOnDeviceImageLabeler() async {
    FirebaseVisionImage firebaseVisionImage =
    FirebaseVisionImage.fromFile(_file);
    ImageLabeler imageLabeler = FirebaseVision.instance.imageLabeler();
    List<ImageLabel> imageLabels =
    await imageLabeler.processImage(firebaseVisionImage);
    String labels = imageLabels.map((imageLabel) => imageLabel.text).join(", ");
    setState(() {
      _labels = labels;
      if (_labels.contains("Acral_Lick_Dermatitis") ||
          _labels.contains("Canine_Lupus") ||
          _labels.contains("Folliculitis")) {
        setState(() {
          _result = true;
        });
      } else {
        setState(() {
          _result = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Canine Disorders"),
          actions: <Widget>[
            _file != null
                ? IconButton(
              onPressed: () {
                setState(() {
                  _file = null;
                });
              },
              icon: Icon(Icons.close),
            )
                : IconButton(
              onPressed: () {
                _openFilePicker();
              },
              icon: Icon(Icons.attach_file),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _openFilePicker,
          child: Icon(Icons.attach_file),
        ),
        body: _file == null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Click FAB to select an Image",
              ),
            ),
          ],
        )
            : SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder(
                builder: (BuildContext buildContext,
                    AsyncSnapshot<dynamic> snapshot) =>
                    Container(
                      width: double.infinity,
                      color: _result ? Colors.green : Colors.red,
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                      child: Text(
                        _result
                            ? "Yes! Image does contains disorders.\n\n$_labels"
                            : "No! Image doesn't contain disorders.\n\n$_labels",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
              ),
              Container(
                margin: const EdgeInsets.all(12.0),
                child: FutureBuilder(
                    builder: (BuildContext buildContext,
                        AsyncSnapshot<dynamic> snapshot) =>
                        Image.file(_file)),
              ),
            ],
          ),
        ));
  }
}