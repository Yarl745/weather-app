import 'package:flutter_clean_arch/core/helper/type_aliases.dart';

abstract class UserSessionRepository {
  FutureFailable<bool> checkUserIsOnboarded();
  FutureFailable<void> setUserIsOnboarded(bool isUserOnboarded);
}
