import 'package:pinnday_app/core/theme/app_colors.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:pinnday_app/ui/home/home.dart';
import 'package:pinnday_app/ui/services/google_sign_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_icons/social_icons.dart';
import 'package:email_validator/email_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool unVisableEnter = true;
  bool unVisableConfirm = true;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
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
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/dark_mode/logo_header_dark.png",
                          color: Theme.of(context).colorScheme.primary,
                        ),
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
                        S.of(context).Create_your_account,
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 24,
                            ),
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        controller: _nameController,
                        validator: (value) =>
                            (value == null || value.trim().isEmpty)
                            ? S.of(context).your_name_required
                            : null,
                        decoration: InputDecoration(
                          hintText: S.of(context).Enter_your_name,

                          prefixIcon: Icon(
                            Iconsax.user,
                            color: AppColors.disable,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) => value == null || value.isEmpty
                            ? S.of(context).email_is_required
                            : !EmailValidator.validate(value)
                            ? S.of(context).enter_valid_email
                            : null,
                        decoration: InputDecoration(
                          hintText: S.of(context).Enter_your_email,
                          prefixIcon: Icon(
                            Iconsax.sms,
                            color: AppColors.disable,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) => value == null || value.isEmpty
                            ? S.of(context).password_is_required
                            : !RegExp(
                                r'^(?=.*[A-Z])(?=.*\d).{8,}$',
                              ).hasMatch(value)
                            ? S.of(context).password_complexity
                            : null,
                        obscureText: unVisableEnter ? true : false,
                        decoration: InputDecoration(
                          hintText: S.of(context).Enter_your_password,
                          prefixIcon: Icon(
                            Iconsax.lock,
                            color: AppColors.disable,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                unVisableEnter = !unVisableEnter;
                              });
                            },
                            child: Icon(
                              unVisableEnter ? Iconsax.eye_slash : Iconsax.eye,
                              color: AppColors.disable,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return S.of(context).password_does_not_match;
                          }
                          return null;
                        },
                        obscureText: unVisableConfirm ? true : false,
                        decoration: InputDecoration(
                          hintText: S.of(context).Confirm_your_password,
                          prefixIcon: Icon(
                            Iconsax.lock,
                            color: AppColors.disable,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                unVisableConfirm = !unVisableConfirm;
                              });
                            },
                            child: Icon(
                              unVisableConfirm
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye,
                              color: AppColors.disable,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
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
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text,
                          );
                      await credential.user?.updateDisplayName(
                        _nameController.text.trim(),
                      );
                      if (mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.message ?? 'An error occurred'),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  child: Text(
                    S.of(context).Signup,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(S.of(context).Already_have_an_account),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        S.of(context).Login,
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
                          S.of(context).Sign_up_with_Google,
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
