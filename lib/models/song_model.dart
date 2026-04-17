class Song {
  final String id;
  final String title;
  final String artist;
  final String coverUrl;
  final String audioUrl;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.coverUrl,
    required this.audioUrl,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      // 1. Matches column 'id'
      id: json['id']?.toString() ?? '',
      
      // 2. Matches column 'title'
      title: json['title'] ?? 'Unknown Title',
      
      // 3. Matches column 'artist'
      artist: json['artist'] ?? 'Unknown Artist',
      
      // 4. Matches column 'coverUrl'
      // Since the DB has the full URL, we grab it directly.
      coverUrl: json['coverUrl'] ?? '',
          
      // 5. Matches column 'audioUrl'
      // This fixes the "Empty src attribute" crash!
      audioUrl: json['audioUrl'] ?? '',
    );
  }
}