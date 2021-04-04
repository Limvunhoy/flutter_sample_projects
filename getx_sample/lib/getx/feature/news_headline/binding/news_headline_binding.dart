import 'package:get/get.dart';
import 'package:getx_sample/getx/feature/news_headline/controller/news_headline_controller.dart';
import 'package:getx_sample/getx/repository/news_headline_repo/news_repo_imp.dart';

// binding the controller
class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepositoryImp());
    Get.put(NewsHeadlineController());
  }
}
