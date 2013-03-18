package com.sandersnewmedia.business
{
    import com.sandersnewmedia.log.Logger;
    
    import mx.rpc.AsyncToken;
    import mx.rpc.IResponder;
    import mx.rpc.http.HTTPService;
    
    public class HTTPServiceDelegate
        extends Delegate
    {
        public function send(responder:IResponder, params:Object = null):void {
            var service:HTTPService = new HTTPService();
            //service.url = params == null ? url : url + UrlUtil.joinParams(params);
            service.useProxy = false;
            service.resultFormat = "text";
            
            var token:AsyncToken = service.send();
            token.addResponder(responder);
            
            Logger.info("HttpService called: " + service.url);
        }
    }
}