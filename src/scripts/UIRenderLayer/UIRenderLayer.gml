/// @func  UIRenderLayer(_sprite, [_frame])
function UIRenderLayer(_sprite, _frame=0) constructor {
    sprite = _sprite;
    frame  = _frame;
    
    x = 0;
    y = 0;
    
    xscale = 1;
    yscale = 1;
    angle  = 0;
    alpha  = 1;
    colour = c_white;
    
    visible = true;
    
    static update = function(_x, _y, _w, _h) {
        /// TODO: update render params here, not in render
    };
    
    static draw = function(_x, _y, _w, _h) {
        var _ws = _w / (sprite_get_bbox_right(sprite) - sprite_get_bbox_left(sprite) + 1);
        var _hs = _h / (sprite_get_bbox_bottom(sprite) - sprite_get_bbox_top(sprite) + 1);
        
        var _xs = _ws * xscale;
        var _ys = _hs * yscale;
        
        draw_sprite_ext(
            sprite, frame,
            _x - sprite_get_bbox_left(sprite) * _xs,
            _y - sprite_get_bbox_top(sprite) * _ys,
            _xs,
            _ys,
            angle,
            colour,
            alpha
        );
    };
    
    static copy = function() {
        // TODO: maybe better copy?
        var _layer = new UIRenderLayer(sprite, frame);
        _layer.x = x;
        _layer.y = y;
        
        _layer.xscale = xscale;
        _layer.yscale = yscale;
        _layer.angle  = angle;
        _layer.colour = colour;
        
        _layer.visible = visible;
        return _layer;
    };
}
