import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/string_res.dart';
import 'edit_controller.dart';
import 'edit_widget.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<EditController>(id: "Update",
        builder: (controller) => Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: h * 0.07, left: w * 0.04, right: w * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commenIcon(onTap: () => Get.back()),
                  Padding(
                    padding: EdgeInsets.only(
                        left: w * 0.05, top: h * 0.018, right: w * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleText(StringRes.editAccount),
                        vertical(height: h * 0.02),
                        nameRow(),
                        vertical(height: h * 0.025),
                        commenText(StringRes.emailAdd),
                        commenTextField(
                            hintText: StringRes.personEmail,
                            textInputAction: TextInputAction.next,
                            controller: controller.emailController),
                        vertical(height: h * 0.025),
                        commenText(StringRes.dob),
                        vertical(height: h * 0.02),
                        dobField(),
                        vertical(height: h * 0.025),
                        commenText(StringRes.bio),
                        commenTextField(hintText: "Flutter Developer"),
                        vertical(height: h * 0.025),
                        commenText(StringRes.gender),
                        vertical(height: h * 0.01),
                        buttonRow()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(onTap: () => controller.updateProfile(),
              child: commenBottom(
                StringRes.updateProfile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
