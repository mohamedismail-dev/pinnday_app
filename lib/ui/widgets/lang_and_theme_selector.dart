import 'package:pinnday_app/core/lang/lang_provider.dart';
import 'package:pinnday_app/core/theme/theme_provider.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class LangAndThemeSelector extends StatefulWidget {
  const LangAndThemeSelector({super.key});

  @override
  State<LangAndThemeSelector> createState() => _LangAndThemeSelectorState();
}

class _LangAndThemeSelectorState extends State<LangAndThemeSelector> {
  bool isEnglish = true;
  bool isLight = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final langProvider = Provider.of<LangProvider>(context);
    return Column(
      spacing: 8,
      children: [
        Row(
          children: [
            Text(
              S.of(context).language_label,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Spacer(),
            FilledButton(
              style: isEnglish
                  ? Theme.of(context).filledButtonTheme.style
                  : Theme.of(context).outlinedButtonTheme.style,
              onPressed: () {
                setState(() {
                  langProvider.toggleLanguage(true);
                  isEnglish = true;
                });
              },
              child: Text(S.of(context).english),
            ),
            SizedBox(width: 8),
            OutlinedButton(
              style: isEnglish
                  ? Theme.of(context).outlinedButtonTheme.style
                  : Theme.of(context).filledButtonTheme.style,
              onPressed: () {
                setState(() {
                  isEnglish = false;
                  langProvider.toggleLanguage(false);
                });
              },
              child: Text(S.of(context).arabic),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              S.of(context).theme_label,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Spacer(),
            FilledButton(
              style: isLight
                  ? Theme.of(context).filledButtonTheme.style
                  : Theme.of(context).outlinedButtonTheme.style,
              onPressed: () {
                setState(() {
                  isLight = true;

                  themeProvider.toggleTheme(false);
                });
              },
              child: isLight
                  ? Icon(Iconsax.sun_1, size: 24)
                  : Icon(Iconsax.sun_15, size: 24),
            ),
            SizedBox(width: 8),
            OutlinedButton(
              style: isLight
                  ? Theme.of(context).outlinedButtonTheme.style
                  : Theme.of(context).filledButtonTheme.style,
              onPressed: () {
                setState(() {
                  isLight = false;
                  themeProvider.toggleTheme(true);
                });
              },
              child: isLight
                  ? Icon(Iconsax.moon, size: 24)
                  : Icon(Iconsax.moon5, size: 24),
            ),
          ],
        ),
      ],
    );
  }
}
