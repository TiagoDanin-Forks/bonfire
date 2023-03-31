import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:example/manual_map/dungeon_map.dart';
import 'package:example/shared/util/common_sprite_sheet.dart';

class Spikes extends GameDecoration with Sensor {
  Spikes(Vector2 position)
      : super.withSprite(
          sprite: CommonSpriteSheet.spikesSprite,
          position: position,
          size: Vector2.all(DungeonMap.tileSize / 1.5),
        ) {
    setupSensorArea(intervalCallback: 500);
  }

  @override
  void onContact(GameComponent component) {
    if (component is Attackable) {
      if (component is Player) {
        component.receiveDamage(AttackFromEnum.ENEMY, 10, 1);
      } else {
        component.receiveDamage(AttackFromEnum.PLAYER_OR_ALLY, 10, 1);
      }
    }
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
  }

  @override
  int get priority => LayerPriority.MAP + 1;
}
