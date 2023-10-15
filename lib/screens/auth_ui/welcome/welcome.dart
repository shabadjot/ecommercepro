import 'package:ecommercepro/constants/asset_images.dart';
import 'package:ecommercepro/constants/routes.dart';
import 'package:ecommercepro/screens/auth_ui/login/login.dart';
import 'package:ecommercepro/screens/auth_ui/sign_up/sign_up.dart';
import 'package:ecommercepro/widgets/primary-button/primary_button.dart';
import 'package:ecommercepro/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopTitles(
              subtitle: "Buy AnyItems From Using  App", title: "Welcome"),
          Center(
            child: Image.asset(
              AssetsImages.instance.welcomeImage,
              alignment: Alignment.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.facebook,
                  size: 35,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              CupertinoButton(
                onPressed: () {},
                child: Image.asset(
                  AssetsImages.instance.google,
                  scale: 30.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          PrimaryButton(
            title: "Login",
            onPressed: () {
              Routes.instance.push(widget: const Login(), context: context);
            },
          ),
          const SizedBox(
            height: 18.0,
          ),
          PrimaryButton(
            title: "Start Now",
            onPressed: () {
              Routes.instance.push(widget: const SignUp(), context: context);
            },
          ),
        ],
      ),
    ));
  }
}
