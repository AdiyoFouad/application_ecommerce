import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Produit {
  late int id ;
  late String nom="zereer";
  late int prix=02;
  late String image_url ="";
  late String description = "dft";
  late  String categorie="CUISINE" ;




  Produit(this.nom,this.prix,this.image_url);

  Produit.fromJson(Map<String,dynamic> json) : id = json['id'],nom = json['name'], prix = json['price'], image_url = json['image'],description = json['description'],categorie = json['category'];

  Produit.fromMap(dynamic map){
    id=map['id'];
    nom = map['name'];
    prix = map['price'];
    description = map['description'];
    categorie = map['category'];
  }

  Map<String,dynamic> toJson(){
    return {
      'name': nom,
      'price':prix,
      'image':image_url,
      'description':description,
      'category':categorie
    };
  }

  supprimer_du_panier(int index) async{
    List maps = [];
    List articles_panier = [];
    final prefs = await SharedPreferences.getInstance();
    maps = jsonDecode(prefs.getString("art").toString());
    if (maps.length > 0) {
      maps.forEach((produitMap) {return articles_panier.add(Produit.fromMap(produitMap));});
    }
    print(articles_panier.length);
    articles_panier.removeAt(index);
    print(articles_panier.length);
    final jsonData = jsonEncode(articles_panier);
    prefs.setString("art", jsonData);
  }

  ajout_au_panier() async{
    List maps = [];
    List articles_panier = [];
    final prefs = await SharedPreferences.getInstance();
    maps = jsonDecode(prefs.getString("art").toString());
    if (maps.length > 0) {
      maps.forEach((produitMap) {return articles_panier.add(Produit.fromMap(produitMap));});
    }
    articles_panier.add(this);
    final jsonData = jsonEncode(articles_panier);
    prefs.setString("art", jsonData);
  }

}