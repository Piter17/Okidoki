#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 u_size;
uniform sampler2D u_texture;

#define R u_size
#define PI 3.14159265
#define S smoothstep
#define PX(a) ((a) / R.y)

mat2 Rot(float a) {
  return mat2(cos(a), sin(-a), sin(a), cos(a));
}

float Box(vec2 p, vec2 b) {
  vec2 d = abs(p) - b;
  return length(max(d, vec2(0.0))) + min(max(d.x, d.y), 0.0);
}

float IconPhoto(vec2 uv) {
  float c = 0.0;

  for (float i = 0.0; i < 1.0; i += 1.0 / 8.0) {
    vec2 p = uv;
    p *= Rot(i * 2.0 * PI);
    p += vec2(0.0, PX(40.0));

    float b = Box(p, vec2(PX(0.0), PX(13.0)));
    c += S(PX(1.5), 0.0, b - PX(15.0)) * 0.2;
  }

  return c;
}

vec4 LiquidGlass(
  sampler2D tex,
  vec2 uv,
  float direction,
  float quality,
  float size
) {
  vec2 radius = size / R;
  vec4 color = texture(tex, uv);
  float samples = 1.0;

  for (float d = 0.0; d < PI; d += PI / direction) {
    for (float i = 1.0 / quality; i <= 1.0; i += 1.0 / quality) {
      vec2 offset = vec2(cos(d), sin(d)) * radius * i;
      color += texture(tex, uv + offset);
      samples += 1.0;
    }
  }

  return color / samples;
}

vec4 Icon(vec2 uv) {
  float box = Box(uv, vec2(PX(50.0)));

  float boxShape = 1.0 - smoothstep(
    PX(48.5),
    PX(50.0),
    box
  );

  float boxDisp = 1.0 - smoothstep(
    PX(25.0),
    PX(60.0),
    box
  );

  float boxLight = boxShape * (
    1.0 - smoothstep(PX(0.0), PX(30.0), abs(box - PX(40.0)))
  );

  float icon = IconPhoto(uv);

  return vec4(boxShape, boxDisp, boxLight, icon);
}

void main() {
  vec2 fragCoord = FlutterFragCoord().xy;
  vec2 uv = fragCoord / R;
  vec2 st = (fragCoord - 0.5 * R) / R.y;

    vec4 icon = Icon(uv);

  vec3 base = texture(u_texture, uv).rgb * 0.8;
  vec3 glass = LiquidGlass(
    u_texture,
    uv,
    10.0,
    10.0,
    20.0
  ).rgb * 0.7 + 0.2;

  vec3 color = mix(base, glass, icon.x);
  color += icon.z * 0.9 + icon.w;

  color *= 1.0 - 0.2 * S(
    PX(80.0),
    0.0,
    Box(uv + vec2(0.0, PX(40.0)), vec2(PX(50.0)))
  );

  fragColor = vec4(color, 1.0);
}