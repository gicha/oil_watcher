// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Answer> _$answerSerializer = new _$AnswerSerializer();

class _$AnswerSerializer implements StructuredSerializer<Answer> {
  @override
  final Iterable<Type> types = const [Answer, _$Answer];
  @override
  final String wireName = 'Answer';

  @override
  Iterable<Object> serialize(Serializers serializers, Answer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('_id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.isGroup != null) {
      result
        ..add('isGroup')
        ..add(serializers.serialize(object.isGroup,
            specifiedType: const FullType(bool)));
    }
    if (object.question != null) {
      result
        ..add('question')
        ..add(serializers.serialize(object.question,
            specifiedType: const FullType(String)));
    }
    if (object.answer != null) {
      result
        ..add('answer')
        ..add(serializers.serialize(object.answer,
            specifiedType: const FullType(String)));
    }
    if (object.point != null) {
      result
        ..add('point')
        ..add(serializers.serialize(object.point,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Answer deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnswerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '_id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isGroup':
          result.isGroup = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'answer':
          result.answer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'point':
          result.point = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Answer extends Answer {
  @override
  final String id;
  @override
  final bool isGroup;
  @override
  final String question;
  @override
  final String answer;
  @override
  final String point;

  factory _$Answer([void Function(AnswerBuilder) updates]) =>
      (new AnswerBuilder()..update(updates)).build();

  _$Answer._({this.id, this.isGroup, this.question, this.answer, this.point})
      : super._();

  @override
  Answer rebuild(void Function(AnswerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnswerBuilder toBuilder() => new AnswerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Answer &&
        id == other.id &&
        isGroup == other.isGroup &&
        question == other.question &&
        answer == other.answer &&
        point == other.point;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), isGroup.hashCode), question.hashCode),
            answer.hashCode),
        point.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Answer')
          ..add('id', id)
          ..add('isGroup', isGroup)
          ..add('question', question)
          ..add('answer', answer)
          ..add('point', point))
        .toString();
  }
}

class AnswerBuilder implements Builder<Answer, AnswerBuilder> {
  _$Answer _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  bool _isGroup;
  bool get isGroup => _$this._isGroup;
  set isGroup(bool isGroup) => _$this._isGroup = isGroup;

  String _question;
  String get question => _$this._question;
  set question(String question) => _$this._question = question;

  String _answer;
  String get answer => _$this._answer;
  set answer(String answer) => _$this._answer = answer;

  String _point;
  String get point => _$this._point;
  set point(String point) => _$this._point = point;

  AnswerBuilder();

  AnswerBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _isGroup = _$v.isGroup;
      _question = _$v.question;
      _answer = _$v.answer;
      _point = _$v.point;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Answer other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Answer;
  }

  @override
  void update(void Function(AnswerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Answer build() {
    final _$result = _$v ??
        new _$Answer._(
            id: id,
            isGroup: isGroup,
            question: question,
            answer: answer,
            point: point);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
