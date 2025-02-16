import 'dart:convert';

import 'package:bitevote/components/snackBars/failed.dart';
import 'package:bitevote/components/snackBars/success.dart';
import 'package:bitevote/models/user_model.dart';
import 'package:bitevote/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  var user = Rxn<UserModel>();
  var isloading = false.obs;
  var isValidStId = false.obs;
  void setIsLoading(bool value) {
    isloading.value = value;
  }

  Future<void> login(String email, String password) async {
    try {
      setIsLoading(true);
      final response = await _authService.login(email, password);
      user.value = UserModel.fromJson(response);
      // print(user.value!.token);
      // print("email user " + user.value!.email.toString());
      user.value = UserModel.fromJson(response);
      setIsLoading(false);
      SuccessSnackBar.show('Login Successful');
      Get.toNamed('/home');
    } catch (e) {
      FailedSnackBar.show(e.toString().replaceAll('Exception: ', ''));
      setIsLoading(false);
    }
  }

  Future<void> register(String firstname, String lastname, String email,
      String password, String nic, String phone, String address) async {
    try {
      setIsLoading(true);
      final response = await _authService.register(
          firstname, lastname, email, password, nic, phone, address);
      user.value = UserModel.fromJson(response);
      setIsLoading(false);
      SuccessSnackBar.show('Registration Successful');
      Get.toNamed('/login');
    } catch (e) {
      FailedSnackBar.show(e.toString().replaceAll('Exception: ', ''));
      setIsLoading(false);
    }
  }

  // Check if student ID is valid
  Future<void> validate(String firstname, String lastname, String email,
      String password, String nic, String phone, String address) async {
    String apiUrl =
        "https://bitevote-userregister.onrender.com/api/students/getUserById/$nic";

    setIsLoading(true);
    print("Validating Student ID");
    try {
      final response = await http.get(Uri.parse(apiUrl));
      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        isValidStId.value = true;
        await register(
            firstname, lastname, email, password, nic, phone, address);
      } else {
        isValidStId.value = false;
        FailedSnackBar.show(responseData['error'] ?? "Invalid Student ID");
      }
    } catch (e) {
      FailedSnackBar.show("Error validating Student ID");
    } finally {
      setIsLoading(false);
    }
  }

  // Future<void> checkIsLogged (token) {

  // }
}
