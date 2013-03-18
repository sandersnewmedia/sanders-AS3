package com.sandersnewmedia.enum
{
    [Bindable]
    public class Enum
    {
        public var type:String;
        public var label:String;
        
        public function Enum(type:String, label:String) {
            this.type = type;
            this.label = label;
        }
        
        protected static function byKey(key:String, value:String, list:Array):* {
            var result:*;
            list.map(function(enum:Enum, ...rest):void {
                if(enum[key] == value) {
                    result = enum;
                }
            });
            return result;
        }
    }
}