import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinnday_app/core/theme/app_colors.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:pinnday_app/ui/home/events_manegment/add_events/add_events_screen.dart';
import 'package:pinnday_app/ui/home/events_manegment/events_model/events.dart';
import 'package:pinnday_app/ui/home/favouriteScreen/widgets/favorite_cards.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  String _searchQuery = '';

  Stream<QuerySnapshot> get _favStream {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('events')
        .where('userId', isEqualTo: uid)
        .where('isFavorite', isEqualTo: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 16,
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                onChanged: (val) =>
                    setState(() => _searchQuery = val.toLowerCase()),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),

                  suffixIcon: Icon(
                    Iconsax.search_normal_1,
                    color: Theme.of(context).colorScheme.primary,
                  ),

                  hintText: S.of(context).Search_for_event,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _favStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text(S.of(context).No_favorites));
                  }

                  final docs = snapshot.data!.docs.where((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    final title = (data['title'] ?? '')
                        .toString()
                        .toLowerCase();
                    return title.contains(_searchQuery);
                  }).toList();

                  if (docs.isEmpty) {
                    return Center(child: Text(S.of(context).No_favorites));
                  }

                  return ListView.builder(
                    itemCount: docs.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      final doc = docs[index];
                      final data = doc.data() as Map<String, dynamic>;
                      final event = Events(
                        id: doc.id,
                        type: data['type'] ?? '',
                        title: data['title'] ?? '',
                        description: data['description'] ?? '',
                        bgImage: data['bgImage'] ?? '',
                        eventImage: data['eventImage'] ?? '',
                        date: data['date'] ?? '',
                        time: data['time'] ?? '',
                        isFavorite: true,
                      );
                      return FavoriteCards(event: event);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
