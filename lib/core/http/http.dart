import 'dart:developer';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import '../utils/Path.dart';
import '../utils/sputils.dart';

class XHttp {
  XHttp._internal();

  ///网络请求配置
  static final Dio dio = Dio(BaseOptions(
    baseUrl: SPUtils.getHost().toString(),
    connectTimeout: 50000,
    receiveTimeout: 3000,
  ));

  ///初始化dio
  static void init() {
    ///初始化cookie
    PathUtils.getDocumentsDirPath().then((value) {
      var cookieJar =
          PersistCookieJar(storage: FileStorage(value + "/.cookies/"));
      dio.interceptors.add(CookieManager(cookieJar));
    });

    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      options.baseUrl = SPUtils.getHost().toString();
      log("请求之前");
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      log("响应之前");
      return handler.next(response);
    }, onError: (DioError e, handler) {
      log("错误之前");
      handleError(e);
      return handler.next(e);
    }));
  }

  ///error统一处理
  static void handleError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        log("连接超时");
        break;
      case DioErrorType.sendTimeout:
        log("请求超时");
        break;
      case DioErrorType.receiveTimeout:
        log("响应超时");
        break;
      case DioErrorType.response:
        log("出现异常");
        break;
      case DioErrorType.cancel:
        log("请求取消");
        break;
      default:
        log("未知错误");
        break;
    }
  }

  ///get请求
  static Future get(String url, [Map<String, dynamic>? params]) async {
    dio.options.headers['Authorization'] =
        'Bearer ' + SPUtils.getToken().toString();
    Response response;
    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  ///post 表单请求
  static Future post(String url, [Map<String, dynamic>? params]) async {
    log(params.toString());
    Response response = await dio.post(url, queryParameters: params);
    return response.data;
  }

  ///post body请求
  static Future postJson(String url, [Map<String, dynamic>? data]) async {
    Response response = await dio.post(url, data: data);
    return response.data;
  }

  ///下载文件
  static Future downloadFile(urlPath, savePath) async {
    late Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        log("$count $total");
      });
    } on DioError catch (e) {
      handleError(e);
    }
    return response.data;
  }
}
