/// @func UIElement(_x, _y, _w, _h)
function UIElement(_x, _y, _w, _h) constructor {
    __computed_layers = {};
    __current_state = "normal";
    __style = undefined;
    
    __parent = undefined;
    
    
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    enabled = true;
    visible = true;
    
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
    
    update_begin
        
    update_end;
    
    draw_begin
        var _gx = _px + x;
        var _gy = _py + y;
        
        var _layers = __computed_layers[$ __current_state];
        if (_layers == undefined) {
            return fallback_draw(_gx, _py);
        }
        
        var _i = 0, _layers_count = array_length(_layers);
        repeat (_layers_count) {
            var _l = _layers[_i];
            _l.draw(_gx, _gy, w, h);
            ++_i;
        }
    draw_end;
    
    fallback_draw = function(_px, _py) {};
    
    static get_global_x = function() {
        return (__parent != undefined ? __parent.get_global_x() : 0) + x;
    };
    
    static get_global_y = function() {
        return (__parent != undefined ? __parent.get_global_y() : 0) + y;
    };
}
