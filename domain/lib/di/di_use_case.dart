import 'package:data/export.dart';

import '../export.dart';

Future initializeUseCaseDependencies() async {
  di.registerLazySingleton<ReadDocumentUseCase>(
    () => ReadDocumentUseCase(
      di<OcrRepo>(),
    ),
  );
}
