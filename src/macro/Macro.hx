package macro;

import haxe.macro.Compiler;
import haxe.macro.Context;

class Macro
{
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