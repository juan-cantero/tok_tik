import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/config/theme/app_theme.dart';
import 'package:tok_tik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tok_tik/infrastructure/repository/video_post_repository_impl.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/screens/discover/discover_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final videoPostRepository = VideoPostRepositoryImpl(
    videosDatasource: LocalVideoDatasourceImpl(),
  );
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              DiscoverProvider(videosRepository: videoPostRepository)
                ..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        title: 'Tok Tik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}
