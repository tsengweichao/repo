import 'package:dio/dio.dart';
import 'package:weather_info_demo/model/weather_info/weather_info.dart';

class QueryWeatherData {
  final _dio = Dio();
  final String _apiKey = 'CWA-F0F56B8D-979A-45D4-8731-23A235126DB2';

  Future<WeatherInfo> getWeather({String? locationName}) async {
    WeatherInfo weatherInfo;
    locationName ??= '';
    try {
      //放delay是為了觀察loading的效果
      await Future.delayed(const Duration(seconds: 2));
      final response = await _dio.get(
          'https://opendata.cwa.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=$_apiKey&locationName=$locationName');
      weatherInfo = WeatherInfo.fromJson(response.data);
      if (weatherInfo.records.location.isEmpty) {
        weatherInfo.success = false;
        weatherInfo.error.errorType = '無法取得城市資訊';
        weatherInfo.error.message = '請確認是否輸入錯誤的城市名稱?';
      }
    } on DioException catch (e) {
      weatherInfo = WeatherInfo(success: false);
      switch (e.type) {
        case DioExceptionType.connectionError:
          weatherInfo.error.errorType = '連線錯誤';
          weatherInfo.error.message = e.message ?? '';
          break;
        default:
          weatherInfo.error.errorType = e.type.name;
          weatherInfo.error.message = e.message ?? '';
      }

      return weatherInfo;
    } catch (e) {
      weatherInfo = WeatherInfo(success: false);
      weatherInfo.error.errorType = '返回資訊無法解析';
      weatherInfo.error.message = 'API返回之數據格式無法解析，或其他錯誤';
    }

    return weatherInfo;
  }
}
