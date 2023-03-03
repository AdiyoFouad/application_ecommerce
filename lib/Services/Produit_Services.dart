
import 'package:application_ecommerce/ui/models/Produit.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'dart:convert';

Future apicall() async {
  http.get(Uri.parse(Constants().Base_URL+'/api/v1/product/categories/{category}'));
}

  Produit produit = new Produit("Codjo", 0, "SANTE") ;

class  ProduitServices{
  static /*Future<List<Produit>>*/ get () async{
    http.Response response;
    response = await http.get(Uri.parse(Constants().Base_URL+'/api/v1/product/categories/CUISINE'));
    print(response.body);
  }
  
  static /*Future<List<Produit>> */create () async{
    try{
      String prod= jsonEncode(produit.toJson());
      http.Response response;
      print(1);
      response =await http.post(Uri.parse(Constants().Base_URL+'/api/v1/product/save'),
          headers: {
            "content-type" : "application/json",
            "accept" : "application/json",
          },
          body:prod);

      print(response.statusCode);
      final responseData = jsonDecode(response.body) as Map<String,dynamic>;

      return responseData['message'];
    }
    catch (error) {
      rethrow;
    }

  }
}