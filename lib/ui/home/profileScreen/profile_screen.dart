import 'package:pinnday_app/core/lang/lang_provider.dart';
import 'package:pinnday_app/core/theme/theme_provider.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:pinnday_app/ui/login_register/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDark = true;
  bool isEnglish = true;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final langProvider = Provider.of<LangProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .start,

            spacing: 32,
            children: [
              SizedBox(height: 1),
              Column(
                mainAxisAlignment: .start,

                spacing: 8,
                children: [
                  user?.photoURL != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(user!.photoURL!),
                          child: user.photoURL == null
                              ? Icon(Icons.person, size: 50)
                              : null,
                        )
                      : CircleAvatar(
                          radius: 50,
                          child: Icon(Icons.person, size: 50),
                        ),
                  Text(
                    user!.displayName.toString(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    user.email.toString(),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 16,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            S.of(context).Dark_mode,
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                          Spacer(),
                          Switch(
                            hoverColor: Colors.transparent,

                            value: themeProvider.themeMode == ThemeMode.dark
                                ? true
                                : false,
                            onChanged: (value) {
                              setState(() {
                                isDark = value;
                                themeProvider.toggleTheme(value);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            S.of(context).Language,
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: AnimatedToggleSwitch<bool>.dual(
                              current: langProvider.isEnglish,
                              first: false, // عربي
                              second: true, // إنجليزي
                              onChanged: (value) {
                                setState(() {
                                  isEnglish = value;
                                  langProvider.toggleLanguage(value);
                                });
                              },
                              styleBuilder: (value) => ToggleStyle(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.surface,
                                borderColor: Theme.of(
                                  context,
                                ).colorScheme.outline,
                                indicatorColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                              ),
                              iconBuilder: (value) => Text(
                                value ? 'EN' : 'AR',
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              textBuilder: (value) => Text(
                                value ? 'English' : 'عربي',
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              S.of(context).Logout,
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                            ),
                            Spacer(),
                            HugeIcon(
                              icon: HugeIcons.strokeRoundedLogout02,
                              size: 24,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
