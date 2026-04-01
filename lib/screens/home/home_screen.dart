import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/player_provider.dart';
import '../../models/song_model.dart';
import '../../widgets/mini_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Dummy data for visual testing
  static final List<Song> dummySongs = [
    Song(
      id: '1', 
      title: 'Code & Chill', 
      artist: 'Ahmed', 
      coverUrl: 'https://picsum.photos/200', 
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'
    ),
    Song(
      id: '2', 
      title: 'Wrist', 
      artist: 'Turi', 
      coverUrl: 'https://picsum.photos/201', 
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3'
    ),
    Song(
      id: '3', 
      title: 'Water', 
      artist: 'Talia', 
      coverUrl: 'https://picsum.photos/202', 
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3'
    ),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Good Evening', 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // 1. The main list of songs
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 100), // Space for MiniPlayer
            itemCount: dummySongs.length,
            itemBuilder: (context, index) {
              final song = dummySongs[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(song.coverUrl, width: 50, height: 50, fit: BoxFit.cover),
                ),
                title: Text(
                  song.title, 
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  song.artist, 
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: const Icon(Icons.more_vert, color: Colors.grey),
                onTap: () {
                  // This calls the logic in your Provider to start the music
                  context.read<PlayerProvider>().playSong(song);
                },
              );
            },
          ),

          // 2. The Mini Player - stays fixed at the bottom
          const Positioned(
            bottom: 0, 
            left: 0, 
            right: 0, 
            child: MiniPlayer(),
          ),
        ],
      ),
    );
  }
}