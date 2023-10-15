import 'package:ecommercepro/app_provider.dart';
import 'package:ecommercepro/constants/routes.dart';
import 'package:ecommercepro/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommercepro/screens/about_us/about_us.dart';
import 'package:ecommercepro/screens/edit_profile/edit_profile.dart';
import 'package:ecommercepro/screens/change_password/change_password.dart';
import 'package:ecommercepro/screens/favourite_screen/favourite_screen.dart';
import 'package:ecommercepro/screens/order_page/order_screen.dart';
import 'package:ecommercepro/screens/support/question_policies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/primary-button/primary_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Account",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      appProvider.getUserInformation.image == null
                          ? const Icon(
                              Icons.person_outline,
                              size: 110,
                            )
                          : CircleAvatar(
                              backgroundImage: NetworkImage(
                                  appProvider.getUserInformation.image!),
                              radius: 60,
                            ),
                      Text(
                        appProvider.getUserInformation.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        appProvider.getUserInformation.email,
                      ),
                      const SizedBox(
                        height: 1.0,
                      ),
                      SizedBox(
                        width: 140,
                        child: PrimaryButton(
                          title: "Edit Profile",
                          onPressed: () {
                            Routes.instance.push(
                                widget: const EditProfile(), context: context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Routes.instance.push(
                              widget: const OrderScreen(), context: context);
                        },
                        leading: const Icon(Icons.shopping_bag_outlined),
                        title: const Text("Your Orders"),
                      ),
                      ListTile(
                        onTap: () {
                          Routes.instance.push(
                              widget: const FavouriteScreen(),
                              context: context);
                        },
                        leading: const Icon(Icons.favorite_outline),
                        title: const Text("Favourite"),
                      ),
                      ListTile(
                        onTap: () {
                          Routes.instance
                              .push(widget: const AboutUs(), context: context);
                        },
                        leading: const Icon(Icons.info_outline),
                        title: const Text("About"),
                      ),
                      ListTile(
                        onTap: () {
                          Routes.instance.push(
                              widget: const ChangePassword(), context: context);
                        },
                        leading: const Icon(Icons.change_circle_outlined),
                        title: const Text("Change Password"),
                      ),
                      ListTile(
                        onTap: () {
                          Routes.instance.push(
                              widget: const SupportQuestions(),
                              context: context);
                        },
                        leading: const Icon(Icons.support),
                        title: const Text("Support"),
                      ),
                      ListTile(
                        onTap: () {
                          FirebaseAuthHelper.instance.signOut();
                        },
                        leading: const Icon(Icons.exit_to_app),
                        title: const Text("Log out"),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const Text("Version 2.0.1")
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
