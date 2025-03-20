import 'dart:io';

import 'package:ioc_container/ioc_container.dart';
import 'package:pikeberry_backend/gpio/gpio_controller.dart';
import 'package:grpc/grpc.dart';
import 'package:pikeberry_backend/gpio/gpio_controller_fake.dart';
import 'package:pikeberry_backend/gpio/gpio_service.dart';

void main(List<String> args) async {
  final container = _bootstrap();

  final server = Server.create(
    services: [GpioService(gpioController: container<GpioController>())],
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '50051');

  await server.serve(address: ip, port: port);

  print('Server listening on port ${server.port}...');
}

IocContainer _bootstrap() {
  final builder =
      IocContainerBuilder()
        ..addSingleton(
          (container) =>
              Platform.environment['ENVIRONMENT'] == 'test'
                  ? GpioControllerFake()
                  : GpioController(),
        )
        ..add(
          (container) =>
              GpioService(gpioController: container<GpioController>()),
        );

  return builder.toContainer();
}
