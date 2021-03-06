import QtQuick 2.0


// 墨色(sepia)
ShaderEffect {
    id: shader
    width: source.width
    height: source.height
    property variant source : img
    property real dividerValue: 1


    fragmentShader: "
uniform float dividerValue;
uniform sampler2D source;
uniform lowp float qt_Opacity;
varying vec2 qt_TexCoord0;

void main()
{
    vec2 uv = qt_TexCoord0.xy;
    vec4 orig = texture2D(source, uv);
    vec3 col = orig.rgb;
    float y = 0.3 * col.r + 0.59 * col.g + 0.11 * col.b;
    if (uv.x < dividerValue)
        gl_FragColor = qt_Opacity * vec4(y + 0.15, y + 0.07, y - 0.12, 1.0);
    else
        gl_FragColor = qt_Opacity * orig;
}
        "
}

