import 'package:flu_app/features/home/domain/repositories/home_repository.dart';
import 'package:flu_app/features/home/domain/usecases/get_description.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepository repository;
  late final GetDescription getDescription;

  HomeProvider({required this.repository}) {
    getDescription = GetDescription(repository: repository);
  }

  Future<String> getTextDescription() {
    return getDescription.execute();
  }
}
