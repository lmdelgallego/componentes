import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _lastNumber = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _add10();
        fetchData();
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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Listas & Scroll'),
        ),
        body: Stack(children: [
          _crearLista(),
          _loading(),
        ]),
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _onRefress,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300?random=$image'),
          );
        },
      ),
    );
  }

  void _add10() {
    for (var i = 0; i < 10; i++) {
      _lastNumber++;
      _listaNumeros.add(_lastNumber);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    new Timer(Duration(seconds: 2), responseHttp);
  }

  void responseHttp() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );
    _add10();
  }

  Widget _loading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> _onRefress() async {
    var duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _lastNumber++;
      _add10();
    });

    return Future.delayed(duration);
  }
}
