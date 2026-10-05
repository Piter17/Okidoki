#version 460 core
#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 u_size;

void main() {
  vec2 uv = FlutterFragCoord().xy / u_size;

  vec3 colorA = vec3(0.02, 0.05, 0.14);
  vec3 colorB = vec3(0.03, 0.65, 0.47);

  float gradient = smoothstep(0.0, 1.0, uv.y);
  vec3 color = mix(colorB, colorA, gradient);

  fragColor = vec4(color, 1.0);
}