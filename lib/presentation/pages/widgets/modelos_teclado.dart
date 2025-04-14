import 'package:app_http/core/utils/audio_player.dart';
import 'package:flutter/material.dart';

Expanded teclado({required int nota, required Color cor}) {
  return Expanded(
    child: TextButton(
      onPressed: () {
        audioconfig(nota);
      },
      style: TextButton.styleFrom(
        backgroundColor: cor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: const SizedBox.shrink(),
    ),
  );
}
