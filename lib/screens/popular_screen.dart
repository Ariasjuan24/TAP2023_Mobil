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
            return GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: .7,
                crossAxisSpacing: 10
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return cardPopular(snapshot.data![index]);
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

  Widget cardPopular(PopularModel popularModel){
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FadeInImage(
          fit: BoxFit.fill,
          image:NetworkImage('https://image.tmdb.org/t/p/w500/${popularModel.posterPath}') ,
          placeholder: AssetImage('assets/loading.gif'),
        ),
      ),
    );
  }

}