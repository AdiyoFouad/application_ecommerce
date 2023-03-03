import 'package:flutter/material.dart';

import '../connection_inscription.dart';
import 'package:firebase_auth/firebase_auth.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(67,33,96, 1),
      child: ListView(
        children: [
          Container(
            height: 200,
            child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/catappE.jpg"),
                    ),
                    SizedBox( height: 8),
                    Text("ODJOUOYE Fouad",style: TextStyle(fontSize: 14,color: Colors.white),),
                    SizedBox( height: 5),
                    Text("odjfouad38@gmail.com",style: TextStyle(fontSize: 14,color: Colors.white),),
                  ],
                )
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 235,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
              color: Colors.white,
            ),
            child: Wrap(
              runSpacing: 10,
              children: [
                ListTile(
                  title: GestureDetector(
                    child: Text('Accueil',style:TextStyle(fontSize: 14),),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                  leading: Icon(Icons.home_outlined),
                  minLeadingWidth: 15,
                ),
                ListTile(
                  title: GestureDetector(
                    child: Text('Mon compte',style:TextStyle(fontSize: 14),),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/compte');
                    },
                  ),
                  leading: Icon(Icons.person_outline),
                  minLeadingWidth: 15,
                ),
                ListTile(
                  title: GestureDetector(
                    child: Row(
                      children: [
                        Expanded(child: Text('Mes messages')),
                        Text("34")
                      ],
                    ),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/message');
                    },
                  ),
                  leading: Icon(Icons.chat_outlined),
                  minLeadingWidth: 15,
                ),
                ListTile(
                  title: GestureDetector(
                    child: Text('Déconnexion',style:TextStyle(fontSize: 14),),
                    onTap: (){
                      print(1);
                      FirebaseAuth.instance
                          .signOut()
                          .then((value){
                        print("Utilisateur déconnecté");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (contect) => const connectionInscriptionPages()));
                      }).onError((error, stackTrace)  {
                        print("Error ${error.toString()}");
                      });
                      print(2);
                    },
                  ),
                  leading: Icon(Icons.logout_outlined),
                  minLeadingWidth: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
