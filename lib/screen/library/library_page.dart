import 'package:mvp_skeleton/export.dart';
import 'package:provider/provider.dart';

enum LibraryPageViewType { EMPTY, LIBRARY_LIST }

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends BaseState<LibraryPage, LibraryPresenter>
    with LibraryView {
  LibraryPageViewType viewType = LibraryPageViewType.LIBRARY_LIST;

  @override
  void initState() {
    super.initState();
    presenter.attachView(this);
    presenter.init();
    if (presenter.getDocuments().isEmpty) viewType = LibraryPageViewType.EMPTY;
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (viewType) {
      case LibraryPageViewType.EMPTY:
        return EmptyLibrary(
          onTryNowTap: () {
            final homePresenter =
                Provider.of<HomePresenter>(context, listen: false);
            homePresenter.onTryNowTap();
          },
        );
      case LibraryPageViewType.LIBRARY_LIST:
        return libraryList();
    }
  }

  Widget libraryList() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return LibraryItem(
          presenter.getDocuments()[index].timeStamp,
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 1,
          width: double.infinity,
          color: colors.secondary400,
        );
      },
      itemCount: presenter.getDocuments().length,
    );
  }
}
