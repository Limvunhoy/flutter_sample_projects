import 'package:get/get.dart';
import 'package:getx_sample/getx/model/article_response.dart';
import 'package:getx_sample/getx/repository/news_headline_repo/news_repo.dart';
import 'package:getx_sample/getx/repository/news_headline_repo/news_repo_imp.dart';

class NewsHeadlineController extends GetxController {
  NewsRepository _newsRepository;

  NewsHeadlineController() {
    _newsRepository = Get.find<NewsRepositoryImp>();
    loadNewsHeadline();
  }

  // observable list in GetX
  RxList<ArticleResponse> articles;
  RxBool isLoading = false.obs;

  loadNewsHeadline() async {
    showLoading();

    final result = await _newsRepository.getNewsHeadline();

    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print("Get News Headline Failed");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
