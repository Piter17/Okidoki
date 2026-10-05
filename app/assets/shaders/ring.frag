#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 u_size;
uniform float u_time;

#define TIME (u_time * 0.0625)

struct Ring {
  vec2 center;
  vec2 radius;
  vec3 color1;
  vec3 color2;
  float time;
};

float sdEllipse(vec2 p, vec2 ab) {
  return (length(p / ab) - 1.0) * min(ab.x, ab.y);
}

float hash13(vec3 p) {
  p = fract(p * 0.1031);
  p += dot(p, p.yzx + 33.33);
  return fract((p.x + p.y) * p.z);
}

vec3 glowingRing(vec2 p, Ring ring) {
  float t = ring.time;
  vec2 radius = ring.radius + cos(t * 0.5 + vec2(0.3, 1.0));

  float distance = sdEllipse(p + ring.center, radius);
  vec3 color = ring.color1;

  color *= exp(-2.5 * abs(distance));
  color = mix(
    color,
    ring.color2,
    1.0 - smoothstep(0.0, 0.005, abs(distance))
  );

  return color;
}

void main() {
  vec2 fragCoord = FlutterFragCoord().xy;
  vec2 p = (2.0 * fragCoord - u_size) / u_size;

  vec3 c1 = vec3(189.0, 151.0, 100.0) / 255.0;
  vec3 c3 = vec3(75.0, 123.9, 163.0) / 255.0;

  vec3 c2 = c1 + vec3(0.3);
  vec3 c4 = c3 + vec3(0.3);

  vec3 color1 = vec3(0.0);
  vec3 color2 = vec3(0.0);

  Ring ring;

  for (float i = 0.0; i < 3.0; i++) {
    float offset = i * 0.1;

    ring.center = vec2(-2.0, cos(TIME * 1.123) * -2.0);
    ring.radius = vec2(2.5, 2.5 + cos(TIME));
    ring.color1 = c1;
    ring.color2 = c2;
    ring.time = offset + TIME;

    color1 = max(color1, glowingRing(p, ring));
  }

  for (float i = 0.0; i < 2.0; i++) {
    float offset = i * 0.1;

    ring.center = vec2(sin(TIME) * 2.0, 2.0);
    ring.radius = vec2(2.5 + cos(TIME), 2.5);
    ring.color1 = c3;
    ring.color2 = c4;
    ring.time = offset + TIME * 1.131 + 17.0;

    color2 = max(color2, glowingRing(p, ring));
  }

  vec3 color = mix(
    max(color1, color2),
    color1 + color2,
    0.75
  );

  float noise =
      (hash13(vec3(fragCoord, u_time)) - 0.5) * 4.0 / 255.0;

  fragColor = vec4(color, 1.0) + noise;
}