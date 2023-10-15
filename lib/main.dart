import 'package:ecommercepro/constants/firebase_option.dart';
import 'package:ecommercepro/constants/theme.dart';
import 'package:ecommercepro/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommercepro/app_provider.dart';
import 'package:ecommercepro/screens/auth_ui/welcome/welcome.dart';
import 'package:ecommercepro/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51Nu2ZcKG9uJFiRKzizmccyDdVYpoUpirLlqiqaFZ7zV5i8eeWgREM2BUROAmDqOj2AaORazCM1P0jZ9tXNhMl36C00LvzP7v9V";
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EaneMart',
        theme: themeData,
        home: StreamBuilder(
          stream: FirebaseAuthHelper.instance.getAuthChange,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const CustomBottomBar();
            }
            return const Welcome();
          },
        ),
      ),
    );
  }
}
