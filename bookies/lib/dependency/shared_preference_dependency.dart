import 'package:bookies/dependency/app_dependency.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDependency extends AppDependency {
  @override
  Future inject(GetIt container) async {
    container.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance(),
    );
  }
}
