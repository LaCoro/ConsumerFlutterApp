import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:pubnub/pubnub.dart';

/// This page should be use to test widgets
class TestPage extends StatelessWidget {
  static const TEST_PAGE_ROUTE = '/test_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: RaisedButton(
            child: Text('Enviar'),
            onPressed: () {
              initPubNub();
            },
          ),
        ),
      ),
    );
  }

  Future initPubNub() async {
    final pubnub = PubNub(
      defaultKeyset: Keyset(
        subscribeKey: DotEnv().env['PUBNUB_SUBSCRIBE_KEY'],
        publishKey: DotEnv().env['PUBNUB_PUBLISH_KEY'],
      ),
    );

    String orderId = 'gZeiUz0PMA';
    String channel = 'ch_$orderId';
    await pubnub.publish(channel, {'message': DateFormat('HH:mm:ss').format(DateTime.now().toLocal())});
  }
}
