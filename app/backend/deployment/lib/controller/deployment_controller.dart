import 'package:deployment/controller/controller.dart';
import 'package:deployment/docker/image_repository.dart';
import 'package:deployment/docker/image_repository_exception.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class DeploymentController implements Controller {
  final ImageRepository _imageRepository;

  DeploymentController(this._imageRepository);

  @override
  void bindRoutes(Router router) {
    router.get('/start', _start);
  }

  Response _start(Request req) {
    final service = req.url.queryParameters['service'];
    if (service == null) {
      return Response.badRequest(body: '"service" parameter is required');
    }

    final tag = req.url.queryParameters['tag'];
    if (tag == null) {
      return Response.badRequest(body: '"tag" parameter is required');
    }

    try {
      _imageRepository.start(imageName: service, tag: tag);
    } on InvalidImageException catch (e) {
      return Response.badRequest(body: e.message);
    }

    return Response.ok('Container started');
  }
}
