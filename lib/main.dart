//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'view/screens/cart_screen.dart';
import 'view/screens/my_orders_screen.dart';
import 'view/screens/splash_screen.dart';
import 'viewmodel/food_viewmodel.dart';
import 'view/screens/signup_screen.dart';
import 'view/screens/login_screen.dart';
import 'view/screens/home_screen.dart';
import 'viewmodel/auth_viewmodel.dart';
import 'viewmodel/cart_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBOyjYF-cTbpXoGwTCwYeyr4_hCG1Z-k9s",
        authDomain: "mealio-5f2c6.firebaseapp.com",
        projectId: "mealio-5f2c6",
        storageBucket: "mealio-5f2c6.firebasestorage.app",
        messagingSenderId: "1037748606443",
        appId: "1:1037748606443:web:99d6d04849ef9fec16f5ae",
        measurementId: "G-S0HNBPS2YZ"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => FoodViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mealio',
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashScreen(), // Splash screen as the initial route
          '/signup': (_) => SignupScreen(),
          '/login': (_) => LoginScreen(),
          '/home': (_) => const HomeScreen(),
          '/cart': (_) => const CartScreen(),
          '/myorders': (_) => const MyOrdersScreen(),
        },
      ),
    );
  }
}