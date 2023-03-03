import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../build_images.dart';
import '../connection_inscription.dart';
import 'connection.dart';


class inscriptionPages extends StatefulWidget {
  const inscriptionPages({Key? key}) : super(key: key);

  @override
  State<inscriptionPages> createState() => _inscriptionPages();
}

class _inscriptionPages extends State<inscriptionPages> {
  bool invisible = true;
  final _formkey = GlobalKey<FormState>() ;
  final _firstnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _mdpController = TextEditingController();
  final _cmdpController = TextEditingController();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
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
                      height:MediaQuery.of(context).size.height/1.10 ,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child:Column(
                        children: <Widget> [
                          Container(
                            child:Form(
                              key: _formkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        suffixIcon:Icon(Icons.mail_lock_outlined) ,
                                        labelText: "E-mail",
                                        hintText: "Entrez votre mail"
                                    ),
                                    validator: (String? value){
                                      return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _firstnameController,
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        labelText: "Nom",
                                        hintText: "Entrez votre nom",
                                        suffixIcon: Icon(Icons.person)
                                    ),
                                    validator: (String? value){
                                      return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _lastnameController,
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        suffixIcon:Icon(Icons.person_add) ,
                                        labelText: "Prenom",
                                        hintText: "Entrez votre prenom"
                                    ),
                                    validator: (String? value){
                                      return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _mdpController,
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        labelText: "Mot de passe",
                                        hintText: "Entrez votre mot de passe",
                                        suffixIcon: Icon(Icons.lock_clock_outlined)
                                    ),
                                    validator: (String? value){
                                      return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _cmdpController,
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        labelText: "Confirmer le mot de passe",
                                        hintText: "Confirmer votre mot de passe",
                                        suffixIcon: Icon(Icons.lock_clock_outlined)
                                    ),
                                    validator: (String? value){
                                      if (value == null || value == ""){
                                        return "Ce champ est obligatoire";
                                      }
                                      else if(value != _mdpController.text){
                                        return "Veuiilez entrez des mots de passe identiques";
                                      }
                                      return null;
                                    },
                                  )

                                ],
                              ),
                            ) ,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25.0),
                            child:ElevatedButton(
                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                    primary: Color.fromRGBO(255, 87, 34, 1),
                                    minimumSize: Size(MediaQuery.of(context).size.width /0.5,50.0)),

                                onPressed: (){
                                  if(_formkey.currentState!.validate()){
                                    print(1);
                                    FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _mdpController.text)
                                        .then((value){
                                      print("Created new account");
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (contect) => const connectionInscriptionPages()));
                                    }).onError((error, stackTrace)  {
                                      print("Error ${error.toString()}");
                                    });
                                    print(2);

                                  }
                                },
                                child: Text("S'inscrire",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                )) ,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child:  TextButton(
                                child:  Text(
                                  'Vous avez déjà un compte ?' ,
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
                                  Navigator.pushNamed(context, "connecter");
                                }
                            ) ,

                          )



                        ],
                      )
                  ),
                ),





              ],
            )
          ,
        ),
  );
  }
}
