import 'package:dio/dio.dart';
import 'package:study_case_vascomm/model/news/news_model.dart';

class NewsService {
  String apiKeys = "3b3c888566a041c5ad4761b5d8ff9201";
  News? resNews;
  Future<List<News>> getNews() async {
    try {
      var response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=$apiKeys",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final List<dynamic> articles = data['articles'];

        final List<News> newsList = articles.map((article) {
          return News.fromJson(article);
        }).toList();

        return newsList;
      } else {
        // Handle the error here, if needed
        return []; // Return an empty list in case of an error
      }
    } catch (e) {
      // Handle exceptions here, if needed
      return []; // Return an empty list in case of an exception
    }
  }
}
