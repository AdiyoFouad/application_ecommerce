import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/myDrawer.dart';

class PageValiderPaye extends StatefulWidget {
  const PageValiderPaye({Key? key}) : super(key: key);

  @override
  State<PageValiderPaye> createState() => _PageValiderPayeState();
}

class _PageValiderPayeState extends State<PageValiderPaye> {

  int selected_value = 0;
  String _firstname = "";
  String _lastname = "";
  String _profession  = "";
  bool _load = false;

  _loadInformation() async{
    final prefs = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        _load = true;
      });
    });
    setState(() {
      _firstname = prefs.getString("_firstname") ?? "";
      _lastname = prefs.getString("_lastname") ?? "";
      _profession = prefs.getString("_profession") ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    _loadInformation();
    //WidgetsBinding.instance!.addPostFrameCallback((_)=>_loadInformation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Payement",style: TextStyle(fontSize: 16),),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.account_circle)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.shopping_cart_outlined)
          ),
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
                  minHeight: MediaQuery.of(context).size.height - 147
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
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,right:8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(child: Text("Total : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                                Text("150000 FCFA",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("Méthode de payement",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            SizedBox(height: 35,),
                            Container(
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/paiement/mtn_momo.jpg",),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.format_list_numbered_outlined),
                                hintText: 'Numéro de téléphone',
                                hintStyle: TextStyle(fontSize: 13)
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*1/6,),
                            Text("Votre adresse pour la livraison",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            SizedBox(height: 12,),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Pays',
                                  hintStyle: TextStyle(fontSize: 13)
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Ville',
                                  hintStyle: TextStyle(fontSize: 13)
                              ),
                            ),
                          ],
                        ),

                      ),
                      SizedBox(height: 15,),
                      Text('Informations'),
                      Text('Nom : $_firstname')
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
            Navigator.pushNamed(context, '/paiementmobile',);
          },
          child: Text('Payer',style: TextStyle(color: Colors.white,fontSize: 15),),
        ),
      ),
    );
  }
}
