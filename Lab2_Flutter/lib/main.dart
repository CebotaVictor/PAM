import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/presentation/features/doctor_profile/bindings/profile_bindings.dart';
import 'package:presentation/presentation/features/doctor_profile/pages/details_page.dart';
import 'package:presentation/presentation/features/home/bindings/home_binding.dart';
import 'package:presentation/presentation/features/home/pages/main_page.dart';
import 'package:presentation/presentation/navigation/app_rutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Doctor Appointment App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      
      // 1. Set the initial route
      initialRoute: AppRoutes.home,
      
      // 2. Define your pages and link them to their Bindings
      getPages: [
        GetPage(
          name: AppRoutes.home,
          page: () => const MyHomePage(title: 'Home'),
          binding: HomeBinding(), // <--- INJECTS MainController & Use Cases
        ),
        GetPage(
          name: AppRoutes.details,
          page: () => const DetailsPage(title: 'Doctor Details'),
          binding: DetailsBinding(), // <--- INJECTS DetailsController & Use Cases
        ),
      ],
    );
  }
}