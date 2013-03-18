package com.sandersnewmedia.log
{
    import com.sandersnewmedia.util.ReflectionUtil;
    
    import mx.messaging.messages.*;
    import mx.rpc.events.*;
    
    public class AsyncUtil
    {
        public static function logAsync(e:AbstractEvent):void
        {
            Logger.info('Async: ' + e.toString());
        }
        
        public static function logAsyncResult(result:ResultEvent):void
        {
            var command:Object = result.token.responders[0];
            var commandName:String = ReflectionUtil.getClassName(command);
            Logger.info('Async ['+commandName+']: result');
        }
        
        public static function logAsyncFault(fault:FaultEvent) : void {
            var command:Object = fault.token.responders[0];
            var commandName:String = ReflectionUtil.getClassName(command);
            Logger.error('Async ['+commandName+']:\n' + fault.fault.toString());
        }
    }
}