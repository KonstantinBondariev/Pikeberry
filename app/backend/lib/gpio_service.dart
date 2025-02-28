import 'package:dart_periphery/dart_periphery.dart';
import 'dart:io';


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

void test() {
  var config = GPIOconfig(
    GPIOdirection.gpioDirOut, 
    GPIOedge.none, 
    GPIObias.defaultBias, 
    GPIODrive.defaultDrive, 
    false, 
    'test_gpio'
  );

  print('Native c-periphery Version : ${getCperipheryVersion()}');
  print('GPIO test');

  var gpio = GPIO.advanced(18, config); // Используем GPIO.advanced

  print('GPIO info: ' + gpio.getGPIOinfo());

  for (var i = 0; i < 10; ++i) {
    gpio.write(true);
    sleep(Duration(milliseconds: 200));
    gpio.write(false);
    sleep(Duration(milliseconds: 200));
  }

  gpio.dispose();
}

}
