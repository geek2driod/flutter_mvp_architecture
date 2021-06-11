import 'package:domain/di/di_repo.dart';
import 'package:get_it/get_it.dart';
import '../export.dart';

final di = GetIt.instance;

Future initializeDependencies() async {
  await initializeRepoDependencies();
  await initializeUseCaseDependencies();
}