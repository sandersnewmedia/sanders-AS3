package com.sandersnewmedia.log
{
    [Bindable]
    public class Logger
    {
        // Output of all log entries
        public static var text:String = "";
        
        // Last status message
        public static var statusMsg:String;
        
        public static function info(msg:String):void
        {
            log(msg, LogChannel.INFO);
        }
        
        public static function debug(msg:String):void
        {
            log(msg, LogChannel.DEBUG);
        }
        
        public static function error(msg:String):void
        {
            log(msg, LogChannel.ERROR);
        }
        
        public static function status(msg:String):void
        {
            log(msg, LogChannel.STATUS);
        }
        
        public static function command(msg:String):void
        {
            log(msg, LogChannel.COMM);
        }
        
        public static function pass(value:Object, prefix:String = ""):Object {
            log(prefix + value.toString(), LogChannel.DEBUG);
            return value;
        }
        
        public static function log(msg:String,
                                   channel:LogChannel = null):void
        {
            // Set default channel to info
            if(channel == null)
                channel = LogChannel.INFO;
            
            // throw away log if channel level is less then current log level
            if(channel.level < LogConfig.LOG_LEVEL) {
                return;
            }
            
            //Create the new Log Entry
            var entry:LogEntry      = new LogEntry()
            entry.timestamp     = new LogTimestamp();
            entry.channel       = channel;
            entry.message       = msg;
            
            _log.push(entry);
            
            if(_log.length > LogConfig.MAX_ENTRIES)
            {
                _log.shift();
            }
            
            updateOutput(entry);
            
            //If the channel is the status channel, set the lastStatus text
            if(channel == LogChannel.STATUS)
            {
                statusMsg = msg;
            }
            
            if(LogConfig.PASS_TO_TRACE)
            {
                trace(entry.toNormalLog());
            }
        }
        
        /**
         * This sets the showTimeStamp value and updates the text
         */  
        public static function toggleTimeStamps(enabled:Boolean) : void {
            LogConfig.SHOW_TIMESTAMP = enabled;
            updateLogText();
        }
        
        /**
         * This sets the SHOW_CHANNEL_NAME value and updates the text
         */  
        public static function toggleChannels(enabled:Boolean) : void {
            LogConfig.SHOW_CHANNEL_NAME = enabled;
            updateLogText();
        }
        
        /**
         * This sets the USE_HTML_FORMATTING value and updates the text
         */  
        public static function toggleUseHTML(enabled:Boolean) : void {
            LogConfig.USE_HTML_FORMATTING = enabled;
            updateLogText();
        }
        
        /**
         * This should be called when any flags or channels have
         * been changed so that the output is correct
         */ 
        private static function updateLogText() : void {
            text = "";
            
            for(var i:Number = 0; i < _log.length; i++) {
                var entry:LogEntry = _log[i] as LogEntry;
                updateOutput(entry);
            }
        }
        
        public static function clear():void
        {
            text = "";
            _log = new Array();
        }
        
        // Log instance
        private static var _log:Array = new Array();
        
        private static function updateOutput(entry:LogEntry):void
        {
            var logStr:String;
            
            if(LogConfig.USE_HTML_FORMATTING) {
                logStr = entry.toHTMLLog();
            }
            else {
                logStr = entry.toNormalLog();
            }
            
            if(LogConfig.REVERSE_ORDER)
            {
                text = logStr + "\n" + text;
            }
            else
            {
                text += "\n" + logStr;
            }
        }
    }
}