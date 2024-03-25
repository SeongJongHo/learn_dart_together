import 'package:learn_dart_together/24_03_25/models/stock_info.dart';

import '../http_proxy.dart';

class StockInfoApi {
  static const baseUrl =
      'https://www.alphavantage.co/query?function=LISTING_STATUS&apikey=demo';
  final HttpProxy http;

  StockInfoApi({required this.http});

  Future<List<StockInfo>> getStockInfoList() async {
    final response = await http.get(Uri.parse(baseUrl));
    List<String> stockInfoList = response.body.split('\n')..removeAt(0);

    return stockInfoList.map(stringToStockInfo).toList();
  }

  StockInfo stringToStockInfo(String el) {
    return elementToStockInfo(el.split(','));
  }

  StockInfo elementToStockInfo(List<String> el) {
    final [
      symbol,
      name,
      exchange,
      assetType,
      ipoDate,
      status,
      delistingDate,
    ] = el;

    return StockInfo(
        symbol: symbol,
        name: name,
        exchange: exchange,
        assetType: assetType,
        ipoDate: ipoDate,
        status: status,
        delistingDate: delistingDate);
  }
}
