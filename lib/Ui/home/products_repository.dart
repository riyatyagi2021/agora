import 'dart:convert';

import 'package:agora/Ui/home/product_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductListRepository {
  ProductListModel? productListModel;

  Future productsApi(String accesstoken) async {
    print(accesstoken + "bn");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');

    final productListRes = await http.get(
        Uri.parse('https://devapi.joinaurum.com/api/v1/community/product/list'),
        headers: {
          'Authorization': 'Basic YWdvcmE6YTFnJG9yLzphLS1AYXBw',
          'accessToken': accessToken.toString()
        });

    if (productListRes.statusCode == 200) {
      print(" product list api hit? " + productListRes.body);

      /*   Iterable list = json.decode(productListRes.body);
      products = list.map((productListModel) => ProductListModel.fromJson(productListModel)).toList();
     print("length+ ${products.length}");
  */
      ProductListModel productListModel =
          ProductListModel.fromJson(jsonDecode(productListRes.body));
      print("ProductList Body Response " + productListModel.status.toString());
      return productListModel;
    } else
      throw Exception("There is some error");
  }
}
