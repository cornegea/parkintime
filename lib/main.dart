import 'package:flutter/material.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/halaman_home/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/history/historyscreen.dart'; // Tambahkan HistoryScreen
import 'screens/my_car/mycarscreen.dart'; // Tambahkan MyCarScreen
import 'screens/profil/profilescreen.dart'; // Tambahkan ProfileScreen


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ParkInTime',
      initialRoute: '/', // Halaman pertama yang dibuka (Splash Screen)
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/history': (context) => HistoryScreen(), // Tambahkan route History
        '/mycar': (context) => MyCarScreen(), // Tambahkan route MyCar
        '/profile': (context) => ProfileScreen(), // Tambahkan route Profile
      },
    );
  }
}
