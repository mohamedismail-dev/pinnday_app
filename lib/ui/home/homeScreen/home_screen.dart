import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinnday_app/core/lang/lang_provider.dart';
import 'package:pinnday_app/core/theme/app_colors.dart';
import 'package:pinnday_app/core/theme/theme_provider.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:pinnday_app/ui/home/events_manegment/add_events/add_events_screen.dart';
import 'package:pinnday_app/ui/home/events_manegment/events_model/events.dart';
import 'package:pinnday_app/ui/home/homeScreen/widgets/events_cards.dart';
import 'package:pinnday_app/ui/home/uitls/custom_tab.dart';
import 'package:pinnday_app/ui/home/uitls/get_events.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  bool isDark = false;

  final List<String?> tabTypes = [
    null, // 0 = All
    'Sport', // 1
    'Birthday', // 2
    'Book Club', // 3
    'Meeting', // 4
    'Exhibition', // 5
  ];

  Stream<QuerySnapshot> get eventsStream {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    if (tabTypes[currentPage] == null) {
      return FirebaseFirestore.instance
          .collection('events')
          .where('userId', isEqualTo: uid)
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('events')
          .where('userId', isEqualTo: uid)
          .where('type', isEqualTo: tabTypes[currentPage])
          .snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final langProvider = Provider.of<LangProvider>(context);
    final user = FirebaseAuth.instance.currentUser;
    final width = MediaQuery.of(context).size.width;
    themeProvider.themeMode == ThemeMode.dark ? isDark = true : isDark = false;

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: 0,
          length: 6,
          child: Column(
            spacing: 24,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).Welcome_Back),
                          Text(
                            user!.displayName.toString(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isDark = !isDark;
                                themeProvider.toggleTheme(isDark);
                              });
                            },
                            child: Icon(
                              isDark ? Iconsax.moon : Iconsax.sun_1,

                              color: Theme.of(context).colorScheme.primary,
                              size: 24,
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                langProvider.toggleLanguage(
                                  !langProvider.isEnglish,
                                );
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                langProvider.isArabic
                                    ? S.of(context).AR1
                                    : S.of(context).EN1,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              TabBar(
                onTap: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                isScrollable: true,
                labelStyle: TextStyle(fontWeight: FontWeight.w400),
                tabAlignment: TabAlignment.start,
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                labelColor: Theme.of(context).colorScheme.onPrimary,
                unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
                dividerColor: Colors.transparent,
                labelPadding: langProvider.isArabic
                    ? const EdgeInsets.only(right: 16)
                    : EdgeInsets.only(left: 16),
                indicatorPadding: const EdgeInsets.all(1.7),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),

                  color: Theme.of(context).colorScheme.primary,
                ),
                tabs: [
                  CustomTab(
                    labelColor: currentPage == 0
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                    icon: currentPage == 0
                        ? Iconsax.category5
                        : Iconsax.category4,
                    iconColor: currentPage == 0
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
                    strokeColor: currentPage == 0
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.outline,
                    text: S.of(context).All,
                  ),
                  CustomTab(
                    labelColor: currentPage == 1
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                    icon: currentPage == 1
                        ? Icons.directions_bike_outlined
                        : Icons.directions_bike,
                    iconColor: currentPage == 1
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
                    strokeColor: currentPage == 1
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.outline,
                    text: S.of(context).Sport,
                  ),
                  CustomTab(
                    labelColor: currentPage == 2
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                    icon: currentPage == 2 ? Iconsax.cake5 : Iconsax.cake,
                    iconColor: currentPage == 2
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
                    strokeColor: currentPage == 2
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.outline,
                    text: S.of(context).Birthday,
                  ),
                  CustomTab(
                    labelColor: currentPage == 3
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                    icon: currentPage == 3 ? Iconsax.book_14 : Iconsax.book_14,
                    iconColor: currentPage == 3
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
                    strokeColor: currentPage == 3
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.outline,
                    text: S.of(context).Book_Club,
                  ),
                  CustomTab(
                    labelColor: currentPage == 4
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                    icon: currentPage == 4 ? Icons.group : Icons.group_outlined,
                    iconColor: currentPage == 4
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
                    strokeColor: currentPage == 4
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.outline,
                    text: S.of(context).Meeting,
                  ),
                  CustomTab(
                    labelColor: currentPage == 5
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                    icon: currentPage == 5
                        ? Icons.movie_creation
                        : Icons.movie_creation_outlined,
                    iconColor: currentPage == 5
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
                    strokeColor: currentPage == 5
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.outline,
                    text: S.of(context).Exhibition,
                  ),
                ],
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: eventsStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('حدث خطأ: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: .center,
                        children: [
                          SizedBox(height: 80),
                          Expanded(
                            child: SvgPicture.asset(
                              "assets/images/Questions-rafiki.svg",
                              width: width * 0.8,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              S.of(context).No_Events,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      );
                    }

                    final docs = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: docs.length,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        final doc = docs[index];
                        final data = doc.data() as Map<String, dynamic>;

                        if (!data.containsKey('type') ||
                            !data.containsKey('title') ||
                            !data.containsKey('date') ||
                            !data.containsKey('time')) {
                          return const SizedBox.shrink();
                        }

                        final event = Events(
                          id: doc.id,
                          type: data['type'] ?? '',
                          title: data['title'] ?? '',
                          description: data['description'] ?? '',
                          bgImage: data['bgImage'] ?? '',
                          eventImage: data['eventImage'] ?? '',
                          date: data['date'] ?? '',
                          time: data['time'] ?? '',
                          isFavorite: data['isFavorite'] ?? false,
                        );
                        return EventsCards(
                          event: event,
                          currentPage: currentPage,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
