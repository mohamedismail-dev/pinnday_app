import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinnday_app/core/lang/lang_provider.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:pinnday_app/ui/home/events_manegment/edit_events/edit_events_screen.dart';
import 'package:pinnday_app/ui/home/events_manegment/events_model/events.dart';
import 'package:pinnday_app/ui/home/uitls/format_date.dart';
import 'package:pinnday_app/ui/home/uitls/get_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../uitls/get_events.dart';

class EventDetails extends StatefulWidget {
  EventDetails({
    super.key,
    required Events this.event,
    required,
    required this.currentPage,
  });

  final Events event;
  final int currentPage;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;
    final langProvider = Provider.of<LangProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("events")
              .doc(widget.event.id)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              });
              return const Center(child: CircularProgressIndicator());
            }

            // ✅ ابني الـ event من أحدث بيانات Firestore
            final data = snapshot.data!.data() as Map<String, dynamic>;
            final updatedEvent = Events(
              id: snapshot.data!.id,
              type: data['type'] ?? '',
              title: data['title'] ?? '',
              description: data['description'] ?? '',
              bgImage: data['bgImage'] ?? '',
              eventImage: data['eventImage'] ?? '',
              date: data['date'] ?? '',
              time: data['time'] ?? '',
            );

            return Column(
              spacing: 16,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
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
                        S.of(context).Event_details,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditEventsScreen(
                                  event: updatedEvent,
                                  currentPage: widget.currentPage,
                                ),
                              ),
                            ),
                            icon: Icon(
                              Iconsax.edit_2,
                              size: 24,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteEvent(updatedEvent.id);

                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Iconsax.trash,
                              size: 24,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: width * 0.9,
                      height: hight * 0.5,
                      child: Center(
                        child: Stack(
                          alignment: .center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: SvgPicture.asset(
                                "${updatedEvent.eventImage}",
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Image.asset(
                              "${updatedEvent.bgImage}",
                              width: width * 0.9,
                              height: hight * 0.5,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                          width: 1.5,
                        ),
                      ),
                    ),
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
                            updatedEvent.title,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          spacing: 16,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Iconsax.calendar_add,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: .start,
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  DateFormat(
                                    'd MMMM',
                                  ).format(parseDate(updatedEvent.date)),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                ),
                                Text(
                                  updatedEvent.time,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
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
                      Container(
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        height: hight * 0.25,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                            width: 1.5,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Text("${updatedEvent.description}"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: hight * 0.15),
              ],
            );
          },
        ),
      ),
    );
  }
}
