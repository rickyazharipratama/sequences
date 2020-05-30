import 'package:admob_flutter/admob_flutter.dart';
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
        "E93ADE10-FCC0-44D0-AE46-2B3F51291F06"
      ]
    );
  }else if(DefaultConstantCollection.instance.environment == FlavorEnvironment.release){
    print("run release mode");
    Admob.initialize();
  }
  runApp(SequencesApp());
}