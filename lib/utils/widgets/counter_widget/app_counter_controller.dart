import 'package:get/get.dart';
import 'package:partyspot/utils/classes/base_controller.dart';

class AppCounterController extends BaseController {
  final int lowerLimit;
  final RxInt _counter;

  AppCounterController({this.lowerLimit = 1, int initialValue = 1})
      : _counter = (initialValue < lowerLimit ? lowerLimit : initialValue).obs;

  int get counter => _counter.value;

  set counter(int value) {
    if (value >= lowerLimit) {
      _counter.value = value;
    }
  }

  void increment() {
    counter = counter + 1;
  }

  void decrement() {
    if (counter > lowerLimit) {
      counter = counter - 1;
    }
  }

  RxInt get counterRx => _counter;
}