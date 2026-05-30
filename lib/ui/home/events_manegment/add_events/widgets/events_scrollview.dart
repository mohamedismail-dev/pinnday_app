import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventsScrollview extends StatefulWidget {
  const EventsScrollview({super.key, required this.currentPage});

  final int currentPage;
  @override
  State<EventsScrollview> createState() => _EventsScrollviewState();
}

class _EventsScrollviewState extends State<EventsScrollview> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;

    return Padding(
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
                  "assets/images/events_words/event_${widget.currentPage + 1}.svg",
                  color: Theme.of(context).colorScheme.onPrimary,
                  fit: BoxFit.contain,
                ),
              ),
              Image.asset(
                "assets/images/events_images/event_${widget.currentPage + 1}.png",
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
    );
  }
}
