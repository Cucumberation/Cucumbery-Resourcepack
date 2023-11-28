#version 150

in vec4 vertexColor;
in vec2 uv;
flat in int customType;

uniform vec4 ColorModulator;

out vec4 fragColor;

void main() {
  vec4 color = vertexColor;
  if (color.a == 0.0) {
    discard;
  }
  if (customType == 1) { // Item hover highlightW
    float m = abs(1.0 - (0.5 + uv.x * 0.5) - (0.5 + uv.y * 0.5));
    if ((abs(uv.x) > 0.9) || (abs(uv.y) > 0.9)) {
      fragColor = vec4(1.0, 1.0, 1.0, 1.0); // outline
    } else if ((abs(uv.x) > 0.9) || (abs(uv.y) > 0.9)) {
      fragColor = vec4(0.0, 0.0, 0.0, 0.5 * m + 0.2); // outline shadow
    } else {
      discard; // inside
    }
    return;
  } else {
    fragColor = color * ColorModulator;
  }
}
