import 'package:dio/dio.dart';
import 'package:toko_kopi/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<bool> delete({required int id});
  Future<List<ProductModel>> fetch();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<ProductModel>> fetch() async {
    try {
      List<ProductModel> listProduct = [];
        final response = await dio.get('http://localhost/toko_kopi/server/api/produk/fetch');
      for (var data in response.data['data']) {
        ProductModel product = ProductModel.fromJson(data);
        listProduct.add(product);
      }
      return listProduct;
    } on DioError catch (e) {
      throw (DioError(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      ));
    } on Exception catch (e) {
      throw e.toString();
    }
  }
  
  @override
  Future<bool> delete({required int id}) async {
   try {
        final response = await dio.delete(
          'localhost/toko_kopi/server/api/produk/delete.php'
          ,data: {"id": 1});
      if (response.statusCode==200 && response.data.toString().isNotEmpty) (
     return true;
      )else (
        return true;
      )
      return true;
    } on DioError catch (e) {
      throw (DioError(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      ));
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}