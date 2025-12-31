/// @func UIContainer(_x, _y, _w, _h)
function UIContainer(_x, _y, _w, _h) : UIElement(_x, _y, _w, _h) constructor {
    __super = {update, draw};
    __children = [];
    
    
    clip_children = false;
    
    static add_child = function(_child) {
        array_push(__children, _child);
        _child.__parent = self;
    };
    
    static remove_child = function(_child) {
        var _i = array_get_index(__children, _child);
        if (_i != -1) {
            array_delete(__children, _i, 1);
        }
        _child.__parent = undefined;
    };
    
    update_begin
        __super.update(_mx, _my);
        
        var _i = 0;
        repeat (array_length(__children)) {
            var _child = __children[_i];
            _child.update(_mx, _my);
            ++_i;
        }
    update_end;
    
    draw_begin
        __super.draw(_px, _py);
        
        var _gx = _px + x;
        var _gy = _py + y;
        
        var _scissor;
        if (clip_children) {
            _scissor = gpu_get_scissor();
            gpu_set_scissor(_gx, _gy, w, h);
        }
        
        var _i = 0;
        repeat (array_length(__children)) {
            var _child = __children[_i];
            _child.draw(_gx, _gy);
            ++_i;
        }
        
        if (clip_children) {
            gpu_set_scissor(_scissor);
        }
    draw_end;
}
