#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uResolution;
uniform sampler2D uTexture;
uniform vec2 uTextureResolution;
uniform vec2 uTextureOffset;

vec4 blur(vec2 uv) {
    vec4 c = vec4(0.0);
    c += texture(uTexture, uv + vec2(-1.0, -1.0) / uResolution) * 0.05;
    c += texture(uTexture, uv + vec2( 1.0, -1.0) / uResolution) * 0.05;
    c += texture(uTexture, uv + vec2(-1.0,  1.0) / uResolution) * 0.05;
    c += texture(uTexture, uv + vec2( 1.0,  1.0) / uResolution) * 0.05;

    c += texture(uTexture, uv + vec2(-1.0, 0.0) / uResolution) * 0.1;
    c += texture(uTexture, uv + vec2( 1.0, 0.0) / uResolution) * 0.1;
    c += texture(uTexture, uv + vec2( 0.0,-1.0) / uResolution) * 0.1;
    c += texture(uTexture, uv + vec2( 0.0, 1.0) / uResolution) * 0.1;

    c += texture(uTexture, uv) * 0.4;
    return c;
}

void main() {
    vec2 texturePosition = gl_FragCoord.xy + uTextureOffset;
    vec2 uv = texturePosition / uTextureResolution;

    // refrakcja
    vec2 offset = (uv - 0.5) * 0.01;
    vec2 lens = uv + offset;

    fragColor = blur(lens);
}