moonscript = true
require('engine')
init = function()
  white = Color(1, 1, 1, 1)
  bg = Color('#eeeeee')
  fg = Color('#393e46')
  graphics.set_background_color(bg)
  graphics.set_color(fg)
  thaleah = Font('ThaleahFat', 16)
  vcr_osd_mono = Font('VCR_OSD_MONO_1.001', 41)
  pixellari = Font('Pixellari', 16)
  retron = Font('Retron2000', 27)
  game_canvas = Canvas(gw, gh)
  shadow_canvas = Canvas(gw, gh)
  shadow_shader = Shader(nil, 'shadow.frag')
end
update = function(dt) end
draw = function()
  local x1, y1 = gw / 2, gh / 2
  local x2, y2 = math.floor(x1 + 20 * math.cos(-math.pi / 4)), math.floor(y1 + 20 * math.sin(-math.pi / 4))
  local x3, y3 = math.floor(x2 + 60 * math.cos(math.pi / 4)), math.floor(y2 + 60 * math.sin(math.pi / 4))
  local x4, y4 = math.floor(x3 + 20 * math.cos(-math.pi / 4)), math.floor(y3 + 20 * math.sin(-math.pi / 4))
  local x5, y5 = math.floor(x4 + 20 * math.cos(math.pi / 4)), math.floor(y4 + 20 * math.sin(math.pi / 4))
  local x6, y6 = math.floor(x5 + 40 * math.cos(-math.pi / 4)), math.floor(y5 + 40 * math.sin(-math.pi / 4))
  local x7, y7 = math.floor(x6 + 5 * math.cos(math.pi / 4)), math.floor(y6 + 5 * math.sin(math.pi / 4))
  game_canvas:draw_to((function()
    graphics.set_line_width(4)
    graphics.set_color(fg)
    love.graphics.line(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7)
    graphics.print('u2747n', retron, math.floor(x1 + 40), math.floor(y1 - 60))
    graphics.push(gw / 4, gh / 2, math.pi / 4)
    graphics.rectangle(gw / 4, gh / 2, 6, 6, nil, nil, fg)
    return graphics.pop()
  end))
  shadow_canvas:draw_to((function()
    graphics.set_color(white)
    shadow_shader:set()
    game_canvas:draw2(0, 0, 0, 1, 1)
    shadow_shader:unset()
    return graphics.set_color(fg)
  end))
  shadow_canvas:draw(4, 4, 0, sx, sy)
  return game_canvas:draw(0, 0, 0, sx, sy)
end
love.run = function()
  return engine_run({
    moonscript = true,
    game_name = 'logo',
    game_width = 480,
    game_height = 270,
    window_width = 480 * 3,
    window_height = 270 * 3,
    line_style = 'rough',
    default_filter = 'nearest',
    init = init,
    update = update,
    draw = draw
  })
end
