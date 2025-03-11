//
//  Generated code. Do not modify.
//  source: gpio.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'gpio.pb.dart' as $0;

export 'gpio.pb.dart';

@$pb.GrpcServiceName('pikeberry.Gpio')
class GpioClient extends $grpc.Client {
  static final _$write = $grpc.ClientMethod<$0.GpioState, $0.Empty>(
      '/pikeberry.Gpio/Write',
      ($0.GpioState value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$read = $grpc.ClientMethod<$0.Lines, $0.GpioState>(
      '/pikeberry.Gpio/Read',
      ($0.Lines value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GpioState.fromBuffer(value));

  GpioClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Empty> write($0.GpioState request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$write, request, options: options);
  }

  $grpc.ResponseFuture<$0.GpioState> read($0.Lines request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$read, request, options: options);
  }
}

@$pb.GrpcServiceName('pikeberry.Gpio')
abstract class GpioServiceBase extends $grpc.Service {
  $core.String get $name => 'pikeberry.Gpio';

  GpioServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GpioState, $0.Empty>(
        'Write',
        write_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GpioState.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Lines, $0.GpioState>(
        'Read',
        read_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Lines.fromBuffer(value),
        ($0.GpioState value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> write_Pre($grpc.ServiceCall call, $async.Future<$0.GpioState> request) async {
    return write(call, await request);
  }

  $async.Future<$0.GpioState> read_Pre($grpc.ServiceCall call, $async.Future<$0.Lines> request) async {
    return read(call, await request);
  }

  $async.Future<$0.Empty> write($grpc.ServiceCall call, $0.GpioState request);
  $async.Future<$0.GpioState> read($grpc.ServiceCall call, $0.Lines request);
}
