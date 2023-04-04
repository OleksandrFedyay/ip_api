import 'package:test/test.dart';
import 'package:ip_api/services/ip_api_output.dart';

void main() {
  test('IpApiOutput should return data from response in Json', () async {
    final dataFromResponse = IpApiOutput(query: '8.8.8.8');

    var data = await dataFromResponse.getIpApiData();

    expect(data, {
      'status': 'success',
      'country': 'United States',
      'countryCode': 'US',
      'region': 'VA',
      'regionName': 'Virginia',
      'city': 'Ashburn',
      'zip': '20149',
      'lat': 39.03,
      'lon': -77.5,
      'timezone': 'America/New_York',
      'isp': 'Google LLC',
      'org': 'Google Public DNS',
      'as': 'AS15169 Google LLC',
      'query': '8.8.8.8'
    });
  });
}
