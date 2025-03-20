import 'dart:io';

import 'package:deployment/controller/deployment_controller.dart';
import 'package:deployment/docker/image_repository.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;
  final router = Router();

  for (final controller in [DeploymentController(ImageRepository())]) {
    controller.bindRoutes(router);
  }

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router.call);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);

  print('Server listening on port ${server.port}');
}
