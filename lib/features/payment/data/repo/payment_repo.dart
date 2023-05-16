import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_teach/core/error_handler/failures.dart';

abstract class PaymentRepo {
  Future<Either<Failure, Response>> getPaymentAuthRequest();
  Future<Either<Failure, Response>> getOrderRegistrationID(String price);
  Future<Either<Failure, Response>> getPaymentRequest({
    required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  });
  Future<Either<Failure, Response>> getRefCode();

  Future<Either<Failure, Response>> mobileWallet();
}
