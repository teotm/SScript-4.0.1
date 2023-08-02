package tea.backend;

import hscriptBase.Printer;

using StringTools;

class PrinterTool 
{
    public var printer(default, null):Printer;
    public var expr(default, null):Expr;
    public var script(get, never):String;

    @:noPrivateAccess var _destroyed:Bool = false;
    
    public function new()
        printer = new Printer();

    public inline function toString():String
        return if (expr != null) script else "[object Object]";

    @:noPrivateAccess inline function setExpr(e):Void
        if (!_destroyed) expr = e;

    function get_script():String 
    {
        if (_destroyed)
            return null;
        
        return if (expr != null) printer.exprToString(expr).trim() else null;
    }

    function destroy() 
    {
        _destroyed = true;
        printer = null;
        expr = null;    
    }
}