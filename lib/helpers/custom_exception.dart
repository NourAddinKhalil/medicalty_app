import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class CustomException implements Exception, Equatable {
  final String _errorMessage;
  CustomException(this._errorMessage);
  // {
  //   print(errorMessage);
  // }

  String get errorMessage {
    if (_errorMessage.contains('permission-denied')) {
      return 'ليست لديك الصلاحية لعمل هذة العملية';
    } else if (_errorMessage.toString().contains('user-disabled')) {
      return 'هذا الحساب معطل يرجى مراجعة إدارة التطبيق إذا كان لديك مشكلة مع هذا القرار';
    } else if (_errorMessage.toString().contains('uid-already-exists')) {
      return 'المستخدم موجود بالفعل';
    } else if (_errorMessage.toString().contains('user-not-found')) {
      return 'هذا المستخدم غير موجود';
    } else if (_errorMessage.toString().contains('missing-uid')) {
      return 'حدث خطأ يرجى تسجيل الدخول مرة أخرى';
    } else if (_errorMessage.toString().contains('invalid-uid')) {
      return 'حدث خطأ يرجى تسجيل الدخول مرة أخرى';
    } else if (_errorMessage.toString().contains('id-token-expired')) {
      return 'حدث خطأ يرجى تسجيل الدخول مرة أخرى';
    } else if (_errorMessage.toString().contains('not-online')) {
      return 'انت غير متصل يالإنترنت!';
    } else if (_errorMessage.toString().contains('not-logged-in')) {
      return 'يجب عليك تسجيل الدخول لإكمال العملية!';
    } else if (_errorMessage.toString().contains('tripID-not-Found')) {
      return 'لا يوجد معرف الرحلة!';
    } else if (_errorMessage.toString().contains('number-not-found')) {
      return 'لم يتم العثور على الرقم إذا حدثت هذه المشكلة مرة أخرى يرجى التواصل بفريق الدعم!';
    } else if (_errorMessage.toString().contains('error-occur')) {
      return 'حدث خطأ يرجى المحاولة مرة أخرى';
    } else if (_errorMessage.toString().contains('trip-not-found')) {
      return 'لا توجد رحلة حالية لهذا المستخدم أو أن المستخدم قام بحذف الرحلة';
    } else if (_errorMessage.toString().contains('code-not-received')) {
      return 'رسالة التحقق لم تصلك بعد !';
    } else if (_errorMessage.toString().contains('phone-error')) {
      return 'يرجى إدخال رقم صحيح !';
    } else if (_errorMessage.toString().contains('invalid-code')) {
      return 'رمز التأكد غير صحيح !';
    }
    debugPrint('Errooor: $_errorMessage');
    return _errorMessage;
  }

  @override
  List<Object?> get props => [errorMessage];

  @override
  bool? get stringify => true;

  @override
  String toString() {
    return 'CustomException(errorMessage: $errorMessage)';
  }
}
