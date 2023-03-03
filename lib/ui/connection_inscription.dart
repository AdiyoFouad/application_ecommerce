import 'package:application_ecommerce/build_images.dart';
import 'package:application_ecommerce/ui/widgets/connection.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'pages/PageCategory.dart';

class connectionInscriptionPages extends StatefulWidget {
  const connectionInscriptionPages({Key? key}) : super(key: key);

  @override
  State<connectionInscriptionPages> createState() => _connectionInscriptionPages();
}

class _connectionInscriptionPages extends State<connectionInscriptionPages> {
  final _formkey = GlobalKey<FormState>() ;

  final _emailController = TextEditingController();
  final _mdpController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget> [
                Container(
                    width:MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height/2.9 ,
                    color: Color.fromRGBO(67, 33, 96, 1),
                    child:   const BuildImages(image: 'assets/images/logo_transparent.png',
                    )
                ),
                Container(
                  color: Color.fromRGBO(67, 33, 96, 1),
                  child:  Container(
                    padding: EdgeInsets.all(20.0),
                    width:MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height/1.5 ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child:Column(
                      children: [
                        Container(
                          child:Form(
                            key: _formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black)
                                      ),
                                      suffixIcon:Icon(Icons.mail_lock_outlined) ,
                                      labelText: "E-mail",
                                      hintText: "Entrez votre mail"
                                  ),
                                  /*validator: (String? value){
                                    return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                                  },*/
                                ),
                                TextFormField(
                                  controller: _mdpController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black)
                                      ),
                                      labelText: "Mot de passe",
                                      hintText: "Entrez votre mot de passe",
                                      suffixIcon: Icon(Icons.lock_clock_outlined)
                                  ),
                                /*  validator: (String? value){
                                    return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                                  },*/
                                )
                              ],
                            ),
                          ) ,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 35.0),
                          child:ElevatedButton(
                              style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                              ),
                                  primary: Color.fromRGBO(255, 87, 34, 1),
                              minimumSize: Size(MediaQuery.of(context).size.width /0.5,50.0)),

                              onPressed: (){
                                if(_formkey.currentState!.validate()){
                                  print(1);
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _mdpController.text)
                                      .then((value){
                                    print("Connexion réussie");
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (contect) => const PageCategory()));
                                  }).onError((error, stackTrace)  {
                                    print("Error ${error.toString()}");
                                  });
                                  print(2);


                                }
                              },
                              child: Text("Connecter",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              )) ,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 35.0),
                          child:  TextButton(
                              child:  Text(
                                'S\'inscrire' ,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context, "inscription");
                              }
                          ) ,

                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child:  TextButton(
                              child:  Text(
                                'Mot de passe oublié ?' ,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context, "mdpforget");
                              }
                          ) ,

                        ),

                      ],
                    )
                  ),
                )
                ,



              ],
            ),
          )


      ),
    );
  }
}
