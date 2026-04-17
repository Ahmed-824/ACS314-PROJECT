import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/song_model.dart';

class PlayerProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  Song? _currentSong;
  List<Song> _playlist = [];
  int _currentIndex = 0;
  
  bool _isPlaying = false;
  bool _isShuffle = false;
  bool _isRepeat = false;

  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // Getters
  Song? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;
  bool get isShuffle => _isShuffle;
  bool get isRepeat => _isRepeat;
  Duration get currentPosition => _currentPosition;
  Duration get totalDuration => _totalDuration;

  PlayerProvider() {
    // Listen for duration changes
    _audioPlayer.onDurationChanged.listen((d) {
      _totalDuration = d;
      notifyListeners();
    });

    // Listen for position changes
    _audioPlayer.onPositionChanged.listen((p) {
      _currentPosition = p;
      notifyListeners();
    });

    // Handle what happens when a song finishes
    _audioPlayer.onPlayerComplete.listen((event) {
      if (_isRepeat) {
        // Repeat current song
        playSong(_currentSong!);
      } else {
        // Go to next song
        playNext();
      }
    });
  }

  // MUST CALL THIS in your Home Screen after fetching songs from PHP
  void setPlaylist(List<Song> songs) {
    _playlist = songs;
    notifyListeners();
  }

  void playSong(Song song) async {
    _currentSong = song;
    _currentIndex = _playlist.indexOf(song);
    
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(song.audioUrl));
      _isPlaying = true;
    } catch (e) {
      debugPrint("Error playing audio: $e");
    }
    notifyListeners();
  }

  void togglePlay() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void playNext() {
    if (_playlist.isEmpty) return;

    if (_isShuffle) {
      _currentIndex = Random().nextInt(_playlist.length);
    } else {
      // Loop back to start if at the end
      _currentIndex = (_currentIndex + 1) % _playlist.length;
    }
    playSong(_playlist[_currentIndex]);
  }

  void playPrevious() {
    if (_playlist.isEmpty) return;

    // If song played for > 3 seconds, just restart it
    if (_currentPosition.inSeconds > 3) {
      seek(Duration.zero);
    } else {
      // Go to previous or loop to end if at the start
      _currentIndex = (_currentIndex - 1 < 0) ? _playlist.length - 1 : _currentIndex - 1;
      playSong(_playlist[_currentIndex]);
    }
  }

  void toggleShuffle() {
    _isShuffle = !_isShuffle;
    notifyListeners();
  }

  void toggleRepeat() {
    _isRepeat = !_isRepeat;
    notifyListeners();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}