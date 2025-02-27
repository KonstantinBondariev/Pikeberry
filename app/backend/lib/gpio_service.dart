import 'package:dart_periphery/dart_periphery.dart';

class GpioService {
  GpioService() {
    print('Native c-periphery Version :  ${getCperipheryVersion()}');
  }

  void writeGPIO(int line, GPIOdirection direction, bool value) {
    final gpio = GPIO(line, direction);

    print('GPIO info: ${gpio.getGPIOinfo()}');
    print('GPIO native file handle: ${gpio.getGPIOfd()}');
    print('GPIO chip name: ${gpio.getGPIOchipName()}');
    print('GPIO chip label: ${gpio.getGPIOchipLabel()}');

    try {
      gpio.write(value);
    } catch (e) {
      print(e);
    } finally {
      gpio.dispose();
    }
  }
}
