import 'package:flutter/material.dart';
import 'package:miksoper/core/helpers/providers/comment_provider.dart';
import 'package:miksoper/core/helpers/theme_style.dart';
import 'package:miksoper/ui/pages/auth/login_page.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => CommentProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sizer',
            theme: ThemeStyles.themeData(context),
            home: const LoginPage(),
          ),
        );
      },
    );
  }
}
