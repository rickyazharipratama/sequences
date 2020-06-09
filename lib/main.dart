import 'dart:async';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Views/SequencesApp.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  if(DefaultConstantCollection.instance.environment == FlavorEnvironment.debug){
    print("run debug mode");
    Admob.initialize(
      testDeviceIds: <String>[
        "78ADF84F7204580FFC8B911A1DC88A17",
        "E93ADE10-FCC0-44D0-AE46-2B3F51291F06"
      ]
    );
  }else if(DefaultConstantCollection.instance.environment == FlavorEnvironment.release){
    print("run release mode");
    Admob.initialize();
  }
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runZonedGuarded((){
    runApp(SequencesApp());
  },
  Crashlytics.instance.recordError);
}