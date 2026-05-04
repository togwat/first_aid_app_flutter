import 'dart:async';
import 'package:flutter/material.dart';

class CPRTimer extends StatefulWidget {
  const CPRTimer(this.bpm, this.compressions, this.rescueBreaths, {super.key});

  final int bpm;
  final int compressions;
  final int rescueBreaths;

  @override
  State<CPRTimer> createState() => _CPRTimerState();
}

class _CPRTimerState extends State<CPRTimer> {
  final _stopwatch = Stopwatch();
  Timer? _ticker;

  void onStart() {
    setState(() {
      _stopwatch.reset();

      _stopwatch.start();
      _ticker = Timer.periodic(const Duration(milliseconds: 100), (_) {
        setState(() {});
      });
    });
  }

  void onStop() {
    setState(() {
      _stopwatch.stop();
      _ticker?.cancel();
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
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
          _elapsed,
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold, fontFeatures: [FontFeature.tabularFigures()]),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _stopwatch.isRunning ? onStop : onStart,
          child: Text(_stopwatch.isRunning ? 'Stop' : 'Start'),
        ),
      ],
    );
  }
}
