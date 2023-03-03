import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../build_images.dart';
import '../pages/PageCategory.dart';

class connexionPages extends StatefulWidget {
  const connexionPages({Key? key}) : super(key: key);

  @override
  State<connexionPages> createState() => _connexionPagesState();
}

class _connexionPagesState extends State<connexionPages> {

  final formkey = new GlobalKey<FormState>() ;

  final _emailController = TextEditingController();
  final _mdpController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:SingleChildScrollView(
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
                    children:[

                      Form(
                        key: formkey,
                        child: Column(
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
                                    validator: (String? value){
                                    return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                                  },
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
                                     validator: (String? value){
                                    return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                                  },
                                  )
                          ],
                        ),
                      ) ,
                      Container(
                        margin: EdgeInsets.only(top: 35.0),
                        child:ElevatedButton(
                            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                                primary: Color.fromRGBO(255, 87, 34, 1),
                                minimumSize: Size(MediaQuery.of(context).size.width /0.5,50.0)),

                            onPressed: (){
                              if(formkey.currentState!.validate()){


                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (contect) => const PageCategory()));

                              }
                            },
                            child: Text("Connecter",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            )) ,
                      ),


                    ],
                  )
              ),
            )
            ,



          ],
        ),
      ),
    );
  }
}
