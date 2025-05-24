import 'package:bookies/dependency/app_dependency.dart';
import 'package:bookies/dependency/repository_dependency.dart';
import 'package:bookies/dependency/shared_preference_dependency.dart';
import 'package:get_it/get_it.dart';

sealed class AppDependencyProvider {
  static Future init() async {
    final instance = GetIt.I;

    final dependencies = _getDependencies();

    for (var dependency in dependencies) {
      await dependency.inject(instance);
    }
  }

  static List<AppDependency> _getDependencies() {
    return [
      SharedPreferenceDependency(),
      RepositoryDependency(),
    ];
  }
}
