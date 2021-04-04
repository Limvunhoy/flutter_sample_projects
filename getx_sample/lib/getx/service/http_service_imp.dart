import 'package:dio/dio.dart';
import '../constant/api_constant.dart';
import 'http_service.dart';


class HttpServiceImp extends HttpService {
  Dio _dio;

  initializationInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error) {
      print("Error ${error.message}");
    }, onRequest: (request) {
      print("URL ${request.path}");
    }, onResponse: (response) {
      print("Status code ${response.statusCode}");
    }));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: ApiConstant.BASE_URL,
        headers: {"Authorization": "Bearer ${ApiConstant.API_KEY}"}));

    initializationInterceptor();
  }

  @override
  Future<Response> getRequest(String url) async {
    Response response;

    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      throw Exception(e.message);
    }

    return response;
  }
}
