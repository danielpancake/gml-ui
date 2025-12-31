/// @desc Test UI init

ui_root = new UIContainer(100, 100, room_width - 200, room_height - 200);

ui_button = new UIButton(0, 0, 400, 400, function() {
    show_debug_message("Button clicked!");
});
ui_root.add_child(ui_button);



style = { // don't particularly like this style of init. hm...
    root: {},
    button: {}
};

style.root[$ "normal"] = [
    new UIRenderLayer(sBG)
];
style.button[$ UIButton.states.pressed] = [
    new UIRenderLayer(sButtonTest)
];


ui_root.set_style(style.root);
ui_button.set_style(style.button);
