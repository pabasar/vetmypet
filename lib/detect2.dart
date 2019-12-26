import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class Detect2 extends StatefulWidget {
  @override
  _Detect2State createState() => _Detect2State();
}

class _Detect2State extends State<Detect2> {
  Future<File> imageFile;

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            height: 60,
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
                  pickImageFromGallery(ImageSource.gallery);
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