import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:medicalty/helpers/show_custom_dialog.dart';

class Utiles {
  static const privacyPolicyURL = "";
  static const suppurtEmail = "";

  // static Future<String> downloadFile(String url, String fileName) async {
  //   final dio = Dio();
  //   final directory = await getApplicationDocumentsDirectory();
  //   final filePath = '${directory.path}/$fileName';
  //   await dio.download(url, filePath);
  //   // final file = File(filePath);

  //   // await file.writeAsBytes(response);

  //   return filePath;
  // }

  static Future<bool> deleteItem(BuildContext context,
      {String? message}) async {
    final res = await ShowCustomDialog.showConfirmationDialogMessage(
      // context,
      message ?? 'Do you really want to delete?',
      'Delete Confirmation',
      icon: 'delete',
    );

    return res;
  }

  static Future<bool> editItem(BuildContext context, {String? message}) async {
    final res = await ShowCustomDialog.showConfirmationDialogMessage(
      // context,
      message ?? 'Do you really want to update?',
      'Update Confirmation',
      icon: 'edit',
    );

    return res;
  }

  static Future<bool> replaceItem(BuildContext context,
      {String? message}) async {
    final res = await ShowCustomDialog.showConfirmationDialogMessage(
      // context,
      message ?? 'Do you really want to replace?',
      'Replace Confirmation',
      icon: 'replace',
    );

    return res;
  }

  static String generateRandomString() {
    final rand = Random();
    final results = String.fromCharCodes(
        List.generate(20, (index) => rand.nextInt(33) + 89));

    return results;
  }

  static String getCountString(int count) {
    if (count < 1000) {
      return count.toString();
    } else if ((count / 1000) < 1000) {
      final stringCount = (count / 1000).truncate();
      return '${stringCount}K';
    } else if ((count / 1000000) < 1000) {
      final stringCount = (count / 1000000).truncate();
      return '${stringCount}M';
    }
    return count.toString();
  }

  static Future<void> call(String phoneNumber) async {
    try {
      final tel = 'tel: $phoneNumber';
      final uri = Uri.parse(tel);
      final canLaunch = await canLaunchUrl(uri);
      if (canLaunch) {
        await launchUrl(uri);
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  static String? encodeQueryParameter(Map<String, String> param) {
    return param.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static Future<void> email(
    String email, {
    bool isLinkFull = false,
    String subject = '',
    String body = '',
  }) async {
    late Uri uri;
    if (isLinkFull) {
      uri = Uri.parse(email);
      return;
    } else {
      uri = Uri(
        scheme: 'mailto',
        path: email,
        query: encodeQueryParameter({
          'subject': subject,
          'body': body,
        }),
      );
    }
    // final ema = !isLinkFull ? 'mailto: $email' : email;
    final canLaunch = await canLaunchUrl(uri);
    if (canLaunch) {
      await launchUrl(uri);
    }
  }

  static Future<void> visitSite(
    String siteUrl,
  ) async {
    final uri = Uri.parse(siteUrl);
    final canLaunch = await canLaunchUrl(uri);
    if (canLaunch) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
