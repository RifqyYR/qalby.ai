import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/common/cubit/nav_cubit.dart';
import 'package:myproject/common/widgets/custom_bottom_navigation_bar.dart';

class BaseScreen extends StatefulWidget {
  final int currentIndex;
  final Widget child;

  const BaseScreen({
    super.key,
    required this.currentIndex,
    required this.child,
  });

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  DateTime? _lastBackPressed;

  @override
  Widget build(BuildContext context) {
    context.read<NavCubit>().updateIndex(widget.currentIndex);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final now = DateTime.now();
        if (_lastBackPressed == null ||
            now.difference(_lastBackPressed!) > Duration(seconds: 2)) {
          _lastBackPressed = now;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Tekan kembali sekali lagi untuk keluar'),
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else {
          // Keluar dari aplikasi
          SystemNavigator.pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: widget.child,
          bottomNavigationBar: CustomBottomNavBar(),
        ),
      ),
    );
  }
}
