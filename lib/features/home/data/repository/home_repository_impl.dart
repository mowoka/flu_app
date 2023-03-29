import 'package:flu_app/features/home/domain/entities/home_entity.dart';
import 'package:flu_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  var report = HomeEntity();

  @override
  Future<String> Function() accessTokenGetter;

  HomeRepositoryImpl({
    required this.accessTokenGetter,
  });

  @override
  Future<String> getDescription() async {
    var result = '';
    await Future.delayed(const Duration(seconds: 2), () {
      result = 'done';
    });

    return result;
  }
}
