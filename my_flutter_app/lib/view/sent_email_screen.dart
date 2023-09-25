import 'package:flutter/material.dart';
import 'package:my_flutter_app/common/custom_textformfield.dart';
import 'package:my_flutter_app/controller/provider/email_provider.dart';
import 'package:provider/provider.dart';

class SendEmailScreen extends StatefulWidget {
  const SendEmailScreen({super.key});

  @override
  State<SendEmailScreen> createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {
   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        var provider = context.watch<EmailProvider>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text("Send your email"),
          ),
          body: provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Stack(children: [
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
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(children: [
                                CustomTextFormField(
                                  text: 'Name',
                                  con: nameController,
                                ),
                                CustomTextFormField(
                                  text: 'Email',
                                  con: emailController,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                      controller: messageController,
                                      keyboardType: TextInputType.multiline,
                                      minLines: 4,
                                      maxLines: 5,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(15),
                                        hintText: "Message",
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 143, 136, 136),
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
                          child: ElevatedButton(
                              onPressed: () {
                                var provider = context.read<EmailProvider>();
                                provider.emailSenderFunc(context,
                                    name1: nameController.text,
                                    email1: emailController.text,
                                    message1: messageController.text);
                              },
                              child:const Text('Send'))))
                ]),
        );
      }),
    );
  }
}
