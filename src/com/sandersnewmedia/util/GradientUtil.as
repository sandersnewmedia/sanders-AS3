package com.sandersnewmedia.util
{
    import flash.display.*;
    import flash.geom.Matrix;
    
    public class GradientUtil
    {
        private static const x:int = 0;
        private static const y:int = 0;
        
        private static const type:String = GradientType.LINEAR;
        private static const rotation:Number = Math.PI/2;
        
        private static const alphas:Array = [100,100];
        private static const ratios:Array = [0x00,0xCC];
        
        public static function draw(colors:Array,
                                    sprite:Sprite,
                                    w:Number,
                                    h:Number,
                                    rad:int):void {
            var matrix:Matrix = new Matrix();
            matrix.createGradientBox(w, h, rotation);
            
            with(sprite.graphics)
            {
                clear();
                beginGradientFill(type, colors, alphas, ratios, matrix);
                drawRoundRectComplex(x, y,
                    w, h,
                    rad, rad, rad, rad);
                endFill();
            }
        }
    }
}