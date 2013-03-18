package com.sandersnewmedia.log
{
    [Bindable]
    public class LogConfig
    {
        /**
         * The maximum number of entries that will be stored in a channel's history
         */ 
        public static const MAX_ENTRIES:Number = 500;
        
        /**
         * Used to determine whether or not to display the timestamp
         */
        public static var SHOW_TIMESTAMP:Boolean = true;
        
        /**
         * Used to determine whether or not to display the channel name
         */
        public static var SHOW_CHANNEL_NAME:Boolean = true;
        
        /**
         * Used to determine whether to include HTML formatting or not
         */
        public static var USE_HTML_FORMATTING:Boolean = false;
        
        /**
         * Set to true to have the Logger use the trace() statement
         */
        public static const PASS_TO_TRACE:Boolean = true;
        
        /**
         * Toggle to determine which way logs are displayed
         */
        public static var REVERSE_ORDER:Boolean = true;
        
        /**
         * Set the level of logs that are displayed in the system
         */
        public static var LOG_LEVEL:Number = Level.DEBUG;
    }
}