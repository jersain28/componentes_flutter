import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3/models/data.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/image_screen.dart';
import 'package:practica3/screens/infinite_scroll_screen.dart';
import 'package:practica3/screens/inputs_screen.dart';
import 'package:practica3/screens/notifications_screen.dart';
import 'package:practica3/theme/app_theme.dart';

class DataScreen extends StatefulWidget {
  final Data datos;
  const DataScreen({super.key, required this.datos});

   @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
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
        title: const Text('Data Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tu nombre es: ',
            style:TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold) ),
            Text(widget.datos.nombre!, style: const TextStyle( color: Colors.black)),
            const Text('Respuesta a te gusta flutter: ',
            style:TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
            Text(widget.datos.gustoflutter.toString(), style: const TextStyle( color: Colors.black),),
            const Text('Cuanto te gusto flutter: ',
            style:TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
            Text(widget.datos.caliFlutter.toString(),style: const TextStyle( color: Colors.black)),
            const Text('Opcion entre kotlin y flutter:',
            style:TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
            Text(widget.datos.movilDev.toString(),style: const TextStyle( color: Colors.black)),
            const Text('Selecciono el Smartphone: ',
            style:TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold)),
            Text(widget.datos.smartphone.toString(),style: const TextStyle( color: Colors.black))
          ],
         ),
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
  
}