package com.sandersnewmedia.log
{
    public class LogColor
    {
        public static function greenify(s:String):String    {return colorText(s, "#00f456")};
        public static function redify(s:String):String      {return colorText(s, "#FF3300")};
        public static function greyify(s:String):String     {return colorText(s, "#444444")};
        public static function blueify(s:String):String     {return colorText(s, '#155A73')};
        public static function debugify(s:String):String    {return colorText(s, "#0d0d7d")};
        
        private static function colorText(text:String, hex:String):String {return "<font color='" + hex + "'>" + text + "</font>"};
    }
}