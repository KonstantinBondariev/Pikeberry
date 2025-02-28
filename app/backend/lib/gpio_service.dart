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

void test() {
  var config = GPIOconfig();
  config.direction = GPIOdirection.gpioDirOut;
  print('Native c-periphery Version :  ${getCperipheryVersion()}');
  print('GPIO test');
  var gpio = GPIO(18, GPIOdirection.gpioDirOut);
  // var gpio2 = GPIO(16, GPIOdirection.gpioDirOut);
  // var gpio3 = GPIO.advanced(5, config);

  print('GPIO info: ' + gpio.getGPIOinfo());

  print('GPIO native file handle: ${gpio.getGPIOfd()}');
  print('GPIO chip name: ${gpio.getGPIOchipName()}');
  print('GPIO chip label: ${gpio.getGPIOchipLabel()}');
  print('GPIO chip name: ${gpio.getGPIOchipName()}');
  print('GPIO chip label: ${gpio.getGPIOchipLabel()}');

  for (var i = 0; i < 10; ++i) {
    gpio.write(true);
    // gpio2.write(true);
    // gpio3.write(true);
    sleep(Duration(milliseconds: 200));
    gpio.write(false);
    // gpio2.write(false);
    // gpio3.write(false);
    sleep(Duration(milliseconds: 200));
  }

  gpio.dispose();
  // gpio2.dispose();
  // gpio3.dispose();
}

}
