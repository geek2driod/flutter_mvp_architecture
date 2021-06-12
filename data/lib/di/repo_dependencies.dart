import 'package:data/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepoDependencies {
  SharedPreferences sharedPreferences;
  NetworkHelper _networkHelper;
  Storage _storage;

  Future init() async {
    _networkHelper = NetworkHelperImpl();
    sharedPreferences = await SharedPreferences.getInstance();
    _storage = StorageImpl(sharedPreferences);
  }

  Storage getStorage() => StorageImpl(sharedPreferences);

  OcrRepo getOcrRepo() => OcrRepoImpl(
        _networkHelper,
        _storage,
      );
}
