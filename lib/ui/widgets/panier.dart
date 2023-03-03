import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Panier extends StatefulWidget {
  Panier({Key? key}) : super(key: key);

  var state = _PanierState();
  @override
  State<Panier> createState() => state;

  void add_nbreproduit(){
    state.add_nbreproduit();
  }
  void update_nbreproduit(){
    state.loadInformation();
  }
  void update_pagepanier(){
    state.update_pageproduit();
  }
}


class _PanierState extends State<Panier> {

  int _nbreproduit = 0;
  List articles_panier = [];
  bool pagepanier = false;

  void add_nbreproduit(){
    setState(() {
      _nbreproduit++;
    });
  }

  loadInformation() async{
    articles_panier = [];
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      articles_panier = jsonDecode(prefs.getString("art").toString());
      _nbreproduit = articles_panier.length;
    });
  }

  void update_pageproduit(){
    pagepanier = !pagepanier;
  }

  @override
  void initState() {
    super.initState();
    loadInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: IconButton(
                onPressed: (){

                  try {
                    pagepanier ? null : Navigator.pushNamed(context, "/panier").then(
                      loadInformation()
                    );
                  } catch (e){
                    print("Adigban");
                  }
                },
                icon: Icon(Icons.shopping_cart_outlined),
              iconSize: 35,
            )
        ),
        Positioned(
          left: 25,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Text("$_nbreproduit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)),
          ),
        )
      ],
    );
  }
}
