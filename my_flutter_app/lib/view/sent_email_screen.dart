import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_flutter_app/common/custom_textformfield.dart';

class SendEmailScreen extends StatefulWidget {
  const SendEmailScreen({super.key});

  @override
  State<SendEmailScreen> createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {
  final TextEditingController toController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController textController = TextEditingController();

   Future<void> sendEmail() async {
    final url = Uri.parse('http://your-nodejs-server-url/send-email');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'to': toController.text,
        'subject': subjectController.text,
        'text': textController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Email sent successfully
      print('Email sent successfully');
    } else {
      // Failed to send email
      print('Failed to send email');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Send your email"),
      ),
      body: Stack(children: [
        Positioned(
          top: 150,
          left: 10,
          right: 10,
          child: Container(
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 233, 230, 230)),
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Send Email Message",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(children: [
                      CustomTextFormField(
                        text: 'To',con: toController,
                      ),
                      CustomTextFormField(
                        text: 'sunject',con:subjectController ,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child:  TextFormField(
                            controller: textController,
                            keyboardType: TextInputType.multiline,
                            minLines: 4,
                            maxLines: 5,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                              hintText: "Message",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 143, 136, 136),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 480,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(onPressed: sendEmail, child: Text('Send'))
            ))
      ]),
    );
  }
}
