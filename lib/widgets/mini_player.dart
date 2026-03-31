import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/player/player_detail.dart';
import 'package:provider/provider.dart';
import '../providers/player_provider.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

 
@override
Widget build(BuildContext context) {
  final provider = context.watch<PlayerProvider>();
  if (provider.currentSong == null) return const SizedBox.shrink();

  return GestureDetector(
    onTap: () {
      // Navigate to full screen player
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const PlayerDetail()),
      );
    },
    child: Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(provider.currentSong!.coverUrl),
        ),
        title: Text(provider.currentSong!.title, style: const TextStyle(color: Colors.white)),
        trailing: IconButton(
          icon: Icon(provider.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white),
          onPressed: () => provider.togglePlay(),
        ),
      ),
    ),
  );
}
}