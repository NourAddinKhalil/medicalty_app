abstract class IRequestStructure {
  String get apiEndPoint => '';

  String get apiSearchEndpoint => '$apiEndPoint/search';

  /// its get method
  Future<dynamic> get();

  /// its post method
  Future<dynamic> search(query);

  /// its get method
  Future<dynamic> getSingle(id);

  /// its post method
  Future add(model);

  /// its put method
  Future edit(model);

  /// its delete method
  Future delete(model);
}
