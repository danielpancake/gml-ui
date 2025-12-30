/// @desc Test UI init

ui_root = new UIButton(100, 100, 400, 400, function() {
    show_debug_message("Button clicked!");
});

style = {}; // don't particularly like this style of init. hm...
style[$ UIButton.states.pressed] = [
    compute_begin
    return new UIRenderLayer(sButtonTest);
    compute_end
];

ui_root.set_style(style);
