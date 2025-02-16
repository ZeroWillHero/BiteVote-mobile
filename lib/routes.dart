import 'package:bitevote/views/home/home_page.dart';
import 'package:get/get.dart';
import 'package:bitevote/views/auth/login_page.dart';
import 'package:bitevote/views/auth/register_page.dart';

final pages = [
  GetPage(name: '/', page: () => LoginPage()),
  GetPage(name: "/login", page: () => LoginPage()),
  GetPage(name: "/register", page: () => RegisterPage()),
  GetPage(name: '/home', page: () => HomePage())
];
