import 'dart:math';

import 'package:drop_number_game/models/tile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with StateMixin<List<List<TileModel>>> {
  RxnInt selectedRow = RxnInt();

  RxList<RxList<TileModel>> list = RxList();

  int newValue = 0;

  @override
  void onReady() {
    super.onReady();

    list.value = List.generate(
      5,
      (index) => RxList.generate(5, (index) {
        return TileModel(name: generateValue());
      }),
    );

    change(list, status: RxStatus.success());
  }

  void checkCombinations() {
    for (int mainIndex = 0; mainIndex < list.length; mainIndex++) {
      for (int index = 0; index < list[mainIndex].length - 1; index++) {
        if (list[mainIndex][index].name == list[mainIndex][index + 1].name) {
         int value =  list[mainIndex][index].name;
         list[mainIndex].removeAt(index);
         list[mainIndex].removeAt(index);

         list[mainIndex].add(TileModel(name: value * 2));

        }
      }
    }
  }

  int generateValue(){

    num value = pow(2, 2 + Random().nextInt(4));
    return  value.toInt();



  }


}
