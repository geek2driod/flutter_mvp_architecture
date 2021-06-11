import 'package:data/export.dart';
import '../export.dart';

Future initializeRepoDependencies() async {

  RepoDependencies repoDependencies = RepoDependencies();
  repoDependencies.init();

  di.registerLazySingleton<OcrRepo>(
        () => repoDependencies.getOcrRepo(),
  );

}