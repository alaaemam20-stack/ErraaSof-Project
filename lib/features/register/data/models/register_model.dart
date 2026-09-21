

class RegisterRequestModel {

  final String name;

  final String email;

  final String password;

  final String confirmationPassword;


  RegisterRequestModel({required this.name,required this.email, required this.password,
    required this.confirmationPassword
  });



  Map<String, dynamic> toJson()=>{
    'name': name,
    'email':email,
    'password':password,
    'password_confirmation':confirmationPassword
  };

}