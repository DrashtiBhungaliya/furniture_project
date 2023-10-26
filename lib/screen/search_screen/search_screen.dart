import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_listview/searchable_listview.dart';
import '../../commen/commen_widget.dart';
import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import 'controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    Get.put(LanController());
    return Scaffold(
      body: GetBuilder<LanController>(
        builder: (controller) => Padding(
          padding:
              EdgeInsets.only(top: h * 0.06, left: w * 0.04, right: w * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(onTap: () => Get.back(),
                    child: Padding(padding: EdgeInsets.only(top: h*0.015),
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        color: ColorRes.black,
                      ),
                    ),
                  ),
                  horizontal(width: w * 0.03),
                  SizedBox(
                    height: 400,
                    width: 255,
                    child: SearchableList<ItemList>.async(displayClearIcon: false,
                      inputDecoration: InputDecoration(
                        prefixIcon:const Icon(Icons.search,color: ColorRes.textGrey,),
                        contentPadding:
                            EdgeInsets.only( left: w * 0.03,bottom: h*0.0,right: w*0.02,),
                        fillColor: ColorRes.grey.withOpacity(0.5),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: ColorRes.textGrey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: ColorRes.textGrey, width: 1.5),
                        ),
                      ),
                      emptyWidget:
                          const Text('no item is found with this name'),
                      asyncListCallback: () async {
                        await Future.delayed(const Duration(microseconds: 1),);
                        return controller.sofaName;
                      },
                      asyncListFilter: (query, list) {
                        return controller.sofaName
                            .where((element) => element.name.toLowerCase().contains(query.toLowerCase()))
                            .toList();
                      },
                      builder: (displayedList, itemIndex, item) =>
                          ActorItem(itemList: displayedList[itemIndex]),
                    ),
                  ),
                  horizontal(width: w * 0.05),
                  Container(
                    height: h * 0.06,
                    width: w * 0.12,
                    decoration: BoxDecoration(
                      color: ColorRes.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(AssetsRes.dot),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class ItemList {
  String name;
  ItemList({
    required this.name,
  });
}

class ActorItem extends StatelessWidget {
  final ItemList itemList;

  const ActorItem({
    Key? key,
    required this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          itemList.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
