import 'package:sequences/PresenterViews/Widgets/SequenceQuestionFieldPresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';

class SequenceQuestionFieldPresenter extends BasePresenter{


  final SequenceQuestionFieldPresenterView view;
  final Stream<String> streamer;
  final Stream<bool> shakerStream;

  SequenceQuestionFieldPresenter({this.view, this.streamer, this.shakerStream});

  String value="";

  @override
  void initiateData() {
    super.initiateData();
    streamer.listen(onListenStreamer);
    shakerStream.listen(onListenShakeStreamer);
  }

  onListenStreamer(String data){
    print("data : "+data);
    value = data;
    view.updateState(() { });
  }

  onListenShakeStreamer(bool val){
    view.handleAnimation();
  }
}