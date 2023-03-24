import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading =true;
  File ? _image;
  List ? _output;
  final picker=ImagePicker();

  detectImage(File image) async {
    var output=await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5
    );

    setState(() {
      _output=output;
      _loading=false;
    });
  }

  loadModel() async{
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt'
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  pickImage() async {
    var Image=await picker.getImage(source: ImageSource.camera);

    if(Image==null){
      return null;
    }

    setState(() {
      _image=File(Image.path);
    });

    detectImage(_image!);
  }

  pickGalleryImage() async {
    var Image=await picker.getImage(source: ImageSource.gallery);

    if(Image==null){
      return null;
    }

    setState(() {
      _image=File(Image.path);
    });

    detectImage(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x004242),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Coding Cafe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Cats and Dogs detector App',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 30
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: _loading ? 
              SizedBox(
                width: 400,
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/cat_dog_icon.png'),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ) :
              Container()
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width-250,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 18
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: const Text(
                          'Capture a photo',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width-250,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 18
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: const Text(
                          ' Select a photo',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}