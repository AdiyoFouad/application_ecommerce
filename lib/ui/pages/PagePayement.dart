import 'package:flutter/material.dart';

import '../widgets/myDrawer.dart';

class PagePayement extends StatefulWidget {
  const PagePayement({Key? key}) : super(key: key);

  @override
  State<PagePayement> createState() => _PagePayementState();
}

class _PagePayementState extends State<PagePayement> {

  int selected_value = 0;

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
                  minHeight: MediaQuery.of(context).size.height - 92
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
                        padding: const EdgeInsets.only(left:8.0),
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
                          ],
                        ),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                        ),
                        margin:EdgeInsets.only(left: MediaQuery.of(context).size.width/13,right: 15),
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/13,bottom: MediaQuery.of(context).size.width/13),
                        child: Column(
                          children: [
                            RadioListTile<int>(
                              value: 0,
                              groupValue: selected_value,
                              onChanged: (index){
                                setState(() {
                                  selected_value = 0;
                                });
                              },
                              title: Row(
                                children: [
                                  Container(
                                    width: 94,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/paiement/mtn_momo.jpg",),
                                        fit: BoxFit.fill
                                      )
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("MTN Momo",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            RadioListTile<int>(
                              value: 1,
                              groupValue: selected_value,
                              onChanged: (index){
                                setState(() {
                                  selected_value = 1;
                                });
                              },
                              title: Row(
                                children: [
                                  Container(
                                    width: 94,
                                    height: 64,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/paiement/moov_money.png",),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("Moov Money",style: TextStyle(fontSize: 14),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
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
            Navigator.pushNamed(context, '/validerpaye',);
          },
          child: Text('Continuer',style: TextStyle(color: Colors.white,fontSize: 15),),
        ),
      ),
    );
  }
}
