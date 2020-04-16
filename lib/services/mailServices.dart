import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future mail(String mobNumber) async {
  print("mail function is call---------------------------------");
  String username = 'propertymap1981@gmail.com';
  String password = 'property@1981Maps';

  final smtpServer = gmail(username, password);
  // Create our message.
  final message = Message()
    ..from = Address(username, '1981 map')
    ..recipients.add('propertymap1981@gmail.com')
    ..subject = 'Phone No of logger in 1981 Maps'
    ..text = 'This $mobNumber number is verifyied and sent by 1981 maps .';

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
  // DONE
  // Sending multiple messages with the same connection
  //
  // Create a smtp client that will persist the connection
  var connection = PersistentConnection(smtpServer);

  // Send the first message
  await connection.send(message);

  // close the connection
  await connection.close();
}
