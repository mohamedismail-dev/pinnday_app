import 'package:pinnday_app/core/lang/lang_provider.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LangProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 45,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: langProvider.isArabic == true
                        ? Icon(Iconsax.arrow_right_3, size: 24)
                        : Icon(Iconsax.arrow_left_2, size: 24),
                  ),
                  Spacer(),
                  Text(
                    S.of(context).Forget_password2,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Spacer(flex: 2),
                ],
              ),
              Image.asset(
                "assets/images/dark_mode/change-setting_dark.png",
                color: Theme.of(context).colorScheme.onSecondary,
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

                onPressed: () {},
                child: Text(
                  S.of(context).Reset_password,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
