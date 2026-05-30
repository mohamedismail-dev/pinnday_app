import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:pinnday_app/ui/home/events_manegment/events_model/events.dart';
import 'package:pinnday_app/ui/home/uitls/format_date.dart';

class FavoriteCards extends StatelessWidget {
  const FavoriteCards({super.key, required this.event});

  final Events event;

  Future<void> _removeFromFavorite() async {
    await FirebaseFirestore.instance.collection('events').doc(event.id).update({
      'isFavorite': false,
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
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
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SvgPicture.asset(
                event.eventImage, // ✅
                color: Theme.of(context).colorScheme.onSecondary,
                fit: BoxFit.contain,
              ),
            ),
            Image.asset(
              event.bgImage, // ✅
              width: double.infinity,
              height: height * 0.25,
              fit: BoxFit.contain,
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
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
                  DateFormat('d MMM').format(parseDate(event.date)), // ✅
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
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
                      event.title,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _removeFromFavorite,
                      child: Icon(
                        Iconsax.heart5,
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
    );
  }
}
