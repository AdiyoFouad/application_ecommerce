import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services/Produit_Services.dart';
import '../models/Produit.dart';
import '../widgets/panier.dart';

class PageProduit extends StatefulWidget {
  final int idpage;

  const PageProduit({Key? key, required this.idpage}) : super(key: key);

  @override
  State<PageProduit> createState() => _PageProduitState(idpage);
}

class _PageProduitState extends State<PageProduit> {
  _PageProduitState(this.id_page);

  var panier = Panier();
  int id_page = 0;
  final List<Map<String,dynamic>> infopage = [
    {
      'nom' : 'Vêtements',
    },
    {
      'nom' : 'Cosmétique',
    },
    {
      'nom' : 'Appareils électronique',
    },
    {
      'nom' : 'Cuisine',
    },
    {
      'nom' : 'Santé',
    },
  ];

  final List<Produit> articles = [
    Produit("Robe Femme", 20000, "assets/images/catcosm.jpg"),
    Produit("Robe Homme", 20000, "assets/images/catcosm.jpg"),
    Produit("Robe", 20000, "assets/images/catcosm.jpg"),
    Produit("Robe Femme", 920000, "assets/images/catcosm.jpg"),
    Produit("Robe Fee", 20000, "assets/images/catcosm.jpg"),
    Produit("Robe me", 20000, "assets/images/catcosm.jpg"),
    Produit("Robe Fme", 20000, "assets/images/catcosm.jpg"),
  ];

  List<Produit> articles_panier = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text("dede"),
        onPressed: (){
          ProduitServices.get();
        },
      ),
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.account_circle)
          ),
          panier,

        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(67,33,96, 1),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width - 45,
              height: MediaQuery.of(context).orientation == Orientation.portrait ? 40 : 5 ,
              child: TextField(
                  style: TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: 'Rechercher vos articles, produits',
                      hintStyle: TextStyle(),
                      border: InputBorder.none
                  )
              ),
            ),
            Divider(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    color: Colors.white
                ),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 8,),
                      Text(infopage[id_page]['nom'],style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20
                        ),
                        itemCount: articles.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext ctx,index){
                          return Stack(
                            fit: StackFit.passthrough,
                            children: [
                              Positioned(
                                top:90,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                  ),
                                  padding: EdgeInsets.only(left: 5),
                                  width: 165,
                                  height: 170,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 55,),
                                      Text(articles[index].nom,style: TextStyle(fontSize: 15),),
                                      Text("Prix: "+ articles[index].prix.toString() + " FCFA",style: TextStyle(fontSize: 14),),
                                      ElevatedButton(
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(255, 87, 33, 1)),fixedSize: MaterialStateProperty.all(Size.fromWidth(100))),
                                        onPressed: (){
                                          articles[index].ajout_au_panier();
                                          panier.update_nbreproduit();
                                        },
                                        child: Text('Ajouter',style: TextStyle(color: Colors.white,fontSize: 14),),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 13,
                                child: Card(
                                  child: Image.asset(articles[index].image_url,height: 135,width: 130,fit: BoxFit.cover,),
                                  elevation: 5,
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),


    );
  }
}
