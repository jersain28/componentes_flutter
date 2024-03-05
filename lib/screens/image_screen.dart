import 'package:flutter/material.dart';
import 'package:practica3/theme/app_theme.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagenes'),
      ),
      body: ListView(
        children: [
          cardImage1(),
          imageFade(),
        ],
      ),
    );
  }

  Card cardImage1(){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), 
      ),
      margin: const EdgeInsets.all(20),
      elevation: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
        children: [
         const Image(
            image: AssetImage('assets/img/Checo Perez.jpg')
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              '💪',
              style: AppTheme.lightTheme.textTheme.headlineMedium,
            ),
          ),
        ],
      ),
      ),
    );
  }

  SizedBox image2(){
    return SizedBox(
      height: 380,
      width: 350,
      child: Image.network('https://fast-mag.com/mag/wp-content/uploads/2023/02/SF_2023_Front3_4.jpg')
    );
  }

  Stack imageFade(){
    return Stack(
      children: <Widget>[
        const Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: 'https://fast-mag.com/mag/wp-content/uploads/2023/02/SF_2023_Front3_4.jpg',
          ),
        ),
      ],
    );
  }
}