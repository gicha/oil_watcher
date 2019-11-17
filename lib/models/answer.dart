import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'answer.g.dart';

abstract class Answer implements Built<Answer, AnswerBuilder> {
  Answer._();

  factory Answer([updates(AnswerBuilder b)]) = _$Answer;

  @nullable
  @BuiltValueField(wireName: '_id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'isGroup')
  bool get isGroup;

  @nullable
  @BuiltValueField(wireName: 'question')
  String get question;

  @nullable
  @BuiltValueField(wireName: 'answer')
  String get answer;

  @nullable
  @BuiltValueField(wireName: 'point')
  String get point;

  static Serializer<Answer> get serializer => _$answerSerializer;
}
