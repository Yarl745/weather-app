import 'package:equatable/equatable.dart';

import 'error_model.dart';

class Failure extends Equatable {
  @override
  List<Object> get props => [];

  final String errorMessage;
  final List<ErrorModel>? errorData;
  final int? errorCode;

  const Failure({this.errorMessage = 'Unexpected error occurred', this.errorCode, this.errorData});

  @override
  String toString() {
    return "Failure(errorMessage: $errorMessage, errorData $errorData, errorCode: $errorCode)";
  }
}

// General failures
class InternetConnectionFailure extends Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class UnauthorizedFailure extends Failure {}

class ProfileFailure extends Failure {}
