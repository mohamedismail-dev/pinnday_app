import 'package:pinnday_app/core/theme/app_colors.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:pinnday_app/ui/home/events_manegment/add_events/add_events_screen.dart';
import 'package:pinnday_app/ui/home/events_manegment/events_model/events.dart';
import 'package:pinnday_app/ui/home/favouriteScreen/favourite_screen.dart';
import 'package:pinnday_app/ui/home/homeScreen/home_screen.dart';
import 'package:pinnday_app/ui/home/profileScreen/profile_screen.dart';
import 'package:pinnday_app/ui/home/uitls/get_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  List<Events> events = [];

  @override
  // Future<void> loadEvents() async {
  //   events = await fetchEvents();
  // }
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    PageController controller = PageController(initialPage: currentPage);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowFloatingButton.withAlpha(143),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEventsScreen(events: events),
              ),
            );
          },
          child: Icon(Iconsax.add),
          shape: const StadiumBorder(),
        ),
      ),
      body: PageView(
        onPageChanged: (value) => setState(() => currentPage = value),
        controller: controller,

        children: const [HomeScreen(), FavouriteScreen(), ProfileScreen()],
      ),

      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: hight * 0.095,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 12,
            height: 2.1,
          ),

          selectedItemColor: Theme.of(context).colorScheme.primary,
          currentIndex: currentPage,

          onTap: (value) {
            controller.animateToPage(
              value,
              duration: Duration(milliseconds: 600),
              curve: Curves.easeOut,
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                controller.initialPage == 0 ? Iconsax.home_15 : Iconsax.home,
              ),
              label: S.of(context).Home,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                controller.initialPage == 1 ? Iconsax.heart5 : Iconsax.heart,
              ),
              label: S.of(context).Favorite,
            ),
            BottomNavigationBarItem(
              icon: controller.initialPage == 2
                  ? SvgPicture.asset(
                      "assets/images/user.svg",
                      color: Theme.of(context).colorScheme.primary,
                      width: 24,
                      height: 24,
                    )
                  : Icon(Iconsax.user),

              label: S.of(context).Profile,
            ),
          ],
        ),
      ),
    );
  }
}
