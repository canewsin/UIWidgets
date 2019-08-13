Shader "UIWidgets/canvas_tex_cb"
{
    Properties {
       _SrcBlend("_SrcBlend", Int) = 1 // One
       _DstBlend("_DstBlend", Int) = 10 // OneMinusSrcAlpha
       _StencilComp("_StencilComp", Float) = 3 // - Equal, 8 - Always 
    }
   
    SubShader {
        ZTest Always
        ZWrite Off
        Blend [_SrcBlend] [_DstBlend]
                
        Stencil {
            Ref 128
            Comp [_StencilComp]
        }

        Pass { // 0, color
            CGPROGRAM
            #define UIWIDGETS_COLOR
            #include "../UIWidgets_canvas.cginc"
            #include "UIWidgets_canvas_cb.cginc"
            #pragma vertex vert_compute
            #pragma fragment frag_tex
            ENDCG
        }
        
        Pass { // 1, linear
            CGPROGRAM
            #define UIWIDGETS_LINEAR
            #include "../UIWidgets_canvas.cginc"
            #include "UIWidgets_canvas_cb.cginc"
            #pragma vertex vert_compute
            #pragma fragment frag_tex
            ENDCG
        }

        Pass { // 2, radial
            CGPROGRAM
            #define UIWIDGETS_RADIAL
            #include "../UIWidgets_canvas.cginc"
            #include "UIWidgets_canvas_cb.cginc"
            #pragma vertex vert_compute
            #pragma fragment frag_tex
            ENDCG
        }

        Pass { // 3, sweep
            CGPROGRAM
            #define UIWIDGETS_SWEEP
            #include "../UIWidgets_canvas.cginc"
            #include "UIWidgets_canvas_cb.cginc"
            #pragma vertex vert_compute
            #pragma fragment frag_tex
            ENDCG
        }
        
        Pass { // 4, image
            CGPROGRAM
            #define UIWIDGETS_IMAGE
            #include "../UIWidgets_canvas.cginc"
            #include "UIWidgets_canvas_cb.cginc"
            #pragma vertex vert_compute
            #pragma fragment frag_tex
            ENDCG
        }     
    }
}
