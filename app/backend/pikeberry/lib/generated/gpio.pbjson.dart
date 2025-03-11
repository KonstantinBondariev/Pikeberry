//
//  Generated code. Do not modify.
//  source: gpio.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use gpioStateDescriptor instead')
const GpioState$json = {
  '1': 'GpioState',
  '2': [
    {'1': 'line_states', '3': 1, '4': 3, '5': 11, '6': '.pikeberry.GpioState.LineStatesEntry', '10': 'lineStates'},
  ],
  '3': [GpioState_LineStatesEntry$json],
};

@$core.Deprecated('Use gpioStateDescriptor instead')
const GpioState_LineStatesEntry$json = {
  '1': 'LineStatesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 8, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GpioState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gpioStateDescriptor = $convert.base64Decode(
    'CglHcGlvU3RhdGUSRQoLbGluZV9zdGF0ZXMYASADKAsyJC5waWtlYmVycnkuR3Bpb1N0YXRlLk'
    'xpbmVTdGF0ZXNFbnRyeVIKbGluZVN0YXRlcxo9Cg9MaW5lU3RhdGVzRW50cnkSEAoDa2V5GAEg'
    'ASgFUgNrZXkSFAoFdmFsdWUYAiABKAhSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use linesDescriptor instead')
const Lines$json = {
  '1': 'Lines',
  '2': [
    {'1': 'lines', '3': 1, '4': 3, '5': 5, '10': 'lines'},
  ],
};

/// Descriptor for `Lines`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linesDescriptor = $convert.base64Decode(
    'CgVMaW5lcxIUCgVsaW5lcxgBIAMoBVIFbGluZXM=');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

