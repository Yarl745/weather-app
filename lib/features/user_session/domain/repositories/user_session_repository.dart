import 'package:weatherapp/core/helper/type_aliases.dart';

abstract class UserSessionRepository {
  FutureFailable<bool> checkUserIsOnboarded();
  FutureFailable<void> setUserIsOnboarded(bool isUserOnboarded);
}
