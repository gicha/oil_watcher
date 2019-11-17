// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oil_form.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OilForm> _$oilFormSerializer = new _$OilFormSerializer();

class _$OilFormSerializer implements StructuredSerializer<OilForm> {
  @override
  final Iterable<Type> types = const [OilForm, _$OilForm];
  @override
  final String wireName = 'OilForm';

  @override
  Iterable<Object> serialize(Serializers serializers, OilForm object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.answers != null) {
      result
        ..add('answers')
        ..add(serializers.serialize(object.answers,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Answer)])));
    }
    if (object.id != null) {
      result
        ..add('_id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.company != null) {
      result
        ..add('company')
        ..add(serializers.serialize(object.company,
            specifiedType: const FullType(String)));
    }
    if (object.summary != null) {
      result
        ..add('summary')
        ..add(serializers.serialize(object.summary,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  OilForm deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OilFormBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'answers':
          result.answers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Answer)]))
              as BuiltList<dynamic>);
          break;
        case '_id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'summary':
          result.summary = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$OilForm extends OilForm {
  @override
  final BuiltList<Answer> answers;
  @override
  final String id;
  @override
  final String company;
  @override
  final double summary;

  factory _$OilForm([void Function(OilFormBuilder) updates]) =>
      (new OilFormBuilder()..update(updates)).build();

  _$OilForm._({this.answers, this.id, this.company, this.summary}) : super._();

  @override
  OilForm rebuild(void Function(OilFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OilFormBuilder toBuilder() => new OilFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OilForm &&
        answers == other.answers &&
        id == other.id &&
        company == other.company &&
        summary == other.summary;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, answers.hashCode), id.hashCode), company.hashCode),
        summary.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OilForm')
          ..add('answers', answers)
          ..add('id', id)
          ..add('company', company)
          ..add('summary', summary))
        .toString();
  }
}

class OilFormBuilder implements Builder<OilForm, OilFormBuilder> {
  _$OilForm _$v;

  ListBuilder<Answer> _answers;
  ListBuilder<Answer> get answers =>
      _$this._answers ??= new ListBuilder<Answer>();
  set answers(ListBuilder<Answer> answers) => _$this._answers = answers;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _company;
  String get company => _$this._company;
  set company(String company) => _$this._company = company;

  double _summary;
  double get summary => _$this._summary;
  set summary(double summary) => _$this._summary = summary;

  OilFormBuilder();

  OilFormBuilder get _$this {
    if (_$v != null) {
      _answers = _$v.answers?.toBuilder();
      _id = _$v.id;
      _company = _$v.company;
      _summary = _$v.summary;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OilForm other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OilForm;
  }

  @override
  void update(void Function(OilFormBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OilForm build() {
    _$OilForm _$result;
    try {
      _$result = _$v ??
          new _$OilForm._(
              answers: _answers?.build(),
              id: id,
              company: company,
              summary: summary);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'answers';
        _answers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OilForm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
