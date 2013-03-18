package com.sandersnewmedia.command
{
    import com.sandersnewmedia.log.Logger;
    import com.sandersnewmedia.util.ReflectionUtil;
    
    public class Command
    {
        public function logExecute(append:String = ""):void {
            if(append != "") {
                append = " - " + append;
            }
            Logger.command(ReflectionUtil.getClassName(this) + append);
        }
    }
}
