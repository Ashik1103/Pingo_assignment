import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/news_provider.dart';
import 'models/article.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NewsScreen(),
      ),
    );
  }
}

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Headlines'),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          if (newsProvider.loading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: newsProvider.articles.length,
            itemBuilder: (context, index) {
              Article article = newsProvider.articles[index];
              return ListTile(
                leading: article.urlToImage.isNotEmpty
                    ? Image.network(article.urlToImage,
                        width: 100, fit: BoxFit.cover)
                    : Image.network('https://via.placeholder.com/150',
                        width: 100, fit: BoxFit.cover),
                title: Text(article.title),
                subtitle: Text(article.description),
                onTap: () => _launchURL(context, article.url),
              );
            },
          );
        },
      ),
    );
  }

  void _launchURL(BuildContext context, String url) {
    // Implement URL launcher functionality if needed.
  }
}
