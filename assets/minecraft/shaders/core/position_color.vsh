#version 150

in vec3 Position;
in vec4 Color;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

out vec4 vertexColor;
out vec2 uv;
flat out int customType;

bool aproxEqual(float a, float b)
{
	return (a < b+0.00001 && a > b-0.00001);
}
bool aproxEqualV3(vec3 a, vec3 b)
{
	return (lessThan(a, b+0.0001)==bvec3(true) && lessThan(b-0.0001,a)==bvec3(true));
}

void main() {
    customType = 0;
	
	vertexColor = Color;
	
	vec3 offset = vec3(0.0);
	
	//is white?
	if (aproxEqualV3(Color.rgb,vec3(1.0)))
	{
		//is hover?
		if(aproxEqual(Color.a,0.50196) && gl_VertexID > -1 && gl_VertexID < 4)
		{
			customType = 1;
			float padding = 1.0;
            switch(gl_VertexID % 4)
            {
            case 0:
                uv = vec2(1.0, -1.0);
                offset.x = padding;
                offset.y = -padding;
                break;
            case 1:
                uv = vec2(-1.0, -1.0);
                offset.x = -padding;
                offset.y = -padding;
                break;
            case 2:
                uv = vec2(-1.0, 1.0);
                offset.x = -padding;
                offset.y = padding;
                break;
            case 3:
                uv = vec2(1.0, 1.0);
                offset.x = padding;
                offset.y = padding;
                break;
            }
		}
	}
	
    gl_Position = ProjMat * ModelViewMat * vec4(Position + offset, 1.0);
}