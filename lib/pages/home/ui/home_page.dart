
import 'package:drop_number_game/models/tile_model.dart';
import 'package:drop_number_game/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: controller.obx(
          (s) => GestureDetector(

            onHorizontalDragStart: (details) {
           controller.newValue = controller.generateValue();
            },
            onHorizontalDragUpdate: (details) {
              if (details.globalPosition.dx < 65 * 1) {
                controller.selectedRow.value = 0;
              } else if (details.globalPosition.dx < 65 * 2) {
                controller.selectedRow.value = 1;
              } else if (details.globalPosition.dx < 65 * 3) {
                controller.selectedRow.value = 2;
              } else if (details.globalPosition.dx < 65 * 4) {
                controller.selectedRow.value = 3;
              } else if (details.globalPosition.dx < 65 * 5) {
                controller.selectedRow.value = 4;
              } else if (details.globalPosition.dx < 65 * 6) {
                controller.selectedRow.value = 5;
              }
            },
            onHorizontalDragEnd: (details) {

              controller.list[controller.selectedRow.value!]
                  .add(TileModel(name: controller.newValue));
              controller.checkCombinations();
              controller.selectedRow.value = null;
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(
                          5,
                          (index) => columnBuilder(
                              list: controller.list[index],
                              index: index)).toList()
                    ]),
              ),
            ),
          ),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget columnBuilder({required List<TileModel> list, required int index}) {
    return SizedBox(child: Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...list.map((name) => card(name: name.name)),
          if (index == controller.selectedRow.value)
            card(
              name: controller.newValue,
              lowOpacity: true,
            ),
        ],
      );
    }));
  }

  Widget card({required int name, bool lowOpacity = false}) =>
      Container(
        decoration: BoxDecoration(
            color: lowOpacity
                ? generateColor(name).withOpacity(0.5)
                : generateColor(name),
            borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.all(5),
        width: 60,
        height: 60,
        child: Center(
          child: Text(name.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
        ),
      );




 Color generateColor(int value){
   switch (value) {
     case 2:
       return Colors.blue;
     case 4:
       return Colors.orange;
     case 8:
       return Colors.pink;
     case 16:
       return Colors.yellow;
     case 32:
       return Colors.lightGreen;
     case 64:
       return Colors.purple;
   }
   return Colors.black;
  }


}
