import 'package:flutter/foundation.dart';
import 'package:networking_demo/enums/view_state.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.idle;
  ViewState get viewState => _viewState;

  setViewState(ViewState state) {
    _viewState = state;
    notifyListeners();
  }
}
