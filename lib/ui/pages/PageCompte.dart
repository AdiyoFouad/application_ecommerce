import 'package:flutter/material.dart';
import '../widgets/myDrawer.dart';
import '../widgets/panier.dart';

class PageCompte extends StatefulWidget {
  const PageCompte({Key? key}) : super(key: key);

  @override
  State<PageCompte> createState() => _PageCompteState();
}

class _PageCompteState extends State<PageCompte> {

  final _formkey = GlobalKey<FormState>() ;

  final _profilController = TextEditingController();
  final _mdpController = TextEditingController();
  final _carticleController = TextEditingController();
  var panier = Panier();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text("Mon compte"),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.account_circle)
          ),
          panier
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width:MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height/3.5 ,
                color: Color.fromRGBO(67, 33, 96, 1),
                child:  CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/images/Vetement/dinh-ng-jYz3EGBhDpk-unsplash.jpg'),
                  // autres propriétés de CircleAvatar ici
                ),
            ),
            Container(
              color: Color.fromRGBO(67, 33, 96, 1),
              child:  Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(20.0),
                width:MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child:Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            TextFormField(
                              controller: _profilController,
                              keyboardType: TextInputType.text,
                              decoration:  InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  suffixIcon:Icon(Icons.mail_lock_outlined) ,
                                  labelText: "Modifier le profil",
                                  hintText: "Entrez votre mail"
                              ),
                              autofocus: false,
                              /*validator: (String? value){
                                    return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                                  },*/
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                controller: _carticleController,
                                keyboardType: TextInputType.text,
                                decoration:  InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(color: Colors.black)
                                    ),
                                    labelText: "Consulter mes articles",
                                    hintText: "Entrez votre mot de passe",
                                    suffixIcon: Icon(Icons.lock_clock_outlined)
                                ),
                                /*  validator: (String? value){
                                    return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                                  },*/
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15.0),
                              child: TextFormField(
                                controller: _mdpController,
                                keyboardType: TextInputType.text,
                                decoration:  InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(color: Colors.black)
                                    ),
                                    labelText: "Changer le mot de passe",
                                    hintText: "Changer le mot de passe",
                                    suffixIcon: Icon(Icons.lock_clock_outlined)
                                ),
                                /*  validator: (String? value){
                                    return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                                  },*/
                              ),
                            ),


                          ],
                        ),
                      ) ,
                    ),




                  ],
                ),
            )
            )],
        ),

      )
    );
  }
}
