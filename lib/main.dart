import 'package:booking_app/utilities/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialDependencies();
  runApp(GetMaterialApp(
    title: "Application",
    initialRoute: AppPages.INITIAL,
    debugShowCheckedModeBanner: false,
    getPages: AppPages.routes,
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: bgColor,
      canvasColor: secondaryColor,
    ),
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      FormBuilderLocalizations.delegate,
    ],
  ));
}

///
Future<void> initialDependencies() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDl92DlDVuKJi0be2i5UWgSvbgcXBIawSs",
            authDomain: "booking-application-f5f76.firebaseapp.com",
            projectId: "booking-application-f5f76",
            storageBucket: "booking-application-f5f76.appspot.com",
            messagingSenderId: "264166330046",
            appId: "1:264166330046:web:a1669fd57e88d58a5f98ef",
            measurementId: "G-D2KCZMRZQ0"));
  } else {
    await Firebase.initializeApp();
  }
}
