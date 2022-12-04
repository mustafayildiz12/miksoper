import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

mixin LifeCycleUse<T extends StatefulWidget>
    on WidgetsBindingObserver, State<T> {
  void onResume();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(LifeCycleEventHandler(
        resumCallBack: () async {
          onResume();
        },
        suspendingCallBack: () async {}));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}

class LifeCycleEventHandler extends WidgetsBindingObserver {
  LifeCycleEventHandler(
      {required this.resumCallBack, required this.suspendingCallBack});

  final AsyncCallback resumCallBack;
  final AsyncCallback suspendingCallBack;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        await resumCallBack();
        break;
      case AppLifecycleState.inactive:
        // TODO: Handle this case.
        break;
      case AppLifecycleState.paused:
        // TODO: Handle this case.
        break;
      case AppLifecycleState.detached:
        await suspendingCallBack();
        break;
    }
  }
}
