package macro;

import haxe.macro.TypeTools;
import haxe.macro.ExprTools;
import haxe.macro.TypedExprTools;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Printer;
import haxe.macro.MacroStringTools;
import haxe.macro.Compiler;
import haxe.macro.Context;

class Macro
{
    public static var macroClasses:Array<Class<Dynamic>> = [
        Compiler, Context, MacroStringTools, Printer, ComplexTypeTools, 
        TypedExprTools, ExprTools, TypeTools,
    ];

    macro public static function turnDCEOff() 
    {
        var defines = Context.getDefines();
        if (defines.get('dce') != 'no')
        {
            trace('SScript is turning off DCE');
            Compiler.define('dce', 'no');
        }
        return macro null;    
    }
}
