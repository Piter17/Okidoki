#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uResolution;
uniform sampler2D uTexture;

float random(vec2 p) {
    return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}

vec4 blur(vec2 uv) {
    vec4 c = vec4(0.0);
    c += texture(uTexture, uv + vec2(-1.0, 0.0) / uResolution) * 0.2;
    c += texture(uTexture, uv + vec2( 1.0, 0.0) / uResolution) * 0.2;
    c += texture(uTexture, uv + vec2( 0.0,-1.0) / uResolution) * 0.2;
    c += texture(uTexture, uv + vec2( 0.0, 1.0) / uResolution) * 0.2;
    c += texture(uTexture, uv) * 0.2;
    return c;
}

void main() {
    vec2 uv = gl_FragCoord.xy / uResolution;

    vec4 col = blur(uv);

    // tint
    col.rgb += vec3(0.05, 0.05, 0.07);

    // noise
    float n = random(uv * uResolution) * 0.03;
    col.rgb += n;

    fragColor = col;
}