import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/mentors_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalift Mentors',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.iconColorLight), // Default AppBar icons
          titleTextStyle: GoogleFonts.inter(
            color: AppColors.textColorLight, 
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          background: AppColors.backgroundColor,
        ),
        useMaterial3: true,
      ),
      home: const MentorsScreen(),
    );
  }
}
