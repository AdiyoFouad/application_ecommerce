

import 'package:flutter/material.dart';
import '../widgets/panier.dart';


class PageMessage extends StatefulWidget {
  const PageMessage({Key? key}) : super(key: key);

  @override
  State<PageMessage> createState() => _PageMessageState();
}

class _PageMessageState extends State<PageMessage> {

  var panier = Panier();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text("Mes notifications"),
        ),  actions: [
        IconButton(
            onPressed: (){},
            icon: Icon(Icons.message)
        ),
        panier
      ],
      ),

      body:  SingleChildScrollView(
        child: Center(
          child: Text("Mes notifications"),
        ),
      ),
    );
  }
}
