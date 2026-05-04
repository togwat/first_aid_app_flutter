import 'dart:async';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CPRTimer extends StatefulWidget {
  const CPRTimer(this.bpm, this.compressions, this.rescueBreaths, this.breathInterval, {super.key});

  final int bpm;  // compressions interval
  final int compressions; // compressions per cycle
  final int rescueBreaths;
  final int breathInterval;  

  @override
  State<CPRTimer> createState() => _CPRTimerState();
}

class _CPRTimerState extends State<CPRTimer> {
  final _stopwatch = Stopwatch();
  Timer? _ticker;
  Timer? _clockTicker;  // for stopwatch only

  int get _compressionInterval => (60000 / widget.bpm).round();

  int _compressionCount = 0;
  int _rescueBreathCount = 1;
  bool _isCompression = true;
 
  IconData get _timerIcon => _isCompression ? Icons.favorite : Symbols.pulmonology;

  void _scheduleTick() {
    final interval = _isCompression ? _compressionInterval : widget.breathInterval;
    _ticker = Timer(Duration(milliseconds: interval), () {
      if (!mounted) return;
      _tick();
    });
  }

  void _tick() {
    if (_isCompression) {
      _compressionCount++;
      if (_compressionCount % widget.compressions == 0) {
        _isCompression = false;
        _rescueBreathCount = 1;
      }
    } else {
      _rescueBreathCount++;
      if (_rescueBreathCount > widget.rescueBreaths) {
        _isCompression = true;
      }
    }

    setState(() {});
    _scheduleTick();
  }

  void onStart() {
    setState(() {
      _stopwatch.reset();
      _stopwatch.start();
      _compressionCount = 0;
      _rescueBreathCount = 0;
      _isCompression = true;
    });
    _scheduleTick();
    // for regular stopwatch
    _clockTicker = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (mounted) setState(() {});
    });
  }

  void onStop() {
    setState(() {
      _stopwatch.stop();
      _ticker?.cancel();
      _clockTicker?.cancel();
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _clockTicker?.cancel();
    super.dispose();
  }

  // format stopwatch timer
  String get _elapsed {
    final d = _stopwatch.elapsed;
    final minutes = d.inMinutes.remainder(60).toString().padLeft(1, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "CPR Practice Timer",
          style: Theme.of(context).textTheme.headlineSmall),
        Icon(_timerIcon, color: Colors.red, size: 72),
        Text(_isCompression ? "Compressions" : "Rescue Breaths"), // state indicator
        Text(_isCompression ? _compressionCount.toString() : _rescueBreathCount.toString(), style: Theme.of(context).textTheme.displayMedium),  // compression / breath count
        Text(
          _elapsed,
          style: const TextStyle(fontFeatures: [FontFeature.tabularFigures()]), // regular stopwatch
        ),
        Text("${widget.bpm} BPM"),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _stopwatch.isRunning ? onStop : onStart,
          child: Text(_stopwatch.isRunning ? 'Stop' : 'Start'),
        ),
      ],
    );
  }
}
