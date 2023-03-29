#version 150

in vec4 vertexColor;
in vec2 uv;
flat in int customType;

uniform vec4 ColorModulator;

out vec4 fragColor;

#define HOVER_OUTLINE_COLOR vec4(0.988, 0.988, 0.988, 1.0)

void main() {
  vec4 color = vertexColor;
  if (customType == 1) { // Item hover highlight
    if ((abs(uv.x) > 0.9) || (abs(uv.y) > 0.9)) {
      fragColor = vec4(HOVER_OUTLINE_COLOR.rgb, HOVER_OUTLINE_COLOR.a); // outline
    }
    return;
  } else {
    fragColor = color * ColorModulator;
  }
}