package macro;

import haxe.macro.Compiler;
import haxe.macro.Context;

class Macro
{
    macro public static function turnOnDisplay()
    {
        #if (haxe <= "4.2.5")
        trace('SScript is defining the flag \'display\'');
        Compiler.define("display");
        #else
        trace('SScript is defining the flag macro');
        Compiler.define("macro");
        #end
        return macro null;
    }

    macro public static function turnDCEOff() 
    {
        var defines = Context.getDefines();
        if (defines.get('dce') != 'no')
        {
            trace('SScript is turning of DCE');
            Compiler.define('dce', 'no');
        }
        return macro null;    
    }
}