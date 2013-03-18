package com.sandersnewmedia.business
{
    import com.sandersnewmedia.log.Logger;
    
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.net.URLRequest;
    
    import mx.rpc.IResponder;
    
    public class URLLoaderDelegate
        extends Delegate
    {
        public var loader:URLLoader;
        
        public function load(responder:IResponder, urlRequest:URLRequest = null):void {
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.TEXT;
            loader.addEventListener(Event.COMPLETE, function(e:Event):void {
                responder.result(URLLoader(e.currentTarget).data);
            }); 
            loader.addEventListener(IOErrorEvent.IO_ERROR, function(e:Event):void {
                responder.fault(e);
            });
            loader.addEventListener(ProgressEvent.PROGRESS, function(event:ProgressEvent):void 
            {
                Logger.info("URLLoaderDelegate[" + url + "].PROGRESS: " + event.bytesLoaded / event.bytesTotal + "%");
            });
            loader.load(urlRequest || new URLRequest(url));
        }
    }
}
