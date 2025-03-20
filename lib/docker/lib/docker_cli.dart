import 'dart:io';

import 'docker.dart';

typedef ProcessRun =
    Future<ProcessResult> Function(String executable, List<String> arguments);

class DockerCLI implements Docker {
  final ProcessRun _processFactory;

  DockerCLI({ProcessRun? processRun})
    : _processFactory =
          processRun ??
          Process.run;

  Future<String> _cli(List<String> args) async {
    final result = await _processFactory('docker', args);

    if (result.exitCode != 0) {
      throw Exception(
        'docker error\n'
        'exitCode: ${result.exitCode}\n'
        'stderr: ${result.stderr}\n'
        'stdout: ${result.stdout}',
      );
    }

    return result.stdout.toString();
  }

  @override
  Future<String> login({
    required String server,
    String? password,
    String? username,
  }) => _cli([
    'login',
    if (password != null) ...['-p', password],
    if (username != null) ...['-u', username],
    server,
  ]);

  @override
  Future<String> imageTag({
    required String sourceImage,
    required String targetImage,
  }) => _cli(['image', 'tag', sourceImage, targetImage]);

  @override
  Future<String> imagePush({
    required String server,
    required String imageName,
  }) => _cli(['image', 'push', '$server/$imageName']);

  @override
  Future<String> build({String? path, String? tag}) => _cli([
    'buildx',
    'build',
    if (tag != null) ...['-t', tag],
    path ?? '.',
  ]);
}
