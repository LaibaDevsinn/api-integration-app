import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../../model/email-sender-model.dart';
import '../../utils/utils.dart';

class ApiManager{
//   static sendEmail(context, String name, String email, String message)
//  async {
//     try {
//       var url=Uri.parse("http://localhost:5000/send-email");
//       var response= await http.post(url, body: {"name": name, "email": email, "message": message});
//       var res= jsonDecode(response.body);
//        showSnackBar(context, res["message"]);
//        var emailSender = EmailSender.fromJson(res); 
//       return emailSender; 
//     }
//     catch(e)
//     {
//       showSnackBar(context, e.toString());
//     }
//   }

static Future<EmailSender> sendEmail(
   BuildContext context, String name, String email, String message) async {
  try {
    var url = Uri.parse("http://localhost:5000/send-email");
    var response = await http.post(url, body: {
      "name": name,
      "email": email,
      "message": message,
    });

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      showSnackBar(context, res["message"]);
      var emailSender = EmailSender.fromJson(res);
      //print("DONE");
      return emailSender;
      
    } else {
      throw Exception("Failed to send email: ${response.statusCode}");
    }
  } catch (e) {
    showSnackBar(context, "Error: $e");
    throw e; // Re-throw the exception to be caught in emailSenderFunc
  }
}

}