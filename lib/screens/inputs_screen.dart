import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3/models/data.dart';
import 'package:practica3/screens/data_screen.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/image_screen.dart';
import 'package:practica3/screens/infinite_scroll_screen.dart';
import 'package:practica3/screens/notifications_screen.dart';
import 'package:practica3/theme/app_theme.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  String? nombre;
  bool switchValue = false; // controlar el widget switch
  double slidervalue = 0.0;
  String? radioSelected;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
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
        title: const Text('Entradas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            entradaNombre(),
            entradaSwitch(),
            entradaSlider(),
            entradasRadio(),
            Text(
              '¿Que usas para correr tus Apps?',
              style: AppTheme.lightTheme.textTheme.headlineLarge,
            ),
            entradasCheck(),
            ElevatedButton(
                onPressed: (){
                  Data data = Data(nomb: nombre!, gusto: switchValue, calif: slidervalue.round(), movil: radioSelected!, nav: isChecked1, emul: isChecked2, phone: isChecked3);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  DataScreen(datos: data)));
                },
                child: const Text(
                     'Guardar',
                ),
                ),
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
              icon: Icon(Icons.exit_to_app),
              label: 'Salir',
            ),
          ],
        ),
      );
  }

  TextField entradaNombre() {
    return TextField(
          style: AppTheme.lightTheme.textTheme.headlineMedium,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: 'Escribe tu nombre',
            labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        onChanged: (text) => nombre = text,
     );
  }

  Row entradaSwitch(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Do you like F1?',
          style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
        Switch(
          value: switchValue,
          onChanged: (value){
            setState(() {
              switchValue = value;
              }
            );
          }
        ),
      ],
    );
  }

  Column entradaSlider(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Indica que tanto te gusta la F1',
           style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
        Slider(
          min: 0.0,
          max: 10.0,
          activeColor: const Color.fromARGB(255, 2, 28, 12),
          thumbColor: AppTheme.primaryColor,
          inactiveColor: AppTheme.backColor2,
          value: slidervalue,
          divisions: 10,
          label: '${slidervalue.round()}',
          onChanged: (value){
            setState(() {
              slidervalue = value; 
            });
          }),
      ],
    );
  }

  Column entradasRadio(){
    return Column(
      children: [
        Text(
          '¿Que prefieres para desarrollo Movil?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        ListTile(
          title: Text(
            'Kotlin',
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: 'Kotlin',
              groupValue: radioSelected,
              onChanged: (value){
                setState(() {
                  radioSelected = value!;
                });
              },
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Flutter',
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: 'Flutter',
              groupValue: radioSelected,
              onChanged: (value){
                setState(() {
                  radioSelected = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Row entradasCheck(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Navegador',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            value: isChecked1,
            onChanged: (value){
              setState(() {
                isChecked1 = value!;
              });
            },
          ),
        ),
        Text(
          'Emulador',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            value: isChecked2,
            onChanged: (value){
              setState(() {
                isChecked2 = value!;
              });
            },
          ),
        ),
        Text(
          'Smartphone',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            value: isChecked3,
            onChanged: (value){
              setState(() {
                isChecked3 = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
