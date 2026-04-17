import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/player_provider.dart';

class PlayerDetail extends StatelessWidget {
  const PlayerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PlayerProvider>();
    final song = provider.currentSong;

    if (song == null) return const Scaffold(backgroundColor: Colors.black);

    // We create local non-nullable versions of position and duration
    // If they are null, we default to Duration.zero (0:00)
    final Duration currentPos = provider.currentPosition ?? Duration.zero;
    final Duration totalDur = provider.totalDuration ?? Duration.zero;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("NOW PLAYING", style: TextStyle(fontSize: 12, color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Album Art
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                song.coverUrl,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => 
                  Container(color: Colors.grey[900], height: 300, width: 300, child: const Icon(Icons.music_note, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 40),
            
            // Song Info
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

            // Progress Slider - FIXED with Null Safety
            Slider(
              activeColor: Colors.green,
              inactiveColor: Colors.white24,
              value: currentPos.inSeconds.toDouble(),
              // Ensure max is at least 1.0 and not null to avoid crashes
              max: totalDur.inSeconds > 0 ? totalDur.inSeconds.toDouble() : 1.0, 
              onChanged: (value) {
                provider.seek(Duration(seconds: value.toInt()));
              },
            ),

            // Time Labels - FIXED with Null Safety
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatDuration(currentPos), style: const TextStyle(color: Colors.grey)),
                  Text(_formatDuration(totalDur), style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Controls
            // Inside the Row of controls in PlayerDetail.dart

Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    // Shuffle Button
    IconButton(
      icon: Icon(Icons.shuffle, 
        color: provider.isShuffle ? Colors.green : Colors.white),
      onPressed: () => provider.toggleShuffle(),
    ),

    // Previous Button
    IconButton(
      icon: const Icon(Icons.skip_previous, size: 40, color: Colors.white), 
      onPressed: () => provider.playPrevious(),
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

    // Next Button
    IconButton(
      icon: const Icon(Icons.skip_next, size: 40, color: Colors.white), 
      onPressed: () => provider.playNext(),
    ),

    // Repeat Button
    IconButton(
      icon: Icon(Icons.repeat, 
        color: provider.isRepeat ? Colors.green : Colors.white),
      onPressed: () => provider.toggleRepeat(),
    ),
  ],
),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}