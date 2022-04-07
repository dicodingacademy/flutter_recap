import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/io_client.dart';

class SSLPinning {
  static Future<IOClient> get ioClient async {
    final sslCert = await rootBundle.load('assets/certificate-dog-breed.cer');
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
    HttpClient client = HttpClient(context: securityContext);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    return IOClient(client);
  }
}
