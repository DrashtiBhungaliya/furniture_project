import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../commen/commen_widget.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';
import 'delivery_controller.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: GetBuilder<DeliveryController>(
          id: "Update",
          builder: (controller) => Padding(
            padding:
            EdgeInsets.only(left: w * 0.05, top: h * 0.04, right: w * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commenIcon(onTap:()=>Get.back() ),
                commenText(StringRes.deliveryLocation),
                InkWell(onTap: () => controller.onTap(),
                    child: const Icon(Icons.location_on)),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<DeliveryController>(builder: (dcontroller) =>Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: w * 0.08, top: h * 0.0, right: w * 0.08),
            child: Column(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 400,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: GoogleMap(
                      initialCameraPosition:dcontroller.kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        dcontroller.con.complete(controller);
                      },
                      markers: Set<Marker>.of(dcontroller.marker),
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      compassEnabled: true,
                    ),
                  ),
                ),
                vertical(height: h*0.025),
                const  Divider(
                  color: ColorRes.grey,
                ),
                vertical(height: h*0.025),
              dcontroller.add.isEmpty? const SizedBox():
              Container(
                height: h * 0.18,
                width: w,padding: EdgeInsets.only(top: h*0.025),
                decoration: BoxDecoration(
                    color: ColorRes.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    horizontal(width: w*0.06),
                    const Icon(Icons.home_filled),
                    horizontal(width: w*0.06),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commenText(StringRes.home),
                        vertical(height: h*0.01),
                        Text(
                          dcontroller.add,
                          style: const TextStyle(
                              color: ColorRes.textGrey,
                              fontSize: 14,
                              fontFamily: "Regular"),
                        ),
                        vertical(height: h*0.003),
                        Text(
                          dcontroller.add1,
                          style: const TextStyle(
                              color: ColorRes.textGrey,
                              fontSize: 14,
                              fontFamily: "Regular"),
                        ),
                        vertical(height: h*0.01),
                        const  Text(
                          StringRes.personName,
                          style: TextStyle( fontFamily: "Regular",
                            color: ColorRes.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              ],
            ),
          ),
          const Spacer(),
          commenBottom( StringRes.addNew,)
        ],
      ) ,),
    );
  }
}
