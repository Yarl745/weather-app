import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/core/error/exceptions.dart';
import 'package:flutter_clean_arch/core/error/failures.dart';
import 'package:flutter_clean_arch/core/error/repository_request_handler.dart';
import 'package:flutter_clean_arch/core/helper/type_aliases.dart';
import 'package:flutter_clean_arch/features/user_session/data/datasource/user_session_cache_datasource.dart';
import 'package:flutter_clean_arch/features/user_session/domain/repositories/user_session_repository.dart';

class UserSessionRepositoryImpl extends UserSessionRepository {
  UserSessionRepositoryImpl({required this.userSessionCacheDatasource});

  final UserSessionCacheDatasource userSessionCacheDatasource;

  @override
  FutureFailable<bool> checkUserIsOnboarded() async {
    try {
      bool? isOnboarded = userSessionCacheDatasource.getOnboardedStatus();
      if (isOnboarded == null) {
        await userSessionCacheDatasource.setOnboardedStatus(false);
        isOnboarded = false;
      }
      return right(isOnboarded);
    } catch (error) {
      final failure = await errorHandler(error, Failure());
      return Left(failure);
    }
  }

  @override
  FutureFailable<void> setUserIsOnboarded(bool isUserOnboarded) {
    return RepositoryRequestHandler<void>()(
      request: () => userSessionCacheDatasource.setOnboardedStatus(isUserOnboarded),
      defaultFailure: Failure(),
    );
  }

  // @override
  // Failable<bool?> checkUserIsOnboarded() {
  //   return SyncRepositoryRequestHandler<bool?>()(
  //     request: () => cacheDatasource.getOnboardedStatus(),
  //     defaultFailure: Failure(),
  //   );
  // }
}
