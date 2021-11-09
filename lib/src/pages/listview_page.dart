import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregarimagenes();
    _scrollController.addListener(() {

      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {
        _agregarimagenes();
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
            _crearLista(),
        ],
      )
      
      
    );
  }

  Widget _crearLista() {

    return RefreshIndicator(

        onRefresh: obtenerPagina1,
      
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index ){

          final imagen = _listaNumeros[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/loading-3.gif'),
          );
        },
      ),
    );

  }

  Future<Null> obtenerPagina1() async {

    final duration = new Duration( seconds: 2 );
    new Timer( duration, () {

      _listaNumeros.clear();
      _ultimoItem++;
      _agregarimagenes();

    });
  }



  void _agregarimagenes() {
    
    for (var i = 1; i <= 3; i++) {
      _ultimoItem++;
      _listaNumeros.add( _ultimoItem );
    }
    setState(() {});
  }
}