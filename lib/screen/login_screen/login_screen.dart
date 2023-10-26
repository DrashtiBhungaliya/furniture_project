import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'login_controller.dart';
import 'login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GestureDetector(  behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(resizeToAvoidBottomInset: false,
        body: loginScreen(),
      ),
    );
  }
}
