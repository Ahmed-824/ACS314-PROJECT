import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/player_provider.dart';
import '../../models/song_model.dart';
import '../../widgets/mini_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Dummy data for visual testing
  static final List<Song> dummySongs = [
    Song(id: '1', title: 'Code & Chill', artist: 'Flutter Dev', coverUrl: 'https://picsum.photos/200', audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'),
    Song(id: '2', title: 'Midnight Dart', artist: 'Google', coverUrl: 'https://picsum.photos/201', audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Good Evening'), backgroundColor: Colors.black),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: dummySongs.length,
            itemBuilder: (context, index) {
              final song = dummySongs[index];
              return ListTile(
                leading: Image.network(song.coverUrl),
                title: Text(song.title, style: const TextStyle(color: Colors.white)),
                subtitle: Text(song.artist, style: const TextStyle(color: Colors.grey)),
                onTap: () => context.read<PlayerProvider>().playSong(song),
              );
            },
          ),
          const Positioned(bottom: 0, left: 0, right: 0, child: MiniPlayer()),
        ],
      ),
    );
  }
}