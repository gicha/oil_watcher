part of api;

class OilFormApi {
  static Future<List<OilForm>> all() async {
    var data = (await Api.dio.get("/")).data;
    return List.from(data.map((item) => serializers.deserializeWith(OilForm.serializer, item)).toList());
  }
}
