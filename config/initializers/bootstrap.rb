SimpleForm.setup do |config|
  config.hint_class = 'help-block'
  config.error_class = 'help-inline'
  config.wrapper_class = 'clearfix'
  config.wrapper_error_class = 'error'
  config.label_text = lambda { |label, required| "#{label} #{required}" }
  config.form_class = nil
end
