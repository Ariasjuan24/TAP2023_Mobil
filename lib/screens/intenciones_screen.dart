import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

class IntencionesScreen extends StatelessWidget {
  IntencionesScreen({super.key});

  final Image = ImagePicker();
  String? pathImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intenciones"),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 5, top: 5, right: 5),
        children: [
          cardIntencion(
            color: Colors.blue, 
            subtitle: "Abrir página web", 
            title: "https://itcelaya.edu.mx",
            img: Image.asset('assets/317753_chrome_internet_web browser_web_browser_icon.png'),
            evento: (){
              _openWEB(context);
            }),
          const SizedBox(height: 5,),
          cardIntencion(
            title: "Llamada telefónica",
            subtitle: "4661850877",
            color: Colors.deepPurpleAccent,
            img: Image.asset('assets/170987_phone_icon.png'),
            evento: (){
              _callPhone(context);
            }
            ),
          const SizedBox(height: 5,),
          cardIntencion(
            color: Colors.blueGrey,
            title: "Enviar SMS",
            subtitle: "4661850877",
            img: Image.asset('assets/1215419_chat_facetime_messages_sms_icon.png'),
            evento: (){
              _sendSMS(context);
            }
          ),
          const SizedBox(height: 5,),
          cardIntencion(
            color: Colors.yellow,
            title: "Enviar Email",
            subtitle: "4661850877",
            img: Image.asset('assets/1215419_chat_facetime_messages_sms_icon.png'),
            evento: (){
              _sendEmail(context);
            }
          ),
          const SizedBox(height: 5,),
          cardIntencion(
            color: Colors.lightBlueAccent,
            title: "Tomar Fotografía",
            subtitle: "4661850877",
            img: Image.asset('assets/1215419_chat_facetime_messages_sms_icon.png'),
            evento: (){
              _takePhoto();
              setState(() {});
            }
          ),
          pathImage != null
          ? Image.file( File(pathImage!) )
          : Container()
        ],
      ),
    );
  }

  Future<void> _openWEB(BuildContext context) async { 
    Uri url  = Uri.parse("https://itcelaya.edu.mx");
    if( !await launchUrl(url)  ){

      final snackBar = SnackBar(content: Text('La URL no es válida'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  
  Future<void> _callPhone(BuildContext context) async {
    Uri url  = Uri.parse("tel:4661850877");
    if( !await launchUrl(url)  ){

      final snackBar = SnackBar(content: Text('El número no es válido'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> _sendSMS(BuildContext context) async {
    Uri url  = Uri.parse("sms:4661850877?body=hola");
    if( !await launchUrl(url)  ){

      final snackBar = SnackBar(content: Text('El número no es válido'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> _sendEmail(BuildContext context) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: '21030149@itcelaya.edu.mx',
      query: 'subject=Saludos&body=Buen día'
    );

    if( !await launchUrl(params)  ){

      final snackBar = SnackBar(content: Text('No se pudo enviar el email'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> _takePhoto() async {
    final archivo = await image.pickImage(source: ImageSource.camera);
    pathImage = archivo!.path;
  }


  Widget cardIntencion({
    required Color color, 
    required String title,
    required String subtitle,
    required Widget img,
    required Function() evento}){
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.chevron_right),
        leading: img,
        onTap: evento,
      ),
    );
  }

}



// El context Lanzar un elemento visual, en qué contexto o dónde lo voy a mandar.
// la interfaz grafica que uno esta visualizando es el contexto en donde los elementos interactuan
//El contexto es la pantalla con la que estamos interactuando. Es la clase visual que está en ese momento
//interactuando con el usuario