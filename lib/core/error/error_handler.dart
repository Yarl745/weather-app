import 'package:dio/dio.dart';
import 'package:weatherapp/core/error/failures.dart';
import 'package:weatherapp/core/error/server_error.dart';
import 'package:weatherapp/core/network/network_info.dart';
import 'package:weatherapp/injection_container.dart';

Future<Failure> errorHandler(Object error, Failure? defaultFailure) async {
  try {
    if (error is DioException) {
      if (error.response != null) {
        if (error.response!.statusCode == 403 || error.response!.statusCode == 401) {
          return UnauthorizedFailure();
        } else if (error.response!.statusCode == 403 && defaultFailure is ProfileFailure) {
          return UnauthorizedFailure();
        }
        ServerError serverError = ServerError.fromJson(error.response?.data ?? {});
        return Failure(
            errorMessage: serverError.detail != null && serverError.detail!.isNotEmpty
                ? serverError.detail!
                : "Sorry, we cannot process your request at the moment. Please contact the support team.");
      }
    }

    final networkInfo = sl<NetworkInfo>();
    if (!(await networkInfo.isConnected)) {
      return InternetConnectionFailure();
    }

    return defaultFailure!;
  } catch (err) {
    return const Failure();
  }
}
