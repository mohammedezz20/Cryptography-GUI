import 'package:cryptography/cubit/appcubit.dart';
import 'package:cryptography/encryption_screen.dart';
import 'package:cryptography/mian_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: const MaterialApp(home: MainScreen()),
    );
  }
}
