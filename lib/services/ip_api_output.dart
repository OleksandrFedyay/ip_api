import 'package:ip_api/services/network_service.dart';

const String ipApiUrl = 'http://ip-api.com/json/';

class IpApiOutput {
  IpApiOutput({required this.query});
  final String query;

  Future<dynamic> getIpApiData() async {
    try {
      NetworkService networkService = NetworkService('$ipApiUrl$query');

      var ipApiResponse = await networkService.getData();
      return ipApiResponse;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
