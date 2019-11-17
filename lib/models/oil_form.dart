import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'answer.dart';

part 'oil_form.g.dart';

abstract class OilForm implements Built<OilForm, OilFormBuilder> {
  OilForm._();

  factory OilForm([updates(OilFormBuilder b)]) = _$OilForm;

  @nullable
  @BuiltValueField(wireName: 'answers')
  BuiltList<Answer> get answers;

  @nullable
  @BuiltValueField(wireName: '_id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'company')
  String get company;

  @nullable
  @BuiltValueField(wireName: 'summary')
  double get summary;

  static Serializer<OilForm> get serializer => _$oilFormSerializer;
}
