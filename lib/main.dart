import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'models/simulation_state.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SimulationState()),
      ],
      child: const AgroBizApp(),
    ),
  );
}

class AgroBizApp extends StatelessWidget {
  const AgroBizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgroBiz Simulator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green, // Warna Tema Agro
          primary: Colors.green.shade700,
          secondary: Colors.orangeAccent,
          background: const Color(0xFFF5F9F5), // Light green tint
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(), // Modern Typography
        scaffoldBackgroundColor: const Color(0xFFF5F9F5),
      ),
      home: const HomeScreen(),
    );
  }
}
