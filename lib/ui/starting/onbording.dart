import 'package:pinnday_app/core/lang/lang_provider.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:pinnday_app/ui/login_register/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  PageController controller = PageController();
  int page = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LangProvider>(context);

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  spacing: 26,
                  children: [
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      crossAxisAlignment: .center,
                      children: [
                        page == 0
                            ? SizedBox(width: 48, height: 32)
                            : IconButton(
                                onPressed: () => controller.previousPage(
                                  duration: Duration(milliseconds: 800),
                                  curve: Curves.easeInOut,
                                ),
                                icon: langProvider.isArabic == true
                                    ? Icon(Iconsax.arrow_right_3, size: 24)
                                    : Icon(Iconsax.arrow_left_2, size: 24),
                              ),
                        Image.asset(
                          "assets/images/pinnday-header.png",
                          width: width * 0.4,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        page == 2
                            ? SizedBox(width: 67, height: 32)
                            : OutlinedButton(
                                onPressed: () => controller.animateToPage(
                                  3,
                                  duration: Duration(milliseconds: 800),
                                  curve: Curves.easeInOut,
                                ),
                                child: Text(
                                  S.of(context).skip_button,
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                      ],
                    ),
                    Expanded(
                      child: PageView.builder(
                        onPageChanged: (currenPage) => setState(() {
                          page = currenPage;
                        }),
                        controller: controller,
                        itemCount: 3,
                        scrollDirection: .horizontal,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            "assets/images/illusration_$index.png",
                            color: Theme.of(context).colorScheme.onSecondary,
                            width: width * 0.9,
                          );
                        },
                      ),
                    ),
                    SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                        activeDotColor: Theme.of(context).colorScheme.primary,
                        dotColor: Theme.of(context).colorScheme.onSecondary,
                        dotHeight: 8,
                        dotWidth: 8,
                        expansionFactor: 2.6,
                      ),

                      controller: controller,
                      count: 3,
                    ),
                    Column(
                      crossAxisAlignment: .start,
                      spacing: 8,
                      children: [
                        Text(
                          page == 0
                              ? S.of(context).onboarding_title_1
                              : page == 1
                              ? S.of(context).onboarding_title_2
                              : S.of(context).onboarding_title_3,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          page == 0
                              ? S.of(context).onboarding_bodytext_1
                              : page == 1
                              ? S.of(context).onboarding_bodytext_2
                              : S.of(context).onboarding_bodytext_3,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: FilledButton(
                            style: Theme.of(context).filledButtonTheme.style!
                                .copyWith(
                                  minimumSize: WidgetStatePropertyAll(
                                    Size(width, 50),
                                  ),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                            onPressed: () {
                              page == 2
                                  ? Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    )
                                  : controller.nextPage(
                                      duration: Duration(milliseconds: 800),
                                      curve: Curves.easeInOut,
                                    );
                            },
                            child: Text(
                              page == 2
                                  ? S.of(context).onboarding_button2
                                  : S.of(context).onboarding_button1,

                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
