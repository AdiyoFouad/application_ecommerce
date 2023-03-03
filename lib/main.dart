import 'package:application_ecommerce/build_images.dart';
import 'package:application_ecommerce/ui/connection_inscription.dart';
import 'package:application_ecommerce/ui/widgets/connection.dart';
import 'package:application_ecommerce/ui/widgets/inscription.dart';
import 'package:application_ecommerce/ui/widgets/mdpforget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'ui/models/create_produit.dart';
import 'ui/pages/PageCategory.dart';
import 'ui/pages/PageCompte.dart';
import 'ui/pages/PageMessage.dart';
import 'ui/pages/PageProduit.dart';
import 'ui/pages/PagePanier.dart';
import 'ui/pages/PagePayement.dart';
import 'ui/pages/PageValiderPaye.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "accueil",
      onGenerateRoute: (settings){
        return MaterialPageRoute(builder: (context){
          switch(settings.name){
            case "slides":
              return connectionInscriptionPages();
            case "accueil":
              return HomePage();
            case "inscription":
              return inscriptionPages();
            case "mdpforget":
              return mdpForgetPages();
            case "connecter":
              return connexionPages();
            case '/':
              return PageCategory();
            case '/produit':
              int args = int.parse(settings.arguments.toString());
              return PageProduit(idpage: args,);
            case '/panier':
              return PagePanier();
            case '/payement':
              return PagePayement();
            case '/validerpaye':
              return PageValiderPaye();
            case '/compte':
              return PageCompte();
            case '/message':
              return PageMessage();

            default:
              throw "Aucune page correspondante";
          }
        });
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color.fromRGBO(67,33,96, 1)),
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,

    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
              title: 'Bienvenue  sur Click e-achat!',
              body: "Transformez votre expérience utilisateur et découvrez une toute nouvelle façon d'interagir avec notre application depuis votre position ",
              image: const BuildImages(
                image: 'assets/images/click11.png',
              )
          ),
          PageViewModel(
              title: 'Trouver vos produits chez nous ',
              body: "Offrez-vous le meilleur de la qualité et de l\'innovation avec notre sélection de produits incontournables !",
              image:  const BuildImages(
                image: 'assets/images/Cosmétique/view_single_drawn_02.jpg',
              )
          ),
          PageViewModel(
              title: 'En 3 clics',
              body: "Découvrez dès maintenant notre gamme exceptionnelle qui saura répondre à tous vos besoins et attentes." ,
              image: const BuildImages(
                image: 'assets/images/Cosmétique/view_single_drawn_01.jpg',
              )
          ),
        ],
        next: Icon(Icons.arrow_forward),
        done: const  Text(
          'Demarrer',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),),
        onDone: () => goToHome(context),
        showSkipButton:true ,
        skip: const Text('Passer',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),),
        onSkip: () => goToHome(context),
        //  nextFlex: 0,
        // onSkip: () => print('skip'),
      ),
    );
  }

  void goToHome(context){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (contect) => const connectionInscriptionPages()));
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      pageColor:  Colors.blue,
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: 30
      ),
      bodyTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      imagePadding: EdgeInsets.all(24),
      titlePadding: EdgeInsets.zero,
      bodyPadding: EdgeInsets.all(24),

    );
  }

}
