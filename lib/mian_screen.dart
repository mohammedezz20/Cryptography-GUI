// creae astateless widget with block consumer import 'package:flutter/cupertino.dart';
import 'package:cryptography/Widget/TextWidget.dart';
import 'package:cryptography/cubit/appcubit.dart';
import 'package:cryptography/cubit/appstate.dart';
import 'package:cryptography/decryption_screen.dart';
import 'package:cryptography/encryption_screen.dart';
import 'package:cryptography/widget/TextFieldWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var h = 15.0;
            var cubit = AppCubit.get(context);
            return Scaffold(
                body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10)),
                    child: TabBar(
                        dividerHeight: 0,
                        indicatorWeight: 5,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            color: Colors.deepPurple[100],
                            borderRadius: BorderRadius.circular(10)),
                        splashBorderRadius: BorderRadius.circular(10),
                        tabs: const [
                          Tab(
                            text: "Encryption",
                          ),
                          Tab(text: "Decryption"),
                        ]),
                  ),
                ),
                const Flexible(
                    child: TabBarView(
                        children: [EncryptionScreen(), DecryptionScreen()])),
              ],
            ));
          }),
    );
  }
}
