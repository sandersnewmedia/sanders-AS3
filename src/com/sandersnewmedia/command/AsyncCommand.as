package com.sandersnewmedia.command
{
    import com.sandersnewmedia.log.AsyncUtil;
    import com.sandersnewmedia.log.Logger;
    import com.sandersnewmedia.util.ReflectionUtil;
    
    import mx.rpc.IResponder;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;
    
    public class AsyncCommand
        extends Command
        implements IResponder
    {
        private var _result:Function;
        private var _fault:Function;
        
        public function AsyncCommand(result:Function = null, fault:Function = null)
        {
            _result = result;
            _fault = fault;
        }
        
        public function result(data:Object):void {
            if(data is ResultEvent) {
                var result:ResultEvent = data as ResultEvent;
                AsyncUtil.logAsyncResult(result);
            } else {
                Logger.info('Async ['+className+']: result');
            }
            
            if(_result != null) _result(data);
        }
        
        public function fault(info:Object):void {
            if(info is FaultEvent) {
                var fault:FaultEvent = info as FaultEvent;
                AsyncUtil.logAsyncFault(fault);
            } else {
                Logger.info('Async ['+className+']: fault');
            }
            
            if(_fault != null) _fault(info);
        }
        
        private function get className():String {
            return ReflectionUtil.getClassName(this);
        }
    }
}
