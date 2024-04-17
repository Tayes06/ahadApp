import 'package:flutter/foundation.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

void sendMail(
    String recipientEmail, String mailMessage, String mailObjet) async {
  String username = 'desmondtayes6@gmail.com';
  String password = 'fuyt teil xqet uyow';
  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username, 'Service-AHAD')
    ..recipients.add(recipientEmail)
    ..subject = mailObjet
    ..text = mailMessage;

  try {
    await send(message, smtpServer);
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }
}
