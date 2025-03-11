import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:pikeberry/generated/gpio.pbgrpc.dart';
import 'package:test/test.dart';

void main() {
  final port = '50051';
  Process? p;
  ClientChannel? channel;

  setUp(() async {
    p = await Process.start(
      'dart',
      ['run', 'bin/server.dart'],
      environment: {'PORT': port, 'ENVIRONMENT': 'test'},
    );
    // Wait for server to start and print to stdout.
    await p?.stdout.first;

    channel = ClientChannel(
      'localhost',
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  });

  tearDown(() async {
    await channel?.shutdown();

    p?.kill();
  });

  test('Gpio service', () async {
    final client = GpioClient(channel!);

    await client.write(GpioState(lineStates: {4: true, 2: true, 0: true}));
    final state = await client.read(Lines(lines: [4, 2, 0]));

    expect(state.lineStates[4], true);
    expect(state.lineStates[2], true);
    expect(state.lineStates[0], true);
  });
}
