import 'dart:convert';
import 'dart:io';

import 'package:backend/gpio_service.dart';
import 'package:dart_periphery/dart_periphery.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

final _gpioService = GpioService();

final _router = Router()..post('/gpio', _gpioHandler);

Future<Response> _gpioHandler(Request request) async {
  GpioRequestBody body;

  try {
    body = GpioRequestBody.fromJson(
      jsonDecode(await request.readAsString()),
    );
  } on StateError catch (e) {
    return Response.badRequest(body: e.message);
  }

  _gpioService.writeGPIO(
    body.line,
    body.direction,
    body.value,
  );

  return Response.ok('');
}

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;

  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(_router.call);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);

  print('Server listening on port ${server.port}');
}

class GpioRequestBody {
  final int line;
  final GPIOdirection direction;
  final bool value;

  GpioRequestBody(
    this.line,
    this.direction,
    this.value,
  );

  factory GpioRequestBody.fromJson(Map<String, dynamic> json) =>
      GpioRequestBody(
        json['line'],
        GPIOdirection.values.firstWhere(
          (value) => value.name == json['direction'],
          orElse: () => throw Exception(
            'Invalid direction. Supported values: '
            '${GPIOdirection.values.map((v) => v.name).join('|')}',
          ),
        ),
        json['value'],
      );
}
