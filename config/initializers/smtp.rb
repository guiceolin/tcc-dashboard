ActionMailer::Base.smtp_settings = YAML.load_file("#{Rails.root}/config/smtp.yml")[Rails.env].symbolize_keys!
