import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musify/controller/providers/artists_provider.dart';
import 'package:musify/core/router.dart';
import 'package:provider/provider.dart';

void main()async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    AppRouter router = AppRouter();
    return ChangeNotifierProvider<ArtistsProvider>(
      create: (context) => ArtistsProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textTheme: TextTheme(
              bodyLarge:
                  GoogleFonts.ubuntu(fontSize: 22, fontWeight: FontWeight.bold),
              bodySmall:
                  GoogleFonts.ubuntu(fontSize: 14, fontWeight: FontWeight.w500),
              bodyMedium:
                  GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.bold),
              titleSmall: GoogleFonts.ubuntu(
                fontSize: 12,
              ),
            ).apply(
              bodyColor: const Color.fromARGB(255, 246, 244, 245),
              displayColor: const Color.fromARGB(255, 246, 244, 245),
            ),
          ),
          onGenerateRoute: router.onGenerateRoute),
    );
  }
}
