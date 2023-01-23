import 'package:toko_kopi/data/data_sources/remote/product_remote_data_source.dart';
import 'package:toko_kopi/data/models/product_model.dart';
import 'package:toko_kopi/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.productRemoteDataSource});

  final ProductRemoteDataSource productRemoteDataSource;

  @override
  Future<List<ProductModel>> fetch() async {
    return await productRemoteDataSource.fetch();
  }
}