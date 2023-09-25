import 'package:flutter/material.dart';
import 'package:my_flutter_app/model/email-sender-model.dart';

import '../../utils/utils.dart';
import '../service/api_manager.dart';

class EmailProvider extends ChangeNotifier{
   bool isLoading = false;

  emailSenderFunc(context, {name1, email1, message1})
  async {
    if(name1.isEmpty)
    {
      //SnackBar(content: Text('Error'));
      showSnackBar(context, Text("Please! Enter your name"));
    }
    else if(email1.isEmpty)
    {
      showSnackBar(context, Text("Please! Enter your email"));
    }
    else if(message1.isEmpty)
    {
      showSnackBar(context, Text("Please! Enter  Message "));
    }
    else{
      isLoading=true;
      notifyListeners();
     EmailSender res= await ApiManager.sendEmail(context, name1, email1, message1);

     if(res!= null)
     {
     // pushUntil(context, HomeScreen());
      isLoading=false;
      notifyListeners();
     }

    }

  }
}