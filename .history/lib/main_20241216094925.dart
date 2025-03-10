import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'core/data/data_provider.dart';
import 'core/routes/app_pages.dart';
import 'screens/brands/provider/brand_provider.dart';
import 'screens/category/provider/category_provider.dart';
import 'screens/coupon_code/provider/coupon_code_provider.dart';
import 'screens/dashboard/provider/dash_board_provider.dart';
import 'screens/main/main_screen.dart';
import 'screens/main/provider/main_screen_provider.dart';
import 'screens/notification/provider/notification_provider.dart';
import 'screens/order/provider/order_provider.dart';
import 'screens/posters/provider/poster_provider.dart';
import 'screens/sub_category/provider/sub_category_provider.dart';
import 'screens/variants/provider/variant_provider.dart';
import 'screens/variants_type/provider/variant_type_provider.dart';
import 'utility/constants.dart';
import 'utility/extensions.dart';

Integrating a Flutter Windows app with Firebase involves several steps. While Firebase does not yet have native support for Windows in all services, you can integrate certain functionalities via REST APIs or third-party packages. Here's how to add Firebase to your Flutter Windows app:

1. Add Firebase to Your Flutter Project
a. Set Up Firebase Project
Go to the Firebase Console.
Create a new project (or use an existing one).
Add a new app:
Firebase does not directly support Windows as a platform, so select Web as the platform.
Provide an app nickname.
Register the app.
b. Obtain Firebase Configuration
After registering the app, you’ll see Firebase SDK configuration settings.
Copy the firebaseConfig object:
javascript
Copy code
const firebaseConfig = {
  apiKey: "your-api-key",
  authDomain: "your-app.firebaseapp.com",
  projectId: "your-project-id",
  storageBucket: "your-project.appspot.com",
  messagingSenderId: "your-sender-id",
  appId: "your-app-id"
};
2. Add Firebase Plugins to Your Flutter Project
Update your pubspec.yaml with Firebase plugins:

yaml
Copy code
dependencies:
  firebase_core: ^2.16.0
  firebase_auth: ^4.6.1   # For authentication
  cloud_firestore: ^5.5.2 # For Firestore
  firebase_storage: ^11.1.0 # For file storage
Run flutter pub get to install the dependencies.

3. Initialize Firebase in Your Flutter Windows App
a. Update the main.dart
Use the firebase_core package to initialize Firebase in your app:

dart
Copy code
import 'package:firebase_core/firebase_core.dart';

// C:\Program Files (x86)\Java\jre-1.8\bin

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


   await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "your-api-key",
      authDomain: "your-app.firebaseapp.com",
      projectId: "your-project-id",
      storageBucket: "your-project.appspot.com",
      messagingSenderId: "your-sender-id",
      appId: "your-app-id",
    ),
  );





  // Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyBMONNFX5RVoLr0lJDqFZGiGhVc_RLRSrk",
  authDomain: "ecom-457de.firebaseapp.com",
  projectId: "ecom-457de",
  storageBucket: "ecom-457de.appspot.com",
  messagingSenderId: "249056093429",
  appId: "1:249056093429:web:c7ac64fcfeb0386857d1bc"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);














  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => DataProvider()),
    ChangeNotifierProvider(create: (context) => MainScreenProvider()),
    ChangeNotifierProvider(create: (context) => CategoryProvider(context.dataProvider)),
    ChangeNotifierProvider(create: (context) => SubCategoryProvider(context.dataProvider)),
    ChangeNotifierProvider(create: (context) => BrandProvider(context.dataProvider)),
    ChangeNotifierProvider(create: (context) => VariantsTypeProvider(context.dataProvider)),
    ChangeNotifierProvider(create: (context) => VariantsProvider(context.dataProvider)),
    ChangeNotifierProvider(create: (context) => DashBoardProvider(context.dataProvider)),
    ChangeNotifierProvider(create: (context) => CouponCodeProvider(context.dataProvider)),
    ChangeNotifierProvider(create: (context) => PosterProvider(context.dataProvider)),
    ChangeNotifierProvider(create: (context) => OrderProvider(context.dataProvider)),
    ChangeNotifierProvider(create: (context) => NotificationProvider(context.dataProvider)),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      initialRoute: AppPages.HOME,
      unknownRoute: GetPage(name: '/notFount', page: () => MainScreen()),
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
    );
  }
}
