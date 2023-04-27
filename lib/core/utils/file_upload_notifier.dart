import 'dart:async';
import 'package:fffw_demo/core/_core_exports.dart';

//TODO isn't used so I am not sure how to categorize it.
class FileUploadNotifier extends StateNotifier<TaskState?> {
  FileUploadNotifier() : super(null);

  StreamSubscription<TaskSnapshot>? _tickerSubscription;

  late UploadTask _uploadTask;
  set uploadTask(t) {
    _uploadTask = t;

    if (t == null) {
      return;
    }

    if (_tickerSubscription != null) _tickerSubscription!.cancel();

    state = TaskState.running;

    _tickerSubscription = _uploadTask.asStream().listen((event) {
      // print('upload state $event');
      state = event.state;
    }, onError: (error) {
      print('upload error $error'); //TODO print in prod code ?
    }, onDone: () {
      // print('upload done!');
      if (_tickerSubscription != null) _tickerSubscription!.cancel();
    }, cancelOnError: true);
  }
}
