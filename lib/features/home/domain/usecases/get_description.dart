import 'package:flu_app/features/home/domain/repositories/home_repository.dart';

class GetDescription {
  final HomeRepository repository;

  GetDescription({required this.repository});

  Future<String> execute() {
    return repository.getDescription();
  }
}
