def tick args
  args.state.player ||= {
    x: 120,
    y: 280,
    w: 2 * 24,
    h: 2 * 24,
    path: 'mygame/sprites/DinoSpritesdoux.png',
    tile_x: 0,
    tile_y: 0,
    tile_w: 24,
    tile_h: 24
  }

  args.outputs.sprites << { x: 100,
                          y: 200,
                          w: 2 * 24,
                          h: 2 * 24,
                          path: 'mygame/sprites/DinoSpritesdoux.png',
                          tile_x: args.state.player.tile_x,
                          tile_y: args.state.player.tile_y,
                          tile_w: 24,
                          tile_h: 24
                          }

  how_many_frames_in_sprite_sheet = 6
  how_many_ticks_to_hold_each_frame = 4
  should_the_index_repeat = true

  player_sprite_index = 0.frame_index(how_many_frames_in_sprite_sheet, how_many_ticks_to_hold_each_frame, should_the_index_repeat)
  args.state.player = {
    x: 120,
    y: 280,
    w: 2 * 24,
    h: 2 * 24,
    path: 'mygame/sprites/DinoSpritesdoux.png',
    tile_x: 0 + (player_sprite_index * args.state.player.w),
    tile_y: 0,
    tile_w: 24,
    tile_h: 24,
    speed: 12
  }
end
