import 'package:dart_periphery/dart_periphery.dart';

class GpioController {
  final Map<int, GPIO> _gpioMap;

  GpioController({Map<int, GPIOdirection>? gpioMap})
    : _gpioMap =
          gpioMap?.map(
            (line, direction) => MapEntry(
              line,
              GPIO.advanced(
                line,
                GPIOconfig.defaultValues()..direction = direction,
              ),
            ),
          ) ??
          {} {
    print('Native c-periphery Version :  ${getCperipheryVersion()}');
  }

  bool read(int line) {
    final gpio = _gpioMap[line];
    if (gpio == null) {
      throw Exception('GPIO $line not configured');
    }

    if (gpio.direction == GPIOdirection.gpioDirIn) {
      throw Exception('GPIO $line is configured as input');
    }

    return gpio.read();
  }

  void write(int line, bool value) {
    final gpio = _gpioMap[line];
    if (gpio == null) {
      throw Exception('GPIO $line not configured');
    }

    if (gpio.direction != GPIOdirection.gpioDirIn) {
      throw Exception('GPIO $line is configured as ${gpio.direction}');
    }

    gpio.write(value);
  }

  void dispose() {
    for (final gpio in _gpioMap.values) {
      gpio.dispose();
    }
  }
}
