import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test_superlabs/config/constants/app_colors.dart';
import 'package:machine_test_superlabs/config/routes/routes.dart';
import 'package:machine_test_superlabs/src/services/remote/base/base.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = Api.token;

    if (!mounted) return;
    context.push(Routes.search);
    // if (token != null && token.isNotEmpty) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (_) => const HomeScreen()),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.ondemand_video_rounded,
                color: Colors.red,
                size: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
