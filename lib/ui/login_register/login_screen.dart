import 'package:pinnday_app/core/theme/app_colors.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:pinnday_app/ui/home/home.dart';
import 'package:pinnday_app/ui/login_register/forgot_password_screen.dart';
import 'package:pinnday_app/ui/login_register/register_screen.dart';
import 'package:pinnday_app/ui/services/google_sign_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_icons/social_icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool unVisable = true;

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              spacing: 26,
              children: [
                Row(
                  mainAxisAlignment: .center,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Image.asset(
                        "assets/images/pinnday-header.png",
                        width: width * 0.6,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: hight * 0.01),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        S.of(context).Login,
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 24,
                            ),
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return S.of(context).Enter_your_email;
                          }

                          final RegExp emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (!emailRegex.hasMatch(value.trim())) {
                            return S.of(context).enter_a_valid_email_address;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: S.of(context).Login_to_your_account,
                          prefixIcon: Icon(
                            Iconsax.sms,
                            color: AppColors.disable,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return S.of(context).please_enter_your_password;
                          }
                          if (value.trim().length < 6) {
                            return S
                                .of(context)
                                .password_must_be_at_least_6_characters;
                          }
                          return null;
                        },
                        obscureText: unVisable ? true : false,
                        decoration: InputDecoration(
                          hintText: S.of(context).Enter_your_password,

                          prefixIcon: Icon(
                            Iconsax.lock,
                            color: AppColors.disable,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                unVisable = !unVisable;
                              });
                            },
                            child: Icon(
                              unVisable ? Iconsax.eye_slash : Iconsax.eye,
                              color: AppColors.disable,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: .end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(),
                                ),
                              );
                            },
                            child: Text(
                              S.of(context).Forgot_password,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                FilledButton(
                  style: Theme.of(context).filledButtonTheme.style!.copyWith(
                    minimumSize: WidgetStatePropertyAll(
                      Size(double.infinity, 50),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),

                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text,
                      );

                      if (mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                  child: Text(
                    S.of(context).Login,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(S.of(context).Dont_have_an_account),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        S.of(context).Signup,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Divider(height: 1, thickness: 1)),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(S.of(context).Or),
                    ),
                    Expanded(child: Divider(height: 1, thickness: 1)),
                  ],
                ),
                OutlinedButton(
                  style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await GoogleSignServices.signInWithGoogle();
                    if (mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      SocialIcon(platform: SocialPlatform.google),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          S.of(context).Login_with_Google,
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Spacer(flex: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
