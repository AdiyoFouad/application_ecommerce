import 'package:application_ecommerce/ui/widgets/connection.dart';
import 'package:flutter/material.dart';

import '../../build_images.dart';

class mdpForgetPages extends StatefulWidget {
  const mdpForgetPages({Key? key}) : super(key: key);

  @override
  State<mdpForgetPages> createState() => _mdpForgetPages();
}

class _mdpForgetPages extends State<mdpForgetPages> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>() ;

    final _emailController = TextEditingController();
    final _mdpController = TextEditingController();
    final _cmdpController = TextEditingController();
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
                        children: <Widget> [
                          Container(
                            child:Form(
                              key: _formkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget> [
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
                                        labelText: "Nouveau mot de passe",
                                        hintText: "Entrez votre nouveau mot de passe",
                                        suffixIcon: Icon(Icons.lock_clock_outlined)
                                    ),
                                    /*  validator: (String? value){
                                    return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                                  },*/
                                  ),
                                  TextFormField(
                                    controller: _cmdpController,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        labelText: "Confirmer mot de passe",
                                        hintText: "confirmer votre mot de passe",
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
                            margin: EdgeInsets.only(top: 35.0),
                            child:ElevatedButton(
                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                    primary: Color.fromRGBO(255, 87, 34, 1),
                                    minimumSize: Size(MediaQuery.of(context).size.width /0.5,50.0)),

                                onPressed: (){
                                  if(_formkey.currentState!.validate()){

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (contect) => const connexionPages()));

                                  }
                                },
                                child: Text("Confirmer",
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
