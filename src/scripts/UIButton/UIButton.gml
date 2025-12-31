/// @func UIButton(_x, _y, _w, _h, [_callback])
function UIButton(_x, _y, _w, _h, _callback=undefined) : UIElement(_x, _y, _w, _h) constructor {
    __super = {update, draw}; // get UIElement methods, perhaps for the LTS support
    
    
    callback = _callback;
    
    update_begin
        __super.update(_mx, _my);
        
        var _gx = get_global_x();
        var _gy = get_global_y();
        
        var _hover = point_in_rectangle(_mx, _my, _gx, _gy, _gx + w, _gy + h);
        
        if (mouse_check_button_pressed(mb_left) && _hover) {
            set_state(states.pressed);
            //pressed_callback();
        } else if (mouse_check_button_released(mb_left)) {
            //released_callback();
        } else if (!mouse_check_button(mb_left)) {
            set_state(_hover ? states.hover : states.normal);
        }
    update_end;
    
    fallback_draw = function(_px, _py) {
        var _gx = _px + x;
        var _gy = _py + y;
        
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_rectangle(_gx, _gy, _gx + w, _gy + h, false);
    };
    
    // Helps with feather hints for styles. Enums would require to be defined
    // for each of the UI element, which is unwanted (at least, for now)
    static states = {normal:"normal", hover:"hover", pressed:"pressed"};
}
