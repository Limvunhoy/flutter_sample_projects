import 'package:get/get.dart';
import 'package:getx_sample/getx/feature/search/controller/search_news_controller.dart';

class SearchNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }
}
