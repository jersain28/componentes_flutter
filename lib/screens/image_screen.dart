import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/infinite_scroll_screen.dart';
import 'package:practica3/screens/inputs_screen.dart';
import 'package:practica3/screens/notifications_screen.dart';
import 'package:practica3/theme/app_theme.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  int indexNavigation = 0;

  openScreen(int index, BuildContext context){
    MaterialPageRoute ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
    switch(index){
      case 0:
        ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
        break;
      case 1:
        ruta = MaterialPageRoute(builder: (context) => const InputsScreen());
        break;
      case 2:
        ruta = MaterialPageRoute(builder: (context) => const InfiniteScrollScreen());
        break;
      case 3:
        ruta = MaterialPageRoute(builder: (context) => const NotificationsScreen());
        break;
      case 4:
        ruta = MaterialPageRoute(builder: (context) => const ImagesScreen());
        break;
      case 5: // Comportamiento aplicable a solo telefono
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
    setState(() {
      indexNavigation = index;
      Navigator.push(context, ruta);
    });
  }
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
       bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexNavigation,
          backgroundColor: AppTheme.primaryColor,
          unselectedItemColor: AppTheme.primaryColor,
          selectedItemColor: Colors.amber,
          onTap: (index) => openScreen(index, context),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.input),
              label: 'Entradas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Lista',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active),
              label: 'Notificación',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Imagenes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.data_object),
              label: 'Data',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Salir',
            ),
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
            image: AssetImage('assets/img/MCL38.jpg')
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