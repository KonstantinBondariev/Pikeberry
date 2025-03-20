import 'package:deployment/docker/image_repository_exception.dart';
import 'package:docker2/docker2.dart';

class ImageRepository {
  final docker = Docker();
  final containers = <String, Container>{};

  void start({required String imageName, String tag = 'latest'}) {
    Image image;
    try {
      image = docker.pull('$imageName:$tag');
    } catch (e) {
      throw InvalidImageException(e.toString());
    }

    final name = _formatContainerName(imageName, tag);

    containers[name] = docker.create(image, name);
  }

  void stop({required String imageName, String tag = 'latest'}) {
    final name = _formatContainerName(imageName, tag);
    (containers.remove(name) ?? docker.findContainerByName(name))?.stop();
  }

  static String _formatContainerName(String imageName, String tag) =>
      'pikeberry.$imageName:$tag';
}
