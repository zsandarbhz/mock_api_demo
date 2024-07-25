import 'package:mock_api_demo/app/core/network/api/dio_exception.dart';
import 'package:mock_api_demo/utils/common_functions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api_endpoints.dart';
import 'package:mock_api_demo/app/core/models/model.dart';

class ApiService {
  final Dio? dio;

  ApiService({required this.dio});

  static printLog(Object? msg) {
    if (kDebugMode) {
      print(msg);
    }
  }


  Future<ProductResponse> getProducts() async {
    try {
      CommonFunctions.printLog("URL ${ApiEndpoints.products}");
      final response = await dio!.get(ApiEndpoints.products);
      CommonFunctions.printLog("RESPONSE ${response.data.toString()}");
      return  ProductResponse(status: true,message: "Success",data: ProductResponse.fromJson(response.data).data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ProductResponse(status: false,message: errorMessage);
    }
  }


}
