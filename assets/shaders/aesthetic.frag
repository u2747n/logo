vec4 effect(vec4 color, Image texture, vec2 tc, vec2 pc) {
  vec4 r = vec4(Texel(texture, tc - 2.0/love_ScreenSize.xy).r, Texel(texture, tc).g, Texel(texture, tc + 2.0/love_ScreenSize.xy).b, Texel(texture, tc).a);
  r -= 0.24*sin(tc.y*1200.0)*0.04;
  return color*r;
}
