package com.sandersnewmedia.log
{    
    public class LogTimestamp
    {
        public var text:String;
        
        private var date:Date = new Date();
        
        public function LogTimestamp()
        {	
            var hours:String = zeroFill(date.getHours(),2);
            var minutes:String = zeroFill(date.getMinutes(),2);
            var seconds:String = zeroFill(date.getSeconds(),2);
            var milli:String = zeroFill(date.getMilliseconds(),3);
            
            var timeString:String = hours+"."+minutes+"."+seconds+"."+milli;
            
            text = timeString;
        }
        
        private function zeroFill(value:Number, digits:Number) : String {
            var stringValue:String = "";
            if(value >= 100) {
                stringValue = String(value);
            }
            else if(value >= 10) {
                if(digits == 3) {
                    stringValue = "0"+value;
                }
                else {
                    stringValue = String(value);
                }
            }
            else if(value >= 0) {
                if(digits == 3) {
                    stringValue = "00"+value;
                }
                else {
                    stringValue = "0"+value;
                }
            }
            else {
                if(digits == 3) {
                    stringValue = "000";
                }
                else {
                    stringValue = "00";
                }
            }
            return stringValue;
        }
    }
}