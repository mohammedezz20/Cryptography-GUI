import 'package:cryptography/Network/ApiHelper.dart';
import 'package:cryptography/cubit/appstate.dart';
import 'package:cryptography/encryption_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);

  List<String> algo = [
    "caesar",
    "rowcolumn",
    "playfair",
    "railfence",
    "hill",
    "vernam"
  ];
  String selectedAlgo = "caesar";

  void changeLayout(var newalgo) {
    selectedAlgo = newalgo;
    emit(SelectedAlgoChangeState());
  }

  var encryptionPlainTexrController = TextEditingController();
  var encryptionKeyController = TextEditingController();
  var decryptionCipherTextController = TextEditingController();
  var decryptionKeyController = TextEditingController();

  var enoutput = "";
  var deoutput = "";

  encryption() async {
    emit(EncriptoionLoadingState());
    try {
      http.Response response = await ApiHelper.encryptionAndDecryption(
        text: encryptionPlainTexrController.text.toLowerCase(),
        key: encryptionKeyController.text.toLowerCase(),
        isencrypt: true,
        algorithm: selectedAlgo,
      );
      enoutput = response.body;
      emit(EncriptoionSuccessState());
    } catch (e) {
      emit(EncriptoionFailureState());
    }
  }

  decryption() async {
    emit(DecriptoionLoadingState());
    try {
      http.Response response = await ApiHelper.encryptionAndDecryption(
        text: decryptionCipherTextController.text.toLowerCase(),
        key: decryptionKeyController.text.toLowerCase(),
        isencrypt: false,
        algorithm: selectedAlgo,
      );
      deoutput = response.body;
      emit(DecriptoionSuccessState());
    } catch (e) {
      emit(DecriptoionFailureState());
    }
  }
}
