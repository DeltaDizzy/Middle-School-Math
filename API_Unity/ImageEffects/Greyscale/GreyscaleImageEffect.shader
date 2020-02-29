Shader "KSPAPI/Greyscale"
{
    Properties
    {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _bwBlend ("Black/White Blend", Range (0,1)) = 0
    }
    
    Subshader
    {
        Pass
        {
            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                
                #include "UnityCG.cginc"
                
                uniform sampler2D _MainTex;
                uniform float _bwBlend;
                
                float4 frag(v2f_img i) : COLOR 
                {
                    float4 c = tex2D(_MainTex i.uv);
                    float lum = c.r*0.3 + c.g*0.59 + c.b*0.11;
                    float3 bw = float3(lum, lum, lum);
                    float4 result = c;
                    result.rgb = lerp(c.rgb, bw, _bwBlend);
                    return result;
                }
                
            ENDCG
        }
    }
}