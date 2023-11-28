import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height, //MediaQuery obtener el tamaño de la pantalla en la que se esta visualizando
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            opacity: .7,
            image: AssetImage('assets/gojo_purple.jpg') 
          )
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              top: 320,
              child: Image(
                width: 350,
                image: AssetImage('assets/titulo_jujutsu.png')
                )
            ),
            Positioned(
              bottom: 200,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                width: MediaQuery.of(context).size.width*.9,
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Username'),
                        border: OutlineInputBorder(),
                        prefixIcon: Image(
                          width: 50,
                          image: AssetImage('assets/dedo.png'),
                          )
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        border: OutlineInputBorder(),
                        prefixIcon: Image(
                          width: 50,
                          image: AssetImage('assets/dedo.png'),
                          )
                      ),
                    )
                  ],
                ),

              )
              ),
              Positioned(
                bottom: 40,
                child: GestureDetector(
                  onTap: ()=>Navigator.pushNamed(context, '/dash'),
                  child: const Image(
                    height: 150,
                    image: AssetImage('assets/dedo.png')
                  ),
                )
              )
          ],
        ),
      ),
    );
  }
}