import 'package:weatherapp/core/helper/hive_names.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class UserSessionCacheDatasource {
  bool? getOnboardedStatus();
  Future<void> setOnboardedStatus(bool isOnboarded);
}

class UserSessionCacheDatasourceImpl extends UserSessionCacheDatasource {
  final Box userSessionDataBox;

  UserSessionCacheDatasourceImpl(this.userSessionDataBox);

  @override
  bool? getOnboardedStatus() {
    return userSessionDataBox.get(HiveNames.isOnborded) as bool?;
  }

  @override
  Future<void> setOnboardedStatus(bool isOnboarded) async {
    await userSessionDataBox.put(HiveNames.isOnborded, isOnboarded);
  }
}
