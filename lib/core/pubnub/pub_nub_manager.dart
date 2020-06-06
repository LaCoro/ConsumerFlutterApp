import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pubnub/pubnub.dart';

abstract class PubNubManager {
  // todo extract these in a constants file
  static const String PUBNUB_SUBSCRIBE_KEY = 'PUBNUB_SUBSCRIBE_KEY';
  static const String PUBNUB_PUBLISH_KEY = 'PUBNUB_PUBLISH_KEY';

  /// get instance fo pubnub for current environment
  static PubNub _pubNub = PubNub(
    defaultKeyset: Keyset(
      subscribeKey: DotEnv().env[PUBNUB_SUBSCRIBE_KEY],
      publishKey: DotEnv().env[PUBNUB_PUBLISH_KEY],
    ),
  );

  static Future<Subscription> initSubscription(String channelId) async {
    return _pubNub.subscribe(channels: {channelId});
  }

  static void publishMessage(String channelId, dynamic message) {
    _pubNub.publish(channelId, message);
  }
}
