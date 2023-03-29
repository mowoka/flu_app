abstract class HomeRepository {
  late Future<String> Function() accessTokenGetter;

  HomeRepository({required this.accessTokenGetter});

  Future<String> getDescription();
}
