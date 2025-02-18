import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Services {
  // Function to open the URL's
  static Future<void> launchURL(strUrl) async {
    var url = Uri.parse(strUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Can not launch url $url ");
    }
  }

  // Function to make phone calls
  static void makePhoneCall(n) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: n,
    );
    await launchUrl(phoneUri);
  }

  // Function to send email
  static void sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'pavanasonawane@gmail.com', // Replace with your email
      query: encodeQueryParameters(<String, String>{
        'subject': 'Inquiry from Portfolio Website',
      }),
    );
    await launchUrl(emailUri);
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  // Function to send email from contact us form using EmailJS API.
  static Future<http.Response> sendEmailFromContactUsForm(String name, String email, String message) async {
    const serviceId = 'your_service_id';
    const templateId = 'your_template_id';
    const userId = 'your_user_id';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'name': name,
          'email': email,
          'message': message,
        },
      }),
    );

    return response;
  }
}
