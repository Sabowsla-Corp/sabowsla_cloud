import 'dart:async';
import 'dart:io';

import 'package:sabowsla/sabowsla.dart';
import 'package:sabowsla/src/sabowsla_client.dart';

Future<void> main() async {
  const sabowslaUrl = 'YOUR_SUPABASE_URL';
  const sabowslaKey = 'YOUR_ANON_KEY';
  final sabowsla = SabowslaClient(sabowslaUrl, sabowslaKey);

  // query data
  final data =
      await sabowsla.from('countries').select().order('name', ascending: true);
  print(data);

  // insert data
  await sabowsla.from('countries').insert([
    {'name': 'Singapore'},
  ]);

  // update data
  await sabowsla.from('countries').update({'name': 'Singapore'}).eq('id', 1);

  // delete data
  await sabowsla.from('countries').delete().eq('id', 1);

  // realtime
  final realtimeChannel = sabowsla.channel('my_channel');
  realtimeChannel
      .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'countries',
          callback: (payload) {})
      .subscribe();

  // remember to remove channel when no longer needed
  sabowsla.removeChannel(realtimeChannel);

  // stream
  final streamSubscription = sabowsla
      .from('countries')
      .stream(primaryKey: ['id'])
      .order('name')
      .limit(10)
      .listen((snapshot) {
        print('snapshot: $snapshot');
      });

  // remember to remove subscription
  streamSubscription.cancel();

  // Upload file to bucket "public"
  final file = File('example.txt');
  file.writeAsStringSync('File content');
  final storageResponse =
      await sabowsla.storage.from('public').upload('example.txt', file);
  print('upload response : $storageResponse');

  // Get download url
  final urlResponse =
      await sabowsla.storage.from('public').createSignedUrl('example.txt', 60);
  print('download url : $urlResponse');

  // Download text file
  final fileResponse =
      await sabowsla.storage.from('public').download('example.txt');
  print('downloaded file : ${String.fromCharCodes(fileResponse)}');

  // Delete file
  final deleteFileResponse =
      await sabowsla.storage.from('public').remove(['example.txt']);
  print('deleted file id : ${deleteFileResponse.first.id}');

  // Local file cleanup
  if (file.existsSync()) file.deleteSync();
}
