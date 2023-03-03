import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Produit.dart';
import '../widgets/myDrawer.dart';
import '../widgets/panier.dart';

class PagePanier extends StatefulWidget {
  const PagePanier({Key? key}) : super(key: key);

  @override
  State<PagePanier> createState() => _PagePanierState();
}

class _PagePanierState extends State<PagePanier> {

  var panier = Panier();

  List maps = [];
  List<Produit> articles_panier = [];

  _save_data(a) async{
    final prefs = await SharedPreferences.getInstance();
    final jsonData = jsonEncode(a);
    prefs.setString("art", jsonData);
    panier.update_nbreproduit();
  }

  _load_data() async{
    articles_panier = [];
    panier.update_pagepanier();
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      maps = jsonDecode(prefs.getString("art").toString());
    });
    if (maps.length > 0) {
      maps.forEach((produitMap) {return articles_panier.add(Produit.fromMap(produitMap));});
    }
  }

  @override
  void initState(){
    super.initState();
    _load_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Mon Panier",style: TextStyle(fontSize: 16),),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.account_circle)
          ),
          panier,
        ],
      ),
      drawer: myDrawer(),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(67,33,96, 1),
            ),
            width: MediaQuery.of(context).size.width,
            child: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 92
              ),
              margin: EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back,size: 35,),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(child: Text("Total : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                        Text("150000 FCFA",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    ListView.builder(
                      itemCount: articles_panier.length,
                      itemBuilder: (BuildContext ctx, index){
                        return Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                          ),
                          child: Row(
                            children: [
                              Card(
                                child: Image.asset(articles_panier[index].image_url,height: 92,width: 92,),
                                elevation: 3,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(articles_panier[index].nom,style: TextStyle(fontSize: 15)),
                                    Text("Prix : "+articles_panier[index].prix.toString()+" FCFA",style: TextStyle(fontSize: 15)),
                                    ElevatedButton(
                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                                      onPressed: (){
                                        /*articles_panier.removeAt(index);
                                        _save_data(articles_panier); 
                                        _load_data();
                                        _save_data(articles_panier);*/
                                        articles_panier[index].supprimer_du_panier(index);
                                        _load_data();
                                        panier.update_nbreproduit();
                                      },
                                      child: Text('Supprimer',style: TextStyle(color: Colors.white,fontSize: 13),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ]
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:Padding(
        padding: EdgeInsets.only(left: 45,right: 45,bottom: 10),
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(255, 87, 33, 1))),
          onPressed: (){
            Navigator.pushNamed(context, '/payement');
          },
          child: Text('Continuer',style: TextStyle(color: Colors.white,fontSize: 15),),
        ),
      ),
    );
  }
}
