import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'service.dart';

class CreateProduit extends StatefulWidget {
  const CreateProduit({Key? key}) : super(key: key);

  @override
  State<CreateProduit> createState() => _CreateProduitState();
}

class _CreateProduitState extends State<CreateProduit> {

  final formkey = new GlobalKey<FormState>() ;

  final _nomController = TextEditingController();
  final _prixController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categorieController = TextEditingController();
  Service service = Service();

  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget _buildImage() {
    if (_image == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Text(_image!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nomController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      suffixIcon:Icon(Icons.mail_lock_outlined) ,
                      labelText: "Nom",
                      hintText: "Entrez votre mail"
                  ),
                  validator: (String? value){
                    return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                  },
                ),
                TextFormField(
                  controller: _prixController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      suffixIcon:Icon(Icons.mail_lock_outlined) ,
                      labelText: "Prix",
                      hintText: "Entrez votre mail"
                  ),
                  validator: (String? value){
                    return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      suffixIcon:Icon(Icons.mail_lock_outlined) ,
                      labelText: "Description",
                      hintText: "Entrez votre mail"
                  ),
                  validator: (String? value){
                    return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                  },
                ),
                TextFormField(
                  controller: _categorieController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      suffixIcon:Icon(Icons.mail_lock_outlined) ,
                      labelText: "Catégorie",
                      hintText: "Entrez votre mail"
                  ),
                  validator: (String? value){
                    return(value == null || value == "")? "Ce champ est obligatoire" : null ;
                  },
                ),
                Container(
                    child: ElevatedButton(
                        onPressed: getImage,
                        child: _buildImage())),
                Container(
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            Map<String, String> body = {
                              };
                            service.addImage(body, _image!.path);
                            Navigator.pop(context);}},
                        child: Text('Save',
                            style: TextStyle(color: Colors.white)),
                        )],
                  ),
                )
              ],
            )
          ),
        ],
      )
    );
  }
}
