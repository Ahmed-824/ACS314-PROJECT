import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/player_provider.dart';

class PlayerDetail extends StatelessWidget {
  const PlayerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PlayerProvider>();
    final song = provider.currentSong;

    if (song == null) return const Scaffold();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Playing from Playlist", style: TextStyle(fontSize: 12)),
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
              child: Image.network(song.coverUrl, height: 300, width: 300, fit: BoxFit.cover),
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

            // Progress Slider (Placeholder for now)
            Slider(
              activeColor: Colors.white,
              inactiveColor: Colors.white24,
              value: 0.3, // You can link this to provider.position later
              onChanged: (v) {},
            ),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: const Icon(Icons.shuffle, color: Colors.green), onPressed: () {}),
                IconButton(icon: const Icon(Icons.skip_previous, size: 40), onPressed: () {}),
                
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

                IconButton(icon: const Icon(Icons.skip_next, size: 40), onPressed: () {}),
                IconButton(icon: const Icon(Icons.repeat, color: Colors.green), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}