import 'package:catfeeder/modules/backend/src/models/cat.dart';
import 'package:catfeeder/modules/backend/src/models/feed_event.dart';
import 'package:catfeeder/modules/backend/src/models/user.dart';
import 'package:catfeeder/modules/backend/src/services/i_backend_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseBackendService implements IBackendService {
  static const _userCollectionPath = 'users';
  static const _catCollectionPath = 'cats';
  static const _feedEventCollectionPath = 'feed_events';

  FirebaseFirestore _firestore;

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp();
    _firestore = FirebaseFirestore.instance;
  }

  @override
  Future<User> getUser(String userId) async {
    try {
      final document = await _firestore.collection(_userCollectionPath).doc(userId).get();

      if (document != null) {
        return User.fromJson(document.data());
      }
    } catch (_) {}

    return null;
  }

  @override
  Future<Cat> getCat(String catId) async {
    try {
      final document = await _firestore.collection(_catCollectionPath).doc(catId).get();

      if (document != null) {
        return Cat.fromJson(document.data());
      }
    } catch (_) {}

    return null;
  }

  @override
  Future<List<Cat>> getCatsForUser(String userId) async {
    final user = await getUser(userId);
    if (user != null) {
      final cats = <Cat>[];
      for (final catId in user.cats) {
        final cat = await getCat(catId);
        if (cat != null) {
          cats.add(cat);
        }
      }

      return cats;
    }

    return null;
  }

  @override
  Stream<List<FeedEvent>> getFeedEventsForUser(String userId) {
    final stream = _firestore.collection(_feedEventCollectionPath).where('user_id', isEqualTo: userId).snapshots();
    return stream.map((snapshot) => snapshot.docs.map((doc) => FeedEvent.fromJson(doc.data())).toList());
  }

  @override
  Stream<List<FeedEvent>> getFeedEventsForCat(String catId) {
    final stream = _firestore.collection(_feedEventCollectionPath).where('cat_id', isEqualTo: catId).snapshots();
    return stream.map((snapshot) => snapshot.docs.map((doc) => FeedEvent.fromJson(doc.data())).toList());
  }

  @override
  Future<bool> addFeedEvent(FeedEvent feedEvent) async {
    try {
      await _firestore.collection(_feedEventCollectionPath).add(feedEvent.toJson());

      // final documentReference = _firestore.collection(_feedEventCollectionPath).doc(feedEvent.id);
      // await _firestore.runTransaction(
      //   (transaction) async => transaction.set(
      //     documentReference,
      //     feedEvent.toJson(),
      //   ),
      // );
      // return true;
    } catch (_) {}
    return false;
  }

  @override
  Future<bool> addUser(User user) async {
    try {
      await _firestore.collection(_userCollectionPath).add(user.toJson());
      // final documentReference = _firestore.collection(_userCollectionPath).doc(user.id);
      // await _firestore.runTransaction(
      //   (transaction) async => transaction.set(
      //     documentReference,
      //     user.toJson(),
      //   ),
      // );
      return true;
    } catch (_) {}
    return false;
  }

  @override
  Future<bool> addCat(Cat cat) async {
    try {
      await _firestore.collection(_catCollectionPath).add(cat.toJson());
      // final documentReference = _firestore.collection(_catCollectionPath).doc(cat.id);
      // await _firestore.runTransaction(
      //   (transaction) async => transaction.set(
      //     documentReference,
      //     cat.toJson(),
      //   ),
      // );
      return true;
    } catch (_) {}
    return false;
  }

  @override
  Future<bool> updateCat(Cat cat) async {
    // inlike the update method, if the doc does not exist it will create it
    try {
      await _firestore.collection(_catCollectionPath).doc(cat.id).set(
            cat.toJson(),
            SetOptions(
              // merge true does not wipe other data,
              merge: true,
            ),
          );

      // final documentReference = _firestore.collection(_catCollectionPath).doc(cat.id);
      // await _firestore.runTransaction(
      //   (transaction) async => transaction.update(
      //     documentReference,
      //     cat.toJson(),
      //   ),
      // );
      return true;
    } catch (_) {}
    return false;
  }
}
