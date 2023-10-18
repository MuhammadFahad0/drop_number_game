import 'dart:math';

import 'package:get/get.dart';

class HomeController extends GetxController
    with StateMixin<Map<int, List<RxInt>>> {
  RxnInt selectedRow = RxnInt();

  RxMap<int, RxList<RxInt>> list = RxMap({});

  int newValue = 0;

  @override
  void onReady() {
    super.onReady();

    List.generate(5, (index) => list[index] = RxList());

    change(list, status: RxStatus.success());
  }

  void checkCombinations() {
    bool itemRemoved = false;

    list.forEach((parentIndex, value) {
      for (int index = 0; index < list[parentIndex]!.length - 1; index++) {
        if (list[parentIndex]![index] == list[parentIndex]![index + 1]) {
          list[parentIndex]!.removeAt(index);
          list[parentIndex]![index].value = list[parentIndex]![index].value * 2;

          itemRemoved = true;
        }
      }
    });

    list.forEach((parentIndex, value) {




    });

    if (itemRemoved) {
      checkCombinations();
    }
  }

  int generateValue() {
    num value = pow(2, 2 + Random().nextInt(4));
    return value.toInt();
  }
}
