import 'package:domain/export.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../export.dart';

List<SingleChildWidget> multiProviders = [
  ChangeNotifierProvider<SplashPresenter>(
    create: (_) => SplashPresenterImpl(),
    lazy: true,
  ),
  ChangeNotifierProvider<HomePresenter>(
    create: (_) => HomePresenterImpl(
      di<ReadDocumentUseCase>()
    ),
    lazy: true,
  ),
  ChangeNotifierProvider<CapturePresenter>(
    create: (_) => CapturePresenterImpl(
        di<ReadDocumentUseCase>()
    ),
    lazy: true,
  ), ChangeNotifierProvider<LibraryPresenter>(
    create: (_) => LibraryPresenterImpl(
        di<ReadDocumentUseCase>()
    ),
    lazy: true,
  ),
];