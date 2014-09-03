Package.describe({
  summary: ''
});



Package.on_use(function (api) {
  api.use(['coffeescript', 'http']);
  api.use(['templating'], 'client');
  api.use(['ctrl', 'util', 'css-stylus']);
  api.export('Ctrls');

  // Generated with: github.com/philcockfield/meteor-package-paths
  api.add_files('shared/ns.js', ['client', 'server']);
  api.add_files('shared/css-mixins/textbox.import.styl', 'client');
  api.add_files('shared/css-mixins/textbox.import.styl', 'server', { isAsset:true });
  api.add_files('shared/util.coffee', ['client', 'server']);
  api.add_files('client/textboxes/content-editable/ctrl/content-editable.html', 'client');
  api.add_files('client/textboxes/raw-textbox/raw-textbox.html', 'client');
  api.add_files('client/textboxes/text-input/text-input.html', 'client');
  api.add_files('client/checkbox/checkbox.html', 'client');
  api.add_files('client/checkbox-slider/checkbox-slider.html', 'client');
  api.add_files('client/textboxes/content-editable/lib/js/medium-editor.js', 'client');
  api.add_files('client/textboxes/content-editable/lib/css/medium-editor.css', 'client');
  api.add_files('client/textboxes/content-editable/lib/css/theme-default.css', 'client');
  api.add_files('client/textboxes/content-editable/ctrl/content-editable.coffee', 'client');
  api.add_files('client/textboxes/content-editable/ctrl/content-editable.styl', 'client');
  api.add_files('client/textboxes/raw-textbox/raw-textbox.coffee', 'client');
  api.add_files('client/textboxes/raw-textbox/raw-textbox.styl', 'client');
  api.add_files('client/textboxes/content-editable/content-editable-controller.coffee', 'client');
  api.add_files('client/textboxes/content-editable/css.styl', 'client');
  api.add_files('client/textboxes/validation/email_validator.coffee', 'client');
  api.add_files('client/textboxes/validation/screen_name_validator.coffee', 'client');
  api.add_files('client/textboxes/text-input/text-input.coffee', 'client');
  api.add_files('client/textboxes/text-input/text-input.styl', 'client');
  api.add_files('client/checkbox/checkbox.coffee', 'client');
  api.add_files('client/checkbox/checkbox.styl', 'client');
  api.add_files('client/textboxes/textbox-binder.coffee', 'client');
  api.add_files('client/textboxes/textbox-date.coffee', 'client');
  api.add_files('client/checkbox-slider/checkbox-slider.coffee', 'client');
  api.add_files('client/checkbox-slider/checkbox-slider.styl', 'client');
  api.add_files('client/common.styl', 'client');
  api.add_files('images/text_input_error.svg', ['client', 'server']);
  api.add_files('images/text_input_tick.svg', ['client', 'server']);

});


