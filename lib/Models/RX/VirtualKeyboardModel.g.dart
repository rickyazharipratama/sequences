// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VirtualKeyboardModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VirtualKeyboardModel on _VirtualKeyboadModel, Store {
  final _$keyPunchedAtom = Atom(name: '_VirtualKeyboadModel.keyPunched');

  @override
  String get keyPunched {
    _$keyPunchedAtom.reportRead();
    return super.keyPunched;
  }

  @override
  set keyPunched(String value) {
    _$keyPunchedAtom.reportWrite(value, super.keyPunched, () {
      super.keyPunched = value;
    });
  }

  final _$hintStateAtom = Atom(name: '_VirtualKeyboadModel.hintState');

  @override
  HintState get hintState {
    _$hintStateAtom.reportRead();
    return super.hintState;
  }

  @override
  set hintState(HintState value) {
    _$hintStateAtom.reportWrite(value, super.hintState, () {
      super.hintState = value;
    });
  }

  final _$blockNumberKeyAtom =
      Atom(name: '_VirtualKeyboadModel.blockNumberKey');

  @override
  ObservableList<String> get blockNumberKey {
    _$blockNumberKeyAtom.reportRead();
    return super.blockNumberKey;
  }

  @override
  set blockNumberKey(ObservableList<String> value) {
    _$blockNumberKeyAtom.reportWrite(value, super.blockNumberKey, () {
      super.blockNumberKey = value;
    });
  }

  final _$_VirtualKeyboadModelActionController =
      ActionController(name: '_VirtualKeyboadModel');

  @override
  void addBlockNumberkey(String key) {
    final _$actionInfo = _$_VirtualKeyboadModelActionController.startAction(
        name: '_VirtualKeyboadModel.addBlockNumberkey');
    try {
      return super.addBlockNumberkey(key);
    } finally {
      _$_VirtualKeyboadModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAllBlockNumberKeys(List<String> keys) {
    final _$actionInfo = _$_VirtualKeyboadModelActionController.startAction(
        name: '_VirtualKeyboadModel.addAllBlockNumberKeys');
    try {
      return super.addAllBlockNumberKeys(keys);
    } finally {
      _$_VirtualKeyboadModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetBlockNumberKey() {
    final _$actionInfo = _$_VirtualKeyboadModelActionController.startAction(
        name: '_VirtualKeyboadModel.resetBlockNumberKey');
    try {
      return super.resetBlockNumberKey();
    } finally {
      _$_VirtualKeyboadModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void structurizeKeyPunched(String val) {
    final _$actionInfo = _$_VirtualKeyboadModelActionController.startAction(
        name: '_VirtualKeyboadModel.structurizeKeyPunched');
    try {
      return super.structurizeKeyPunched(val);
    } finally {
      _$_VirtualKeyboadModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void structurizeKeyAction(KeyboardAction key) {
    final _$actionInfo = _$_VirtualKeyboadModelActionController.startAction(
        name: '_VirtualKeyboadModel.structurizeKeyAction');
    try {
      return super.structurizeKeyAction(key);
    } finally {
      _$_VirtualKeyboadModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetKeyPunched() {
    final _$actionInfo = _$_VirtualKeyboadModelActionController.startAction(
        name: '_VirtualKeyboadModel.resetKeyPunched');
    try {
      return super.resetKeyPunched();
    } finally {
      _$_VirtualKeyboadModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onHintLoading() {
    final _$actionInfo = _$_VirtualKeyboadModelActionController.startAction(
        name: '_VirtualKeyboadModel.onHintLoading');
    try {
      return super.onHintLoading();
    } finally {
      _$_VirtualKeyboadModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onHintLoadFailed() {
    final _$actionInfo = _$_VirtualKeyboadModelActionController.startAction(
        name: '_VirtualKeyboadModel.onHintLoadFailed');
    try {
      return super.onHintLoadFailed();
    } finally {
      _$_VirtualKeyboadModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onHintReady() {
    final _$actionInfo = _$_VirtualKeyboadModelActionController.startAction(
        name: '_VirtualKeyboadModel.onHintReady');
    try {
      return super.onHintReady();
    } finally {
      _$_VirtualKeyboadModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
keyPunched: ${keyPunched},
hintState: ${hintState},
blockNumberKey: ${blockNumberKey}
    ''';
  }
}
