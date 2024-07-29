import 'package:flutter/material.dart';
import '../models/article.dart';
import '../services/news_service.dart';

class NewsProvider with ChangeNotifier {
  List<Article> _articles = [];
  bool _loading = false;

  List<Article> get articles => _articles;
  bool get loading => _loading;

  NewsProvider() {
    fetchTopHeadlines();
  }

  Future<void> fetchTopHeadlines() async {
    _loading = true;
    notifyListeners();
    _articles = await NewsService().fetchTopHeadlines();
    _loading = false;
    notifyListeners();
  }
}
