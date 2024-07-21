import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:minio_new/minio.dart';

import '../../enums/env_key.dart';

class AWSS3Core {
  static const String _endPoint = "s3-ap-northeast-1.amazonaws.com";
  static String _accessKey() => dotenv.get(EnvKey.AWS_ACCESS_KEY.name);
  static String _secretKey() => dotenv.get(EnvKey.AWS_SECRET_ACCESS_KEY.name);
  static String _region() => dotenv.get(EnvKey.AWS_S3_REGION.name);

  static final minio = Minio(
      endPoint: _endPoint,
      accessKey: _accessKey(),
      secretKey: _secretKey(),
      region: _region());
}
