import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';




class MailServices {
 static void sendMail(String mail)=> launch("mailto:$mail");
}


GetIt locator = GetIt.asNewInstance();

void setUpLocation() {
  locator.registerSingleton(MailServices());
}