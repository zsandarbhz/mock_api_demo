import '../../network/api/api_services.dart';
import '../../models/model.dart';
import '../repository.dart';

class ApiRepository implements Repository {
  final ApiService? apiService;
  ApiRepository({required this.apiService});

  @override
  Future<ProductResponse> getProducts() {
    return apiService!.getProducts();
  }

}
