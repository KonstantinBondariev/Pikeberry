//
//  Generated code. Do not modify.
//  source: gpio.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GpioState extends $pb.GeneratedMessage {
  factory GpioState({
    $core.Map<$core.int, $core.bool>? lineStates,
  }) {
    final $result = create();
    if (lineStates != null) {
      $result.lineStates.addAll(lineStates);
    }
    return $result;
  }
  GpioState._() : super();
  factory GpioState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GpioState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GpioState', package: const $pb.PackageName(_omitMessageNames ? '' : 'pikeberry'), createEmptyInstance: create)
    ..m<$core.int, $core.bool>(1, _omitFieldNames ? '' : 'lineStates', entryClassName: 'GpioState.LineStatesEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.OB, packageName: const $pb.PackageName('pikeberry'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GpioState clone() => GpioState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GpioState copyWith(void Function(GpioState) updates) => super.copyWith((message) => updates(message as GpioState)) as GpioState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GpioState create() => GpioState._();
  GpioState createEmptyInstance() => create();
  static $pb.PbList<GpioState> createRepeated() => $pb.PbList<GpioState>();
  @$core.pragma('dart2js:noInline')
  static GpioState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GpioState>(create);
  static GpioState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, $core.bool> get lineStates => $_getMap(0);
}

class Lines extends $pb.GeneratedMessage {
  factory Lines({
    $core.Iterable<$core.int>? lines,
  }) {
    final $result = create();
    if (lines != null) {
      $result.lines.addAll(lines);
    }
    return $result;
  }
  Lines._() : super();
  factory Lines.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Lines.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Lines', package: const $pb.PackageName(_omitMessageNames ? '' : 'pikeberry'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'lines', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Lines clone() => Lines()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Lines copyWith(void Function(Lines) updates) => super.copyWith((message) => updates(message as Lines)) as Lines;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Lines create() => Lines._();
  Lines createEmptyInstance() => create();
  static $pb.PbList<Lines> createRepeated() => $pb.PbList<Lines>();
  @$core.pragma('dart2js:noInline')
  static Lines getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lines>(create);
  static Lines? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get lines => $_getList(0);
}

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'pikeberry'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
