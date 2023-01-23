import 'package:toko_kopi/data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> fetch();
}