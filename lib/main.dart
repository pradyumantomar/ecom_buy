import 'package:db_client/db_client.dart';
import 'package:ecombuy/firebase_options.dart';
import 'package:ecombuy/models/cart.dart';
import 'package:ecombuy/repositories/cart_repository.dart';
import 'package:ecombuy/repositories/category_repository.dart';
import 'package:ecombuy/repositories/product_repository.dart';
import 'package:ecombuy/screens/cart_screen.dart';
import 'package:ecombuy/screens/catalog_screen.dart';
import 'package:ecombuy/screens/category_screen.dart';
import 'package:ecombuy/screens/checkout_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final dbClient = DbClient();
final categoryRepository = CategoryRepository(dbClient: dbClient);
final productRepository = ProductRepository(dbClient: dbClient);
final cartRepository = CartRepository();

const userId = 'user_1234';
var cart = const Cart(
  userId: userId,
  cartItems: [],
);

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
          return MaterialPageRoute(
              builder: (context) => CatalogScreen(
                    category: settings.arguments as String,
                  ));
        } else {
          return MaterialPageRoute(
              builder: (context) => const CategoriesScreen());
        }
      },
    );
  }
}
