import 'package:catfeeder/modules/backend/backend.dart';

abstract class IBackendService {
  Future<void> initialize();

  Future<bool> addUser(User user);

  Future<User> getUser(String userId);

  Future<bool> addCat(Cat cat);

  Future<bool> updateCat(Cat cat);

  Future<Cat> getCat(String catId);

  Future<List<Cat>> getCatsForUser(String userId);

  Stream<List<FeedEvent>> getFeedEventsForUser(String userId);

  Stream<List<FeedEvent>> getFeedEventsForCat(String catId);

  Future<bool> addFeedEvent(FeedEvent feedEvent);
}
