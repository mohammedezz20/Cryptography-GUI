// creae astateless widget with block consumer import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:cryptography/Widget/TextWidget.dart';
import 'package:cryptography/cubit/appcubit.dart';
import 'package:cryptography/cubit/appstate.dart';
import 'package:cryptography/widget/TextFieldWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EncryptionScreen extends StatelessWidget {
  const EncryptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var h = 15.0;
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  width: 650,
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 650,
                        height: 210,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Column(
                                children: [
                                  TextWidget(
                                    text: "Plain Text",
                                  ),
                                  SizedBox(
                                    height: h,
                                  ),
                                  TextWidget(
                                    text: (cubit.selectedAlgo != 'caesar')
                                        ? "Key"
                                        : 'Shift',
                                  ),
                                  SizedBox(
                                    height: h,
                                  ),
                                  TextWidget(
                                    text: "Algorithm",
                                  ),
                                  SizedBox(
                                    height: h,
                                  ),
                                  TextWidget(
                                    text: "Encrypted text",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFieldWidget(
                                    controller:
                                        cubit.encryptionPlainTexrController,
                                  ),
                                  SizedBox(
                                    height: h,
                                  ),
                                  TextFieldWidget(
                                    controller: cubit.encryptionKeyController,
                                  ),
                                  SizedBox(
                                    height: h,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 40,
                                    width: 150,
                                    alignment: Alignment.center,
                                    child: Material(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: cubit.selectedAlgo,
                                        dropdownColor: Colors.white,
                                        alignment: Alignment.center,
                                        focusColor: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        elevation: 20,
                                        underline: const SizedBox(),
                                        onChanged: (newValue) {
                                          cubit.changeLayout(newValue);
                                        },
                                        items: cubit.algo
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h,
                                  ),
                                  SelectableText(
                                    cubit.enoutput != ''
                                        ? jsonDecode(
                                            cubit.enoutput)['encrypted_text']
                                        : "",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 600,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                cubit.encryption();
                              },
                              child: const Text("Encrypt"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
