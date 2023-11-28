import 'package:flutter/material.dart';
import 'package:topicos/modelos/popular_model.dart';
import 'package:topicos/network/popular_api.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {

  PopularApi? popularApi;
  @override
  void initState() {
    super.initState();
    popularApi = PopularApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popular Movies'),),
      body: FutureBuilder(
        future: popularApi!.getAllPopular(),
        builder:(context, AsyncSnapshot<List<PopularModel>?> snapshot) {
          if( snapshot.hasData ){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data![index].title!);
              },
            );
          }else{
            if( snapshot.hasError ){
              return const Center(child: Text('Algo salio mal'),);
            }
            else{
              return const Center(
                child: CircularProgressIndicator()
              );
            }
          }
        },
      ),
    );
  }
}