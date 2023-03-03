import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/Produit.dart';
import '../widgets/myDrawer.dart';
import '../widgets/panier.dart';

class PageCategory extends StatefulWidget {
  const PageCategory({Key? key}) : super(key: key);

  @override
  State<PageCategory> createState() => _PageCategoryState();
}

class _PageCategoryState extends State<PageCategory> {


  var panier = Panier();

  List<Map<String,dynamic>> categories = [
    {
      'id' : 0,
      'path_to_file':"assets/images/catvet.jpg",
      'nom' : 'Vêtement',
    },
    {
      'id' : 1,
      'path_to_file':"assets/images/catcosm.jpg",
      'nom' : 'Cosmétique',
    },
    {
      'id' : 2,
      'path_to_file':"assets/images/catappE.jpg",
      'nom' : 'Appareil électronique',
    },
    {
      'id' : 3,
      'path_to_file':"assets/images/cuisine.jpg",
      'nom' : 'Cuisine',
    },
    {
      'id' : 4,
      'path_to_file':"assets/images/sante.jpg",
      'nom' : 'Santé',
    },
  ];

  final List<Produit> articles_panier = [
    Produit("Robe Femme", 20000, "assets/images/catcosm.jpg"),
    Produit("Robe Femme", 20000, "assets/images/catcosm.jpg"),
    Produit("Robe Homme", 20000, "assets/images/catcosm.jpg"),
    Produit("Robe", 20000, "assets/images/catcosm.jpg"),
    Produit("Robe Femme", 920000, "assets/images/catcosm.jpg"),
    Produit("Robe Fee", 20000, "assets/images/catcosm.jpg"),
    Produit("Robe me", 20000, "assets/images/catcosm.jpg"),
  ];


  _save_data() async{
    final prefs = await SharedPreferences.getInstance();
    final jsonData = jsonEncode(articles_panier);
    prefs.setString("art", jsonData);
    panier.update_nbreproduit();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: myDrawer(),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed:(){
          _save_data();
        },
      ),
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text("BIENVENUE"),
        ),
        actions: [
          panier
        ],
      ),

      body:  ListView(
        children: [
          Container(

            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromRGBO(67,33,96, 1),
            ),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 25,),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Sélectionner une catégorie\nd'article",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,)
                        )
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context,index){
                        return Column(
                          children: [
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                Card(
                                  child: Image.asset(categories[index]['path_to_file'],height: 150,width: 150,fit: BoxFit.fill,),
                                  elevation: 3,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(255, 87, 33, 1)),fixedSize: MaterialStateProperty.all(Size.fromWidth(180))),
                                  onPressed: (){
                                    /*articles_panier.add(Produit("Robe me", 20000, "assets/images/catcosm.jpg"),);
                                    _save_data();*/
                                    Navigator.pushNamed(context, '/produit',arguments: categories[index]['id']);
                                  },
                                  child: Text(categories[index]['nom'],style: TextStyle(color: Colors.white,fontSize: 11),),
                                )
                              ],
                            ),
                          ],
                        );
                      },
                      itemCount: categories.length,
                    ),
                  ],
                ),
            ),
          ),
        ],
      )

    );
  }
}
