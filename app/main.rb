def tick args
  # Initialize player state
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

  # Update sprite via player state
  args.outputs.sprites << { x: args.state.player.x,
                          y: args.state.player.y,
                          w: 2 * 24,
                          h: 2 * 24,
                          path: 'mygame/sprites/DinoSpritesdoux.png',
                          tile_x: args.state.player.tile_x,
                          tile_y: 0,
                          tile_w: 24,
                          tile_h: 24
                          }

  # update player state and animate                           
  how_many_frames_in_sprite_sheet = 2
  how_many_ticks_to_hold_each_frame = 10
  should_the_index_repeat = true

  player_sprite_index = 0.frame_index(how_many_frames_in_sprite_sheet, how_many_ticks_to_hold_each_frame, should_the_index_repeat)
  args.state.player.tile_x = (player_sprite_index * args.state.player.w)

  # move player
  if args.inputs.left
    args.state.player.x -= 10
  elsif args.inputs.right
    args.state.player.x += 10
  end

  if args.inputs.up
    args.state.player.y += 10
  elsif args.inputs.down
    args.state.player.y -= 10
  end

  # set boundaries
  if args.state.player.x + args.state.player.w > args.grid.w
    args.state.player.x = args.grid.w - args.state.player.w
  end

  if args.state.player.x < 0
    args.state.player.x = 0
  end

  if args.state.player.y + args.state.player.h > args.grid.h
    args.state.player.y = args.grid.h - args.state.player.h
  end

  if args.state.player.y < 0
    args.state.player.y = 0
  end
end
