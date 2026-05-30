import 'package:pinnday_app/ui/home/events_manegment/events_model/events.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<Events>> fetchEvents() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final snapshot = await FirebaseFirestore.instance
      .collection('events')
      .where('userId', isEqualTo: uid)
      .get();
  return snapshot.docs.map((doc) {
    return Events(
      id: doc.id,
      type: doc['type'],
      title: doc['title'],
      description: doc['description'],
      bgImage: doc['bgImage'],
      eventImage: doc['eventImage'],
      date: doc['date'],
      time: doc['time'],
    );
  }).toList();
}

Future<void> deleteEvent(String id) async {
  await FirebaseFirestore.instance.collection('events').doc(id).delete();
}
