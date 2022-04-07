import 'package:flutter_recap/data/service/api_service.dart';
import 'package:flutter_recap/data/service/database_service.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

@GenerateMocks([
  DatabaseService,
  ApiService,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
  MockSpec<IOClient>(as: #MockIOClient),
])
Future<void> main() async {}