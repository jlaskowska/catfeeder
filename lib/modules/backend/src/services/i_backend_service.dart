import 'package:catfeeder/modules/backend/backend.dart';

abstract class IBackendService {
  Future<void> initialize();
  Stream<List<FeedEvent>> getFeedEvents();
  Stream<List<Cat>> getCats();
  User getUser();
  Future<bool> setUser();
  Future<bool> setCat();
  Future<bool> setFeedEvent();
}
