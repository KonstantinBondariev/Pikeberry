import 'package:pikeberry_backend/gpio/gpio_controller.dart';

class GpioControllerFake implements GpioController {
  final Map<int, bool> _state = {};

  @override
  void dispose() {}

  @override
  bool read(int line) => _state[line] ?? false;

  @override
  void write(int line, bool value) => _state[line] = value;
}
