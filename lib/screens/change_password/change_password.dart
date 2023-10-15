import 'package:ecommercepro/constants/constants.dart';
import 'package:ecommercepro/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommercepro/widgets/primary-button/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isShowPassword = true;
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "change your password",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          TextFormField(
            controller: newpassword,
            obscureText: isShowPassword,
            decoration: InputDecoration(
              hintText: "Enter your new Password",
              prefixIcon: const Icon(
                Icons.password_sharp,
              ),
              suffixIcon: CupertinoButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.visibility,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
            controller: confirmpassword,
            obscureText: isShowPassword,
            decoration: InputDecoration(
              hintText: "Confirm your Password",
              prefixIcon: const Icon(
                Icons.password_sharp,
              ),
              suffixIcon: CupertinoButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.visibility,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 21.0,
          ),
          PrimaryButton(
            title: "Update",
            onPressed: () async {
              if (newpassword.text.isEmpty) {
                showMessage("your new password is empty");
              } else if (confirmpassword.text.isEmpty) {
                showMessage("your confirm password is empty");
              } else {
                if (confirmpassword.text == newpassword.text) {
                  FirebaseAuthHelper.instance
                      .changePassword(newpassword.text, context);
                } else {
                  showMessage("Your confirm password doesn't match");
                }
              }
            },
          )
        ],
      ),
    );
  }
}
