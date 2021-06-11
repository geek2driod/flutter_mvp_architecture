import '../export.dart';

///This is the base class for view
///This class contains the basic methods that are
///common for all views e.g ShowError(), showSuccessDialog() etc...
mixin IView {
  showLoader();

  hideLoader();
}

///This is the base class for Presenter.
///Add all of the common methods that are
///common for all presenters.
///Note: Add only business logic in presenter as
///it will be helpful to write presenter test.
abstract class IPresenter<T> extends ChangeNotifier {
  T view;

  void attachView(T view) {
    this.view = view;
  }

  void dropView() {
    view = null;
  }

  IView getView() {
    return (view as IView);
  }

  @override
  void dispose(){
    super.dispose();
  }
}
