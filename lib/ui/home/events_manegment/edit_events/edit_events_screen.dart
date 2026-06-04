import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinnday_app/core/lang/lang_provider.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:pinnday_app/ui/home/events_manegment/add_events/widgets/events_scrollview.dart';
import 'package:pinnday_app/ui/home/events_manegment/events_model/events.dart';
import 'package:pinnday_app/ui/home/uitls/custom_tab.dart';
import 'package:pinnday_app/ui/home/uitls/format_date.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditEventsScreen extends StatefulWidget {
  EditEventsScreen({
    super.key,
    required Events this.event,
    required this.currentPage,
  });

  final Events event;
  int currentPage;

  @override
  State<EditEventsScreen> createState() => _EditEventsScreenState();
}

class _EditEventsScreenState extends State<EditEventsScreen> {
  DateTime eventDate = DateTime.now();
  TimeOfDay eventTime = TimeOfDay.now();
  final db = FirebaseFirestore.instance;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descroptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController.text = widget.event.title;
    descroptionController.text = widget.event.description;
    eventDate = parseDate(widget.event.date);

    eventTime = parseTime(widget.event.time);

    switch (widget.event.type) {
      case 'Sport':
        widget.currentPage = 0;
        break;
      case 'Birthday':
        widget.currentPage = 1;
        break;
      case 'Book Club':
        widget.currentPage = 2;
        break;
      case 'Meeting':
        widget.currentPage = 3;
        break;
      case 'Exhibition':
        widget.currentPage = 4;
        break;
      default:
        widget.currentPage = 0;
    }

    super.initState();
  }

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
          initialIndex: widget.currentPage,
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
                      widget.currentPage = value;
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
                      labelColor: widget.currentPage == 0
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                      icon: widget.currentPage == 1
                          ? Icons.directions_bike_outlined
                          : Icons.directions_bike,
                      iconColor: widget.currentPage == 0
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      strokeColor: widget.currentPage == 0
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.outline,
                      text: S.of(context).Sport,
                    ),
                    CustomTab(
                      labelColor: widget.currentPage == 1
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                      icon: widget.currentPage == 2
                          ? Iconsax.cake5
                          : Iconsax.cake,
                      iconColor: widget.currentPage == 1
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      strokeColor: widget.currentPage == 1
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.outline,
                      text: S.of(context).Birthday,
                    ),
                    CustomTab(
                      labelColor: widget.currentPage == 2
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                      icon: widget.currentPage == 2
                          ? Iconsax.book_14
                          : Iconsax.book_14,
                      iconColor: widget.currentPage == 2
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      strokeColor: widget.currentPage == 2
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.outline,
                      text: S.of(context).Book_Club,
                    ),
                    CustomTab(
                      labelColor: widget.currentPage == 3
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                      icon: widget.currentPage == 3
                          ? Icons.group
                          : Icons.group_outlined,
                      iconColor: widget.currentPage == 3
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      strokeColor: widget.currentPage == 3
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.outline,
                      text: S.of(context).Meeting,
                    ),
                    CustomTab(
                      labelColor: widget.currentPage == 4
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                      icon: widget.currentPage == 4
                          ? Icons.movie_creation
                          : Icons.movie_creation_outlined,
                      iconColor: widget.currentPage == 4
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      strokeColor: widget.currentPage == 4
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
                            return;
                          }

                          setState(() {
                            eventDate = newDate;
                          });
                        },

                        child: Text(
                          DateFormat(
                            'd MMMM',
                          ).format(parseDate(widget.event.date)),
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
                            return;
                          }
                          setState(() {
                            eventTime = newTime;
                          });
                        },

                        child: Text(
                          eventTime.format(context),
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
                            .doc(widget.event.id)
                            .update({
                              'userId': FirebaseAuth.instance.currentUser!.uid,
                              'type': widget.currentPage == 0
                                  ? 'Sport'
                                  : widget.currentPage == 1
                                  ? "Birthday"
                                  : widget.currentPage == 2
                                  ? 'Book Club'
                                  : widget.currentPage == 3
                                  ? "Meeting"
                                  : "Exhibition",
                              'title': titleController.text,
                              'description': descroptionController.text,
                              'bgImage': widget.currentPage == 0
                                  ? 'assets/images/events_images/event_1.png'
                                  : widget.currentPage == 1
                                  ? "assets/images/events_images/event_2.png"
                                  : widget.currentPage == 2
                                  ? 'assets/images/events_images/event_3.png'
                                  : widget.currentPage == 3
                                  ? "assets/images/events_images/event_4.png"
                                  : "assets/images/events_images/event_5.png",
                              'eventImage': widget.currentPage == 0
                                  ? 'assets/images/events_words/event_1.svg'
                                  : widget.currentPage == 1
                                  ? "assets/images/events_words/event_2.svg"
                                  : widget.currentPage == 2
                                  ? 'assets/images/events_words/event_3.svg'
                                  : widget.currentPage == 3
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
                      S.of(context).Update_event,
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
