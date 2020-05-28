import 'package:sequences/PresenterViews/Widgets/SequenceQuestionFieldPresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';

class SequenceQuestionFieldPresenter extends BasePresenter{


  final SequenceQuestionFieldPresenterView view;
  final Stream<bool> shakerStream;

  SequenceQuestionFieldPresenter({this.view, this.shakerStream});

  String value="";

  @override
  void initiateData() {
    super.initiateData();
    shakerStream.listen(onShakerListen);
  }

  onShakerListen(bool val){
    view.handleAnimation();
  }
}