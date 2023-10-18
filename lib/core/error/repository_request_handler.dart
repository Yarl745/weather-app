import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/error/error_handler.dart';
import 'package:weatherapp/core/helper/type_aliases.dart';

import 'failures.dart';

class RepositoryRequestHandler<T> {
  FutureFailable<T> call({
    Failure? defaultFailure,
    required Future<T> Function() request,
  }) async {
    try {
      return Right((await request()));
    } catch (error) {
      final failure = await errorHandler(error, defaultFailure);
      //var _errorMessage = '[ERROR] Failure: ${failure.toString()}; Error: ${error.toString()};';
      return Left(failure);
    }
  }
}

class SyncRepositoryRequestHandler<T> {
  Failable<T> call({
    Failure? defaultFailure,
    required T Function() request,
  }) {
    try {
      return Right(request());
    } catch (error) {
      return Left(defaultFailure ?? Failure(errorMessage: error.toString()));
    }
  }
}
