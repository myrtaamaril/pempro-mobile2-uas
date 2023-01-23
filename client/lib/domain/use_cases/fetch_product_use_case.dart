import 'package:toko_kopi/data/models/product_model.dart';
import 'package:toko_kopi/domain/repositories/product_repository.dart';

class FetchProductUseCase {
  FetchProductUseCase({required this.productRepository});

  final ProductRepository productRepository;

  Future<List<ProductModel>> call() async {
    return await productRepository.fetch();
  }
}