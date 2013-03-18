package com.sandersnewmedia.log
{
    public class LogEntry
    {
        public var channel      :LogChannel;
        public var timestamp    :LogTimestamp;
        public var message      :String;
        
        public function toHTMLLog():String
        {
            var result:String = "";
            
            if(LogConfig.SHOW_TIMESTAMP)
                result += timestamp.text + " - ";
            
            if(LogConfig.SHOW_CHANNEL_NAME)
            {
                result += channel.htmlFormattedChannelName + "  ";
            }
            
            //Need to remove < and > when returning as HTML
            var tmpMessage:String = message.replace(/\</g,"&lt;");
            tmpMessage = tmpMessage.replace(/\>/g,"&gt;");
            
            result += tmpMessage;
            
            return result;
        }
        
        public function toNormalLog() : String {
            var result:String = "";
            
            if(LogConfig.SHOW_TIMESTAMP)
                result += timestamp.text + " - ";
            
            if(LogConfig.SHOW_CHANNEL_NAME)
            {
                result += channel.normalFormattedChannelName + "  ";
            }
            
            result += message;
            
            return result;
        }
    }
}