import 'package:grpc/service_api.dart';
import 'package:pikeberry/generated/gpio.pbgrpc.dart';
import 'package:pikeberry/gpio/gpio_controller.dart';

class GpioService extends GpioServiceBase {
  final GpioController _gpioController;

  GpioService({required GpioController gpioController})
    : _gpioController = gpioController;

  @override
  Future<GpioState> read(ServiceCall call, Lines request) {
    final state = <int, bool>{};
    for (final line in request.lines) {
      state[line] = _gpioController.read(line);
    }

    return Future.value(GpioState(lineStates: state));
  }

  @override
  Future<Empty> write(ServiceCall call, GpioState request) {
    for (final entry in request.lineStates.entries) {
      _gpioController.write(entry.key, entry.value);
    }

    return Future.value(Empty());
  }
}
