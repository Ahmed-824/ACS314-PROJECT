import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/player_provider.dart';

class PlayerDetail extends StatelessWidget {
  const PlayerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // context.watch ensures the UI updates when the song position or state changes
    final provider = context.watch<PlayerProvider>();
    final song = provider.currentSong;

    if (song == null) return const Scaffold(backgroundColor: Colors.black);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("NOW PLAYING", style: TextStyle(fontSize: 12, letterSpacing: 2, color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Album Art from Backend (FlyEnv)
            Hero(
              tag: 'album_art', // Smooth transition if you added tags elsewhere
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  song.coverUrl, // This link now comes from your DB
                  height: 300, 
                  width: 300, 
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => 
                    Container(color: Colors.grey[900], height: 300, width: 300, child: const Icon(Icons.music_note, size: 100, color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 40),
            
            // Song Info from Backend
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(song.title, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  Text(song.artist, style: const TextStyle(color: Colors.grey, fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Progress Slider - Linked to Player Logic
            Slider(
              activeColor: Colors.green,
              inactiveColor: Colors.white24,
              // These values should come from your PlayerProvider duration logic
              value: provider.currentPosition.inSeconds.toDouble(),
              max: provider.totalDuration.inSeconds.toDouble(),
              onChanged: (value) {
                provider.seek(Duration(seconds: value.toInt()));
              },
            ),
            
            // Time Labels
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatDuration(provider.currentPosition), style: const TextStyle(color: Colors.grey)),
                  Text(_formatDuration(provider.totalDuration), style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: const Icon(Icons.shuffle, color: Colors.green), onPressed: () {}),
                IconButton(
                  icon: const Icon(Icons.skip_previous, size: 40, color: Colors.white), 
                  onPressed: () => provider.playPrevious(), // Link to logic
                ),
                
                // Play/Pause Button
                GestureDetector(
                  onTap: () => provider.togglePlay(),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: Icon(
                      provider.isPlaying ? Icons.pause : Icons.play_arrow, 
                      color: Colors.black, size: 40
                    ),
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.skip_next, size: 40, color: Colors.white), 
                  onPressed: () => provider.playNext(), // Link to logic
                ),
                IconButton(icon: const Icon(Icons.repeat, color: Colors.green), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper to turn seconds into 0:00 format
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}