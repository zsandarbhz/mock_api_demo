import '../network/api/api_services.dart';
import '../models/model.dart';

abstract class Repository {

  final ApiService? apiService;
  Repository({required this.apiService});

  Future<ProductResponse> getProducts();

}
