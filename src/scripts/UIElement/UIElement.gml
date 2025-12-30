/// @func UIElement(_x, _y, _w, _h)
function UIElement(_x, _y, _w, _h) constructor {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    enabled = true;
    visible = true;
    
    
    __computed_layers = {};
    __current_state = "normal";
    __style = undefined;
    
    __parent = undefined;
    
    
    static __compute_style = function(_style, _state) {
        var _layers = [];
        
        var _i = 0;
        repeat (array_length(_style[$ _state])) {
            array_push(_layers, _style[$ _state][_i].copy());
            ++_i;
        }
        
        __computed_layers[$ _state] = _layers;
    };
    
    static set_state = function(_state) {
        __current_state = _state;
    };
    
    static set_style = function(_style) {
        var _names = struct_get_names(_style);
        
        var _i = 0;
        repeat (array_length(_names)) {
            __compute_style(_style, _names[_i]);
            ++_i;
        }
    };
    
    update = function(_mx, _my) {
        
    };
    
    draw = function(_mx, _my) {
        if (!visible) exit;
        
        var _layers = __computed_layers[$ __current_state];
        if (_layers == undefined) {
            return fallback_draw(_mx, _my);
        }
        
        var _i = 0, _layers_count = array_length(_layers);
        repeat (_layers_count) {
            var _l = _layers[_i];
            _l.draw(x + _mx, y + _my, w, h);
            ++_i;
        }
    };
    
    fallback_draw = function(_mx, _my) {};
    
    static get_global_x = function() {
        return (__parent != undefined ? __parent.get_global_x() : 0) + x;
    };
    
    static get_global_y = function() {
        return (__parent != undefined ? __parent.get_global_y() : 0) + y;
    };
}
