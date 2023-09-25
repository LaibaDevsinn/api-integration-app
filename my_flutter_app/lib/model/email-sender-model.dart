class EmailSender {
  String? name;
  String? email;
  String? message;

  EmailSender({this.name, this.email, this.message});

  EmailSender.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['message'] = this.message;
    return data;
  }
}