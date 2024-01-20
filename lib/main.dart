import 'package:ecombuy/firebase_options.dart';
import 'package:ecombuy/screens/cart_screen.dart';
import 'package:ecombuy/screens/catalog_screen.dart';
import 'package:ecombuy/screens/category_screen.dart';
import 'package:ecombuy/screens/checkout_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //Todo : add  your stripe publisher key

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CategoriesScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == '/categories') {
          return MaterialPageRoute(
              builder: (context) => const CategoriesScreen());
        }
        if (settings.name == '/cart') {
          return MaterialPageRoute(builder: (context) => const CartScreen());
        }
        if (settings.name == '/checkout') {
          return MaterialPageRoute(
              builder: (context) => const CheckOutScreen());
        }
        if (settings.name == '/catalog') {
          return MaterialPageRoute(builder: (context) => const CatalogScreen());
        } else {
          return MaterialPageRoute(
              builder: (context) => const CategoriesScreen());
        }
      },
    );
  }
}
