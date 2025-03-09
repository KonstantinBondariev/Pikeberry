import 'package:dart_periphery/dart_periphery.dart';
import 'dart:io';

class GpioService {
  late GPIO _gpioRelay;
  late GPIO _gpioMovementSensor;

  GpioService() {
    print('Native c-periphery Version :  ${getCperipheryVersion()}');
    _configureGPIO();
    watchMovementTest();
  }

  void _configureGPIO() {
    var configOut = GPIOconfig.defaultValues();
    configOut.direction = GPIOdirection.gpioDirOut;
    _gpioRelay = GPIO.advanced(17, configOut);

    var configIn = GPIOconfig.defaultValues();
    configIn.direction = GPIOdirection.gpioDirIn;
    _gpioMovementSensor = GPIO.advanced(27, configIn);
  }

  void dispose() {
    _gpioRelay.dispose();
    _gpioMovementSensor.dispose();
  }

  void on() {
    _gpioRelay.write(true);
  }

  void off() {
    _gpioRelay.write(false);
  }

  bool isMovementDetected() {
    return _gpioMovementSensor.read();
  }

  void watchMovementTest() {
    while (true) {
      if (isMovementDetected()) {
        print('Movement detected');
      } else {
        print('No movement detected');
      }
      sleep(Duration(seconds: 1));
    }
  }

  void test() {
    var config = GPIOconfig.defaultValues();
    config.direction = GPIOdirection.gpioDirOut;

    print('Native c-periphery Version : ${getCperipheryVersion()}');
    print('GPIO test');

    var gpio = GPIO.advanced(17, config);
    // var gpio2 = GPIO(16, GPIOdirection.gpioDirOut);
    // var gpio3 = GPIO.advanced(5, config);

    print('GPIO info: ${gpio.getGPIOinfo()}');
    print('GPIO native file handle: ${gpio.getGPIOfd()}');
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
