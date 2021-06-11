import 'package:data/export.dart';

class RepoDependencies{

  NetworkHelper _networkHelper;

  Future init() async {
    _networkHelper = NetworkHelperImpl();
  }

  OcrRepo getOcrRepo() => OcrRepoImpl(_networkHelper);

}