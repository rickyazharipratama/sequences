import 'package:sequences/PresenterViews/SequenceAppPresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Utils/Collections/SharedPreferencesConstantCollection.dart';
import 'package:sequences/Utils/Helpers/SharedPreferenceHelper.dart';

class SequenceAppPresenter extends BasePresenter{

  final SequenceAppPresenterView view;
  bool _isUsedDarkTheme = false;

  SequenceAppPresenter({this.view});

  set setUsedDarkTheme(bool val) { _isUsedDarkTheme = val;}
  bool get isUsedDarkTheme => _isUsedDarkTheme;

  @override
  void initiateData() async{
    super.initiateData();
    setUsedDarkTheme = (await SharedPreferenceHelper.instance.pref()).getBool(SharedPreferencesConstantCollection.instance.isUsingDarkTheme);
    view.updateState(null);
  }
}