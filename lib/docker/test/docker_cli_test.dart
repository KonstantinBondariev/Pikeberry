import 'dart:io';

import 'package:docker/docker_cli.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'docker_cli_test.mocks.dart';

@GenerateMocks([Process])
void main() {
  const executable = 'docker';
  const tag = 'foo';
  const server = 'test.server';
  const username = 'testuser';
  const password = 'testpassword';
  const sourceImage = 'source';
  const targetImage = 'target';
  const imageName = 'image';

  group('Docker CLI test', () {
    test('build', () async {
      // Arrange
      final processMock = MockProcess();
      when(
        processMock.run(any, any),
      ).thenAnswer((_) => Future.value(ProcessResult(0, 0, '', '')));

      final docker = DockerCLI(processRun: processMock.run);

      // Act
      await docker.build(path: '.', tag: tag);

      // Arrange
      final captured = verify(processMock.run(executable, captureAny)).captured;
      expect(captured.length, 1);
      expect(captured.first, 'buildx build -t $tag .'.split(' '));
    });

    test('build without tag', () async {
      // Arrange
      final processMock = MockProcess();
      when(
        processMock.run(any, any),
      ).thenAnswer((_) => Future.value(ProcessResult(0, 0, '', '')));

      final docker = DockerCLI(processRun: processMock.run);

      // Act
      await docker.build(path: '.');

      // Assert
      final captured = verify(processMock.run(executable, captureAny)).captured;
      expect(captured.length, 1);
      expect(captured.first, 'buildx build .'.split(' '));
    });

    test('login', () async {
      // Arrange
      final processMock = MockProcess();
      when(
        processMock.run(any, any),
      ).thenAnswer((_) => Future.value(ProcessResult(0, 0, '', '')));

      final docker = DockerCLI(processRun: processMock.run);

      // Act
      await docker.login(
        server: server,
        username: username,
        password: password,
      );

      // Assert
      final captured = verify(processMock.run(executable, captureAny)).captured;
      expect(captured.length, 1);
      expect(captured.first, 'login -p $password -u $username $server'.split(' '));
    });

    test('login without username and password', () async {
      // Arrange
      final processMock = MockProcess();
      when(
        processMock.run(any, any),
      ).thenAnswer((_) => Future.value(ProcessResult(0, 0, '', '')));

      final docker = DockerCLI(processRun: processMock.run);

      // Act
      await docker.login(server: server);

      // Assert
      final captured = verify(processMock.run(executable, captureAny)).captured;
      expect(captured.length, 1);
      expect(captured.first, 'login $server'.split(' '));
    });

    test('imageTag', () async {
      // Arrange
      final processMock = MockProcess();
      when(
        processMock.run(any, any),
      ).thenAnswer((_) => Future.value(ProcessResult(0, 0, '', '')));

      final docker = DockerCLI(processRun: processMock.run);

      // Act
      await docker.imageTag(sourceImage: sourceImage, targetImage: targetImage);

      // Assert
      final captured = verify(processMock.run(executable, captureAny)).captured;
      expect(captured.length, 1);
      expect(captured.first, 'image tag $sourceImage $targetImage'.split(' '));
    });

    test('imagePush', () async {
      // Arrange
      final processMock = MockProcess();
      when(
        processMock.run(any, any),
      ).thenAnswer((_) => Future.value(ProcessResult(0, 0, '', '')));

      final docker = DockerCLI(processRun: processMock.run);

      // Act
      await docker.imagePush(server: server, imageName: imageName);

      // Assert
      final captured = verify(processMock.run(executable, captureAny)).captured;
      expect(captured.length, 1);
      expect(captured.first, 'image push $server/$imageName'.split(' '));
    });
  });
}

abstract class Process {
  Future<ProcessResult> run(String executable, List<String> arguments);
}
