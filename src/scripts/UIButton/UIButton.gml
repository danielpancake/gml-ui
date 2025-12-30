/// @func UIButton(_x, _y, _w, _h, [_callback])
function UIButton(_x, _y, _w, _h, _callback=undefined) : UIElement(_x, _y, _w, _h) constructor {
    __super = {update, draw}; // get UIElement methods, perhaps for the LTS support
    
    
    callback = _callback;
    
    update = function(_mx, _my) {
        var _gx = get_global_x();
        var _gy = get_global_y();
        
        var _hover = point_in_rectangle(_mx, _my, _gx, _gy, _gx + w, _gy + h);
        
        if (_hover && mouse_check_button(mb_left)) {
            set_state("pressed");
            if (callback != undefined) callback();
        } else if (_hover) {
            set_state("hover");
        } else {
            set_state("normal");
        }
        
        __super.update(_mx, _my);
    };
    
    fallback_draw = function(_global_x, _global_y) {
        var _gx = _global_x + x;
        var _gy = _global_y + y;
        
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_rectangle(_gx, _gy, _gx + w, _gy + h, false);
    };
    
    // Helps with feather hints for styles
    static states = {normal:"normal", hover:"hover", pressed:"pressed"};
}
