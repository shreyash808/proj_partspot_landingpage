import 'package:get/get.dart';

class ValueController<T> extends GetxController {
  final Rxn<T?> _value;

  ValueController([T? initialValue]) : _value = Rxn<T?>(initialValue);

  void updateValue(T? newValue) {
    _value.value = newValue;
  }

  T? get value => _value.value;

}

class ValueControllerList<T> extends GetxController {
  final RxList<T?> _value;

  ValueControllerList([List<T?>? initialValue])
      : _value = RxList<T?>(initialValue ?? []);

  void updateValue(List<T?> newValue) {
    _value.assignAll(newValue);
  }

  List<T?> get value => _value;
}
