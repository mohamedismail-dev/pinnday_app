import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinnday_app/core/lang/lang_provider.dart';
import 'package:pinnday_app/ui/home/events_manegment/edit_events/edit_events_screen.dart';
import 'package:pinnday_app/ui/home/events_manegment/events_details/event_details.dart';
import 'package:pinnday_app/ui/home/events_manegment/events_model/events.dart';
import 'package:pinnday_app/ui/home/uitls/format_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventsCards extends StatefulWidget {
  EventsCards({
    super.key,
    required Events this.event,
    required this.currentPage,
  });

  final Events event;
  final int currentPage;

  @override
  State<EventsCards> createState() => _EventsCardsState();
}

class _EventsCardsState extends State<EventsCards> {
  Future<void> _toggleFavorite() async {
    final newValue = !widget.event.isFavorite;
    await FirebaseFirestore.instance
        .collection('events')
        .doc(widget.event.id)
        .update({'isFavorite': newValue});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final langProvider = Provider.of<LangProvider>(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetails(
            event: widget.event,
            currentPage: widget.currentPage + 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          height: height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 1.5,
            ),
            color: Theme.of(context).colorScheme.surface.withAlpha(125),
          ),
          child: Stack(
            alignment: .center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  "${widget.event.eventImage}",
                  color: Theme.of(context).colorScheme.onSecondary,
                  fit: BoxFit.contain,
                ),
              ),
              Image.asset(
                "${widget.event.bgImage}",
                width: double.infinity,
                height: height * 0.25,
                fit: BoxFit.contain,
              ),
              Positioned(
                top: 8,
                right: langProvider.isArabic == true ? 8 : null,
                left: langProvider.isArabic == true ? null : 8,
                child: Container(
                  padding: EdgeInsets.all(8),
                  alignment: .center,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    DateFormat('d MMM').format(parseDate(widget.event.date)),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textAlign: .center,
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        widget.event.title,
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: _toggleFavorite,

                        child: Icon(
                          widget.event.isFavorite
                              ? Iconsax.heart5
                              : Iconsax.heart,
                          size: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageProvider {}
