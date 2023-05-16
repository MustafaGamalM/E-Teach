import 'package:dio/src/response.dart';
import 'package:dartz/dartz.dart';
import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:e_teach/core/utilis/api_services.dart';
import 'package:e_teach/core/utilis/functions/api_service2.dart';
import 'package:e_teach/features/payment/data/repo/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo {
  final ApiServicePayMob _apiServices = ApiServicePayMob();

  @override
  Future<Either<Failure, Response>> getPaymentAuthRequest() async {
    try {
      var res = await _apiServices.postPayMob(
          endPoint: AppConstatns.authEndPoint,
          data: {"api_key": AppConstatns.apiKey});
      return Right(res);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getOrderRegistrationID(String price) async {
    try {
      var res = await _apiServices
          .postPayMob(endPoint: AppConstatns.orderEndPoint, data: {
        'auth_token': AppConstatns.authTokenFirst,
        "delivery_needed": "false",
        "amount_cents": price,
        "currency": "EGP",
        "items": [],
      });
      return Right(res);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getPaymentRequest({
    required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    try {
      var res = await _apiServices
          .postPayMob(endPoint: AppConstatns.paymentKeyEndPoint, data: {
        "auth_token": AppConstatns.authTokenFirst,
        "amount_cents": price,
        "expiration": 3600,
        "order_id": AppConstatns.orderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": AppConstatns.paymentCardId,
        "lock_order_when_paid": "false"
      });
      return Right(res);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> getRefCode() async {
    try {
      var res = await _apiServices
          .postPayMob(endPoint: AppConstatns.refCodeEndPoint, data: {
        "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
        "payment_token": AppConstatns.finalPaymentToken
      });
      return Right(res);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> mobileWallet() async {
    try {
      var res = await _apiServices
          .postPayMob(endPoint: AppConstatns.refCodeEndPoint, data: {
        "source": {"identifier": "AGGREGATOR", "subtype": "WALLET"},
        "payment_token": AppConstatns.finalPaymentToken
      });
      return Right(res);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
