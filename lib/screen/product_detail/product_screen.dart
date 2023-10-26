import 'package:flutter/material.dart';
import 'package:furniture_project/screen/product_detail/product_controller.dart';
import 'package:furniture_project/screen/product_detail/product_widget.dart';

import 'package:get/get.dart';

import '../../commen/commen_widget.dart';
import '../../utils/string_res.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    return  Scaffold(
     appBar: productAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: w*0.04),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //detailContainor(),
              vertical(height: h*0.015),
             // productName(),
              vertical(height: h*0.015),
              color(),
              vertical(height: h*0.015),
             //description(),
              vertical(height: h*0.015),
             //categories(),
              vertical(height: h*0.012),
              text(),
              vertical(height: h*0.01),
              rating(),
              vertical(height: h*0.012),
              commenText(StringRes.similarItems),
              vertical(height: h*0.012),
              listViewItem(),
              vertical(height: h*0.02),
              addToCart(),
              vertical(height: h*0.09),

            ],
          ),
        ),
      ),
    );
  }
}
