// ignore_for_file: uri_has_not_been_generated, undefined_class
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../common/constants.dart';
import '../model/chat_history_response.dart';
import '../model/send_message_request.dart';
import '../model/send_message_response.dart';
import '../model/trip_detail_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/chat/history')
  Future<ChatHistoryResponse> getChatHistory();

  @POST('/chat/send')
  Future<SendMessageResponse> sendMessage(@Body() SendMessageRequest request);

  @GET('/trips/{tripId}')
  Future<TripDetailResponse> getTripDetails(@Path('tripId') String tripId);
} 