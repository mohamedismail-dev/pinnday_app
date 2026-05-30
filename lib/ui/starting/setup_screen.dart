import 'package:pinnday_app/generated/l10n.dart';
import 'package:pinnday_app/ui/starting/onbording.dart';
import 'package:pinnday_app/ui/widgets/lang_and_theme_selector.dart';
import 'package:flutter/material.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 26,
              children: [
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    Image.asset(
                      "assets/images/pinnday-header.png",
                      width: width * 0.4,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Image.asset(
                        "assets/images/being-creative.png",
                        color: Theme.of(context).colorScheme.onSecondary,
                        width: width * 0.9,
                      ),
                    ],
                  ),
                ),
                Column(
                  spacing: 8,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.of(context).setup_page_title,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.of(context).setup_page_bodytext,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    LangAndThemeSelector(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: FilledButton(
                    style: Theme.of(context).filledButtonTheme.style!.copyWith(
                      minimumSize: WidgetStatePropertyAll(Size(width, 50)),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Onbording()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        S.of(context).setup_button,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
