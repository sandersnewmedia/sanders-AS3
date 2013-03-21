package com.sandersnewmedia.util
{
    public class Random
    {
        public static function randomLimit(lim:Number):Number {
            return randomRange(0, lim);
        }
        
        public static function randomRange(min:Number, max:Number):Number
        {  
            return (Math.floor(Math.random() * (max - min + 1)) + min);
        }
        
        public static function randomColor():int {
            return Math.floor(Math.random() * 0xFFFFFF);
        }
    }
}