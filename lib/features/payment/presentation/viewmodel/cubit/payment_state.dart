part of 'payment_cubit.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

//  auth states

class GetPaymentAuthRequestLoadingSatate extends PaymentState {}

class GetPaymentAuthRequestSuccessSatate extends PaymentState {}

class GetPaymentAuthRequestErrorSatate extends PaymentState {}

// orders states

class GetOrderRegistrationLoadingState extends PaymentState {}

class GetOrderRegistrationSuccessState extends PaymentState {}

class GetOrderRegistrationErrorState extends PaymentState {}

// payment key request

class GetPaymentKeyLoadingState extends PaymentState {}

class GetPaymentKeySuccessState extends PaymentState {}

class GetPaymentKeyErrorState extends PaymentState {}

// ref code

class GetRefCodeLoadingState extends PaymentState {}

class GetRefCodeSuccessState extends PaymentState {}

class GetRefCodeErrorState extends PaymentState {}

// wallet code

class GetWalletCodeLoadingState extends PaymentState {}

class GetWalletCodeSuccessState extends PaymentState {}

class GetWalletCodeErrorState extends PaymentState {}
