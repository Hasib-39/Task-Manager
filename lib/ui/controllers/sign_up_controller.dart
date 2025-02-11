import 'package:get/get.dart';

import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class SignUpController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> registerUser(String email, String firstName, String lastName, String mobileNo, String password) async {
    bool isSuccess = false;
    _inProgress = true;
    Map<String, dynamic> requestParams = {
      "email":email,
      "firstName":firstName,
      "lastName":lastName,
      "mobile":mobileNo,
      "password":password,
      "photo":""
    };
    final NetworkResponse response = await NetworkCaller.postRequest(url: Urls.registrationUrl, body: requestParams);
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = "Registration Successful";
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}