package com.sandersnewmedia.log
{
    public class LogChannel
    {
        public static const DEBUG   :LogChannel = new LogChannel("Debug",Level.DEBUG);
        public static const INFO    :LogChannel = new LogChannel("Info",Level.INFO);
        public static const COMM    :LogChannel = new LogChannel("Comm",Level.INFO);        
        public static const WARN    :LogChannel = new LogChannel("Warn",Level.WARN);
        public static const ERROR   :LogChannel = new LogChannel("Error",Level.ERROR);
        public static const FATAL   :LogChannel = new LogChannel("Fatal",Level.FATAL);
        public static const STATUS  :LogChannel = new LogChannel("Stat",Level.INFO);
        
        public var name:String;
        public var enabled:Boolean;
        public var htmlFormattedChannelName:String;
        public var normalFormattedChannelName:String;
        public var level:Number;
        
        public function LogChannel(name:String, level:Number,
                                   enabled:Boolean = true)
        {
            this.name       = name;
            this.enabled    = enabled;
            this.level		= level;
            
            normalFormattedChannelName = normalFormatChannelName(this);
            htmlFormattedChannelName = htmlFormatChannelName(this);
        }
        
        private function htmlFormatChannelName(channel:LogChannel):String
        {
            var name:String = channel.name.toUpperCase();
            while(name.length < 5) {
                name += "&nbsp;";
            }
            var result:String = "<b>| " + name + " |</b>";
            
            switch(channel.name)
            {
                case "Info":
                    result = LogColor.greyify(result);
                    break;
                
                case "Debug":
                    result = LogColor.debugify(result);
                    break;
                
                case "Error":
                    result = LogColor.redify(result);
                    break;
            }
            
            return result;
        }
        
        private function normalFormatChannelName(channel:LogChannel):String
        {
            var name:String = channel.name.toUpperCase();
            while(name.length < 5) {
                name += " ";
            }
            var result:String = "| " + name + " |";
            
            return result;
        }
        
    }
}