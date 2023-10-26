import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'forgot_controller.dart';
import 'forgot_widget.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotController());
    return GestureDetector(  behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(resizeToAvoidBottomInset: true,
        body: forgotScreen(),
      ),
    );
  }
}
