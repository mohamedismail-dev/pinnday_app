import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinnday_app/core/lang/lang_provider.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:pinnday_app/ui/home/events_manegment/add_events/widgets/events_scrollview.dart';
import 'package:pinnday_app/ui/home/events_manegment/events_model/events.dart';
import 'package:pinnday_app/ui/home/uitls/custom_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEventsScreen extends StatefulWidget {
  AddEventsScreen({super.key, required List<Events> this.events});
  List<Events> events;
  @override
  State<AddEventsScreen> createState() => _AddEventsScreenState();
}

class _AddEventsScreenState extends State<AddEventsScreen> {
  int currentPage = 0;
  bool noDateSelected = false;
  bool noTimeSelected = false;
  DateTime eventDate = DateTime.now();
  TimeOfDay eventTime = TimeOfDay.now();
  final db = FirebaseFirestore.instance;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descroptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  dispose() {
    titleController.dispose();

    descroptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LangProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          initialIndex: currentPage,
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 16,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: langProvider.isArabic == true
                            ? Icon(Iconsax.arrow_right_3, size: 24)
                            : Icon(Iconsax.arrow_left_2, size: 24),
                      ),
                      Spacer(),
                      Text(
                        S.of(context).Add_Event,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      Spacer(),
                      SizedBox(width: 24),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      EventsScrollview(currentPage: 0),
                      EventsScrollview(currentPage: 1),
                      EventsScrollview(currentPage: 2),
                      EventsScrollview(currentPage: 3),
                      EventsScrollview(currentPage: 4),
                    ],
                  ),
                ),

                TabBar(
                  indicatorAnimation: .elastic,

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
                      icon: currentPage == 1
                          ? Icons.directions_bike_outlined
                          : Icons.directions_bike,
                      iconColor: currentPage == 0
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      strokeColor: currentPage == 0
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.outline,
                      text: S.of(context).Sport,
                    ),
                    CustomTab(
                      labelColor: currentPage == 1
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                      icon: currentPage == 2 ? Iconsax.cake5 : Iconsax.cake,
                      iconColor: currentPage == 1
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      strokeColor: currentPage == 1
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.outline,
                      text: S.of(context).Birthday,
                    ),
                    CustomTab(
                      labelColor: currentPage == 2
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                      icon: currentPage == 2
                          ? Iconsax.book_14
                          : Iconsax.book_14,
                      iconColor: currentPage == 2
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      strokeColor: currentPage == 2
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.outline,
                      text: S.of(context).Book_Club,
                    ),
                    CustomTab(
                      labelColor: currentPage == 3
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                      icon: currentPage == 3
                          ? Icons.group
                          : Icons.group_outlined,
                      iconColor: currentPage == 3
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      strokeColor: currentPage == 3
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.outline,
                      text: S.of(context).Meeting,
                    ),
                    CustomTab(
                      labelColor: currentPage == 4
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                      icon: currentPage == 4
                          ? Icons.movie_creation
                          : Icons.movie_creation_outlined,
                      iconColor: currentPage == 4
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      strokeColor: currentPage == 4
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.outline,
                      text: S.of(context).Exhibition,
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    spacing: 8,
                    children: [
                      Row(
                        children: [
                          Text(
                            S.of(context).Title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      TextFormField(
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return S.of(context).Enter_title;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          hintText: S.of(context).Event_title,
                        ),
                        controller: titleController,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    spacing: 8,
                    children: [
                      Row(
                        children: [
                          Text(
                            S.of(context).Description,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      TextFormField(
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        maxLines: 5,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return S.of(context).Enter_description;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          hintText: S.of(context).Event_Description,
                        ),
                        controller: descroptionController,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    spacing: 8,
                    children: [
                      Icon(
                        Iconsax.calendar_add,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        S.of(context).Event_Date,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: eventDate,
                            firstDate: eventDate,
                            lastDate: DateTime(2100),
                          );
                          if (newDate == null) {
                            noDateSelected = false;
                            return;
                          }

                          setState(() {
                            noDateSelected = true;
                            eventDate = newDate;
                          });
                        },

                        child: Text(
                          noDateSelected
                              ? DateFormat('yMMMd', 'en').format(eventDate)
                              : S.of(context).Choose_Date,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    spacing: 8,
                    children: [
                      Icon(
                        Iconsax.clock,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        S.of(context).Event_Time,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: eventTime,
                          );
                          if (newTime == null) {
                            noTimeSelected = false;
                            return;
                          }
                          setState(() {
                            noTimeSelected = true;
                            eventTime = newTime;
                          });
                        },

                        child: Text(
                          noTimeSelected
                              ? eventTime.format(context)
                              : S.of(context).Choose_Time,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: 16,
                  ),
                  child: FilledButton(
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
                        await FirebaseFirestore.instance
                            .collection('events')
                            .add({
                              'userId': FirebaseAuth.instance.currentUser!.uid,
                              'type': currentPage == 0
                                  ? 'Sport'
                                  : currentPage == 1
                                  ? "Birthday"
                                  : currentPage == 2
                                  ? 'Book Club'
                                  : currentPage == 3
                                  ? "Meeting"
                                  : "Exhibition",
                              'title': titleController.text,
                              'description': descroptionController.text,
                              'bgImage': currentPage == 0
                                  ? 'assets/images/events_images/event_1.png'
                                  : currentPage == 1
                                  ? "assets/images/events_images/event_2.png"
                                  : currentPage == 2
                                  ? 'assets/images/events_images/event_3.png'
                                  : currentPage == 3
                                  ? "assets/images/events_images/event_4.png"
                                  : "assets/images/events_images/event_5.png",
                              'eventImage': currentPage == 0
                                  ? 'assets/images/events_words/event_1.svg'
                                  : currentPage == 1
                                  ? "assets/images/events_words/event_2.svg"
                                  : currentPage == 2
                                  ? 'assets/images/events_words/event_3.svg'
                                  : currentPage == 3
                                  ? "assets/images/events_words/event_4.svg"
                                  : "assets/images/events_words/event_5.svg",
                              'date': DateFormat(
                                'yMMMd',
                                'en',
                              ).format(eventDate),
                              'time': eventTime.format(context),
                            });
                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(' Error: $e')));
                      }
                    },

                    child: Text(
                      S.of(context).Add_Event,
                      style: Theme.of(context).textTheme.labelLarge,
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
