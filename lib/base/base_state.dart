import 'package:provider/provider.dart';
import '../export.dart';

abstract class BaseState<T extends StatefulWidget, P> extends State<T> with IView{
  P _presenter;

  @override
  void initState() {
    super.initState();
    if(P!=null) {
      _presenter = Provider.of<P>(context, listen: false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if(_presenter!=null) {
      (_presenter as IPresenter).dropView();
    }
  }

  void attachListener() {
    if(P!=null) {
      _presenter = Provider.of<P>(context, listen: true);
    }
  }

  P get presenter => _presenter;

  @override
  void hideLoader() {

  }

  @override
  void showLoader() {
  }
}
