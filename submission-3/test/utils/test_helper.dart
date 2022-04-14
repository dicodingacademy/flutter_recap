import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
])
Future<void> main() async {}