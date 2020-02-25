import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'login.dart';


class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      //Text('Basic date field (${format.pattern})'),
      DateTimeField(
        style: new TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixStyle: const TextStyle(color: Color(0xFFe25d5b)),
          suffixStyle: const TextStyle(color: Color(0xFFe25d5b)),
          hintText: '2019-01-01',
          hintStyle: TextStyle(color: Colors.grey[500]),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
              borderSide: new BorderSide(color: Color(0xFFe25d5b))),
        ),
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}

class AddPet extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return new AddPetState();
  }

}

class AddPetState extends State<AddPet>
{
  Future<File> imageFile;

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }
  int radioValueSpay = 0;
  double _finalResult = 0.0;
  String _spayNeutered = "";

  void handleRadioSpay(int value)
  {
    setState(() {
      radioValueSpay = value;

      switch(radioValueSpay)
      {
        case 0:
        //_finalResult = calculateWeight(_weightController.text, 0.06);
          _spayNeutered = "Yes";
          break;

        case 1:
        //_finalResult = calculateWeight(_weightController.text, 0.38);
          _spayNeutered = "No";
          break;
      }

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
            height: 150,
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

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    petNameController.dispose();
    super.dispose();
  }
  final petNameController = TextEditingController();
  String petNameString = "";



  void showPetName()
  {
    setState(() {
      if(petNameController.text.isNotEmpty) {

        petNameString = petNameController.text;
      }
      else
      {
        petNameString = "My Pet";
      }
    });
  }




  /*final petName = TextFormField(
    controller: petNameController,
    keyboardType: TextInputType.text,
    style: new TextStyle(color: Colors.lightBlue),
    autofocus: false,
    initialValue: "",
    cursorColor: Colors.purple[300],
    decoration: InputDecoration(
      suffixStyle: const TextStyle(color: Colors.white),
      hintText: 'Snowy, Tommy...',
      hintStyle: TextStyle(color: Colors.grey[500]),
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
          borderSide: new BorderSide(color: Colors.purple[300])),
    ),
  );*/


  final petCallsUser = TextFormField(
    keyboardType: TextInputType.text,
    style: new TextStyle(color: Colors.black),
    autofocus: false,
    initialValue: "",
    cursorColor: Color(0xFFe25d5b),
    decoration: InputDecoration(
      prefixStyle: const TextStyle(color: Color(0xFFe25d5b)),
      suffixStyle: const TextStyle(color: Colors.white),
      hintText: 'John, Daddy, Bro...',
      hintStyle: TextStyle(color: Colors.grey[500]),
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
          borderSide: new BorderSide(color: Color(0xFFe25d5b))),
    ),
  );

  final weight = TextFormField(
    keyboardType: TextInputType.number,
    style: new TextStyle(color: Colors.black),
    autofocus: false,
    initialValue: "",
    cursorColor: Color(0xFFe25d5b),
    decoration: InputDecoration(
      suffixStyle: const TextStyle(color: Colors.white),
      prefixStyle: const TextStyle(color: Color(0xFFe25d5b)),
      hintText: 'In Kilograms',
      hintStyle: TextStyle(color: Colors.grey[500]),
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
          borderSide: new BorderSide(color: Color(0xFFe25d5b))),
    ),
  );

/*final dob = FlatButton(
    onPressed: () {
      DatePicker.showDatePicker(context,
          showTitleActions: true,
          minTime: DateTime(2018, 3, 5),
          maxTime: DateTime(2019, 6, 7), onChanged: (date) {
            print('change $date');
          }, onConfirm: (date) {
            print('confirm $date');
          }, currentTime: DateTime.now(), locale: LocaleType.zh);
    },
    child: Text(
      'show date time picker (Chinese)',
      style: TextStyle(color: Colors.blue),
    ));*/


  final gender = RadioButtonGroup(
    labels: <String>[
      "Male",
      "Female",
    ],
    //onSelected: (String selected) => print(selected),
  );

  final spayNeutered = RadioButtonGroup(
    labels: <String>[
      "Yes",
      "No",
    ],
    //onSelected: (String selected) => print(selected),
  );

  List<String> suggestions = [
    "German Shepherd",
    "Bulldog",
    "Labrador Retriever",
    "Poodle",
    "Greyhound",
    "Beagle",
    "Chihuahua",
    "Pug",
    "English Mastiff",
    "Golden Retriever",
    "Chinese Crested Dog",
    "Boxer",
    "Siberian Husky",
    "Great Dane",
    "Rottweiler",
    "Yorkshire Terrier",
    "Australian Shepherd",
    "Dachshund",
    "Pointer",
    "Maltese dog",
    "Belgian Shepherd",
  ];

  final continueButton = Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {},
      padding: EdgeInsets.all(12),
      color: Color(0xFFe25d5b),
      child: Text('Continue', style: TextStyle(color: Colors.white)),
    ),
  );













  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFFe25d5b),
        title: new Text("Hi, Let's add your Pet",
          style: new TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: PageIndicatorContainer(
          child: PageView(
            children: <Widget>[
              new Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 50.0, right: 50.0,top: 20.0,bottom: 20.0),
                child: new ListView(
                  children: <Widget>[
                    new Text("My Pet is a",
                      style: new TextStyle(color: Color(0xFFe63c37)),textAlign: TextAlign.center,),
                    SizedBox(height: 120.0),

                    new Text("My Pet's Photo",
                      style: new TextStyle(color: Color(0xFFe63c37)),textAlign: TextAlign.center,),

                    SizedBox(height: 8.0),

                    Container(
                      height: 100.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: showImage(),
                    ),

                    FlatButton(
                      shape: CircleBorder(),
                      color: Color(0xFFe25d5b),
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.add_a_photo,color: Colors.white,size: 20,),
                      onPressed: () {
                        pickImageFromGallery(ImageSource.gallery);
                      },
                    ),

                    SizedBox(height: 20.0),

                    new Divider(
                      color: Color(0xFFe25d5b),
                      height: 1.0,
                    ),
                    SizedBox(height: 20.0),

                    new Text("I call my Pet",
                      style: new TextStyle(color: Color(0xFFe63c37)),textAlign: TextAlign.center,),
                    SizedBox(height: 8.0),

                    new TextFormField(
                      //controller: petNameController,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(color: Colors.black),
                      autofocus: false,
                      initialValue: "",
                      cursorColor: Color(0xFFe25d5b),
                      decoration: InputDecoration(
                        prefixStyle: const TextStyle(color: Color(0xFFe25d5b)),
                        suffixStyle: const TextStyle(color: Colors.white),
                        hintText: 'Snowy, Tommy...',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
                            borderSide: new BorderSide(color: Color(0xFFe25d5b))),
                      ),
                    ),

                    SizedBox(height: 40.0),

                    new Text("I feel like My Pet calls me",
                      style: new TextStyle(color: Color(0xFFe63c37)),textAlign: TextAlign.center,),
                    SizedBox(height: 8.0),

                    petCallsUser,
                  ],
                ),
              ),
              new Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 50.0, right: 50.0,top: 20.0,bottom: 20.0),
                child: new ListView(
                  children: <Widget>[
                    new Text("My Pet is",
                      style: new TextStyle(color: Color(0xFFe63c37)),textAlign: TextAlign.center,),
                    SizedBox(height: 20.0),
                    gender,
                    SizedBox(height: 20.0),
                    new Divider(
                      color: Color(0xFFe25d5b),
                      height: 1.0,
                    ),
                    SizedBox(height: 20.0),

                    new Text("My Pet's Breed is",
                      style: new TextStyle(color: Color(0xFFe63c37)),textAlign: TextAlign.center,),
                    SizedBox(height: 8.0),
                    new SimpleAutoCompleteTextField(
                      key: null,
                      suggestions: suggestions,
                      decoration: new InputDecoration(
                        prefixStyle: const TextStyle(color: Color(0xFFe25d5b)),
                        suffixStyle: const TextStyle(color: Colors.white),
                        hintText: 'German Shepherd..',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
                            borderSide: new BorderSide(color: Color(0xFFe25d5b))),
                      ),
                    ),

                    SizedBox(height: 50.0),

                    new Image.asset(
                      'images/dogbreed.png',
                      height: 150.0,
                    ),

                  ],
                ),
              ),
              new Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 50.0, right: 50.0,top: 20.0,bottom: 20.0),
                child: new ListView(
                  children: <Widget>[
                    SizedBox(height: 50.0),
                    new Image.asset(
                      'images/birthday.png',
                      height: 200.0,
                    ),
                    SizedBox(height: 50.0),
                    new Text("My Pet was born on",
                      style: new TextStyle(color: Color(0xFFe63c37)),textAlign: TextAlign.center,),
                    SizedBox(height: 8.0),
                    BasicDateField(),
                  ],
                ),
              ),

              new Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 50.0, right: 50.0,top: 20.0,bottom: 20.0),
                child: new ListView(
                  children: <Widget>[
                    new Text("My Pet's Weight is",
                      style: new TextStyle(color: Color(0xFFe63c37)),textAlign: TextAlign.center,),
                    SizedBox(height: 30.0),
                    new Image.asset(
                      'images/dogweight.png',
                      height: 150.0,
                    ),

                    SizedBox(height: 30.0),

                    weight,

                    SizedBox(height: 20.0),

                    new Divider(
                      color: Color(0xFFe25d5b),
                      height: 1.0,
                    ),
                    SizedBox(height: 20.0),

                    new Text("My Pet's is Spayed or Neutered?",
                      style: new TextStyle(color: Color(0xFFe63c37)),textAlign: TextAlign.center,),
                    SizedBox(height: 8.0),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //  radio buttons
                        new Radio<int>(
                            activeColor: Color(0xFFe25d5b),
                            value: 0, groupValue: radioValueSpay, onChanged: handleRadioSpay),

                        new Text(
                          "Yes",style: new TextStyle(color: Colors.black),
                        ),

                        new Text(
                          "xx",style: new TextStyle(color: Colors.transparent),
                        ),

                        new Radio<int>(
                            activeColor: Color(0xFFe25d5b),
                            value: 1, groupValue: radioValueSpay, onChanged: handleRadioSpay),

                        new Text(
                          "No",style: new TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    continueButton,

                  ],
                ),
              ),
            ],
            //controller: controller,
          ),
          align: IndicatorAlign.bottom,
          length: 4,
          indicatorSpace: 20.0,
          padding: const EdgeInsets.all(15),
          indicatorColor: Colors.redAccent[50],
          indicatorSelectorColor: Color(0xFFe25d5b),
          shape: IndicatorShape.circle(size: 12),
          // shape: IndicatorShape.roundRectangleShape(size: Size.square(12),cornerSize: Size.square(3)),
          // shape: IndicatorShape.oval(size: Size(12, 8)),,
        ),
      ),
    );
  }

}