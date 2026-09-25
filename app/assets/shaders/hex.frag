#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 u_size;
uniform float u_time;

#define TWO_PI 6.283185

vec3 iq_color_palette(vec3 a, vec3 b, vec3 c, vec3 d, float t) {
  return a + b * cos(TWO_PI * (c * t + d));
}

vec4 hexagon(vec2 p) {
  vec2 q = vec2(p.x * 2.0 * 0.5773503, p.y + p.x * 0.5773503);

  vec2 pi = floor(q);
  vec2 pf = fract(q);

  float v = mod(pi.x + pi.y, 3.0);

  float ca = step(1.0, v);
  float cb = step(2.0, v);
  vec2 ma = step(pf.xy, pf.yx);

  float e = dot(
    ma,
    1.0 - pf.yx +
        ca * (pf.x + pf.y - 1.0) +
        cb * (pf.yx - 2.0 * pf.xy)
  );

  p = vec2(
    q.x + floor(0.5 + p.y / 1.5),
    4.0 * p.y / 3.0
  ) * 0.5 + 0.5;

  float f = length((fract(p) - 0.5) * vec2(1.0, 0.85));

  return vec4(pi + ca - cb * ma, e, f);
}

float hash1(vec2 p) {
  float n = dot(p, vec2(127.1, 311.7));
  return fract(sin(n) * 43758.5453);
}

float hash3(vec3 p) {
  p = fract(p * 0.1031);
  p += dot(p, p.yzx + 33.33);
  return fract((p.x + p.y) * p.z);
}

float noise(vec3 x) {
  vec3 p = floor(x);
  vec3 f = fract(x);

  f = f * f * (3.0 - 2.0 * f);

  float n000 = hash3(p + vec3(0.0, 0.0, 0.0));
  float n100 = hash3(p + vec3(1.0, 0.0, 0.0));
  float n010 = hash3(p + vec3(0.0, 1.0, 0.0));
  float n110 = hash3(p + vec3(1.0, 1.0, 0.0));
  float n001 = hash3(p + vec3(0.0, 0.0, 1.0));
  float n101 = hash3(p + vec3(1.0, 0.0, 1.0));
  float n011 = hash3(p + vec3(0.0, 1.0, 1.0));
  float n111 = hash3(p + vec3(1.0, 1.0, 1.0));

  float nx00 = mix(n000, n100, f.x);
  float nx10 = mix(n010, n110, f.x);
  float nx01 = mix(n001, n101, f.x);
  float nx11 = mix(n011, n111, f.x);

  float nxy0 = mix(nx00, nx10, f.y);
  float nxy1 = mix(nx01, nx11, f.y);

  return mix(nxy0, nxy1, f.z);
}

void main() {
  vec2 fragCoord = FlutterFragCoord().xy;
  vec2 uv = fragCoord / u_size;
  vec2 pos = (-u_size + 2.0 * fragCoord) / u_size.y;

  float t = 0.8 * (1.0 - pow(uv.y, 0.5));

  pos.y -= 0.5;
  pos *= 2.0 - 0.3 * pos.y;

  vec4 h = hexagon(12.0 * pos);

  float n = noise(vec3(
    0.3 * h.xy + vec2(u_time * 0.7, 0.0),
    0.0
  ));

  t += 0.2 * (1.0 - n);

  vec3 col = 0.5 * abs(
    sin(hash1(h.xy) * 0.4 + 1.6 + vec3(1.0))
  );

  col *= smoothstep(0.0 + t, 0.1 + t, h.z);
  col *= 1.0 + 0.5 * h.z * n;

  col *= 1.0 + 0.5 * iq_color_palette(
    vec3(0.5),
    vec3(0.5),
    vec3(2.0, 1.0, 0.0),
    vec3(0.5, 0.2, 0.25),
    u_time * 0.02
  );

  col *= 0.7 + 0.3 * iq_color_palette(
    vec3(0.5),
    vec3(0.5),
    vec3(0.3, 1.0, 1.0),
    vec3(0.0, 0.25, 0.25),
    uv.y - 0.8 - u_time * 0.05
  );

  float vignette = max(
    0.0,
    16.0 * uv.x * (1.0 - uv.x) * uv.y * (1.0 - uv.y)
  );

  col *= pow(vignette, 0.4);

  fragColor = vec4(col, 1.0);
}