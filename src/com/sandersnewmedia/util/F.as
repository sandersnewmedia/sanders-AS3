package com.sandersnewmedia.util
{
    public class F
    {
        public static function range(len:int, initObj:Object = null):Array {
            var a:Array = [];
            var i:int = 0;
            for(i;i<len;i++) {
                a.push(ReflectionUtil.construct(initObj) || i);
            }
            return a;
        }
        
        /**
         * Compose and evaluate a list of functions
         * 
         * Can be of the form Function or [Function param]
         * Use: To compose functions A, B, C, D, E
         *        feeding extra parameter w to function A
         *        feeding extra parameter x, y to function B
         *        feeding extra parameter z to function D
         * 
         * Traditional:     result = E(D(C(B(A(w), x, y)), z));
         * Compositional:   result = F.compose(E, [D, z], C, [B, x, y], [A, w]);
         */
        public static function compose(arr:Array):* {
            // Final result
            var output:*;
            
            // Storage for current array element, function, and parameter
            var obj:*;
            var f:Function;
            var p:Array;
            
            // Function composition, so begin at last Array element
            var i:int = arr.length - 1;
            for(i; i>-1; i--) {
                
                obj = arr[i];
                
                if (obj is Array) {
                    f = obj.shift();
                    p = obj;
                } else {
                    f = obj;
                    p = [];
                }
                
                output = f.apply(null, output ? [output].concat(p) : p);
            }
            
            return output;
        }
        
        public static function partial(f:Function, ...a):Function {
            return function(...b):* {
                return f.apply(null, a.concat(b))
            }
        }
    }
}