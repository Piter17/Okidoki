#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 u_size;
uniform float u_time;

float rand(vec2 co) {
  return fract(sin(mod(dot(co, vec2(12.9898, 78.233)), 3.14)) * 43758.5453);
}

float tnoise(vec2 co) {
  co.y += co.x / 2.0;

  vec2 p = floor(co);
  if (fract(co.x) < fract(co.y)) {
    p += 0.5;
  }

  return rand(p);
}

void main() {
  vec2 fragCoord = FlutterFragCoord().xy;
  vec2 uv = (fragCoord * 2.0 - u_size) / 40.0;

  float n = tnoise(uv);

  float value =
      (sin(u_time * n * 7.0 + n * 6.2831853) * 0.5 + 0.5) * 0.3 + 0.5;

  value += sin((uv.x - uv.y) * 30.0) / 2.0;
  value += rand(uv) / 2.0;
  value /= 4.0;

  fragColor = vec4(vec3(value), 1.0);
}

