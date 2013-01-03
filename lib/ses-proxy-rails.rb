require 'action_mailer'
require 'action_mailer/version'

module SesProxyRails
  class Config
    cattr_accessor :replacement_address
    cattr_accessor :application_name
    cattr_accessor :replace_recipient

    def self.get_application_name
      if application_name
        return application_name.to_s
      else
        if ActionMailer::VERSION::MAJOR < 3
          #This is the unique way to get the Application Name in Rails 2
          return File.basename(Rails.root.to_s)
        else
          return Rails.application.class.parent.to_s
        end
      end
    end

    def self.get_replacement_address
      if replacement_address
        return replacement_address.to_s
      elsif developer_email_address
        return developer_email_address
      else
        nil
      end
    end

    private

    def self.developer_email_address
      unless defined?(@@developer_email_address)
        @@developer_email_address = begin
          `git config user.email`.chomp
        rescue
          nil
        end
      end
      @@developer_email_address
    end
  end
end

if ActionMailer::VERSION::MAJOR < 3
  class ActionMailer::Base
    def create_mail_with_ses_proxy_header
      mail = create_mail_without_ses_proxy_header
      mail['X-Sender-System'] = SesProxyRails::Config.get_application_name
      if SesProxyRails::Config.replace_recipient and Rails.env.development?
        mail.to = SesProxyRails::Config.get_replacement_address
      end
      mail
    end
    alias_method_chain :create_mail, :ses_proxy_header
  end
else
  class SesProxyHeader
    def self.delivering_email(mail)
      mail['X-Sender-System'] = SesProxyRails::Config.get_application_name
      if SesProxyRails::Config.replace_recipient and Rails.env.development?
        mail.to = SesProxyRails::Config.get_replacement_address
      end
    end
  end
  ActionMailer::Base.register_interceptor(SesProxyHeader)
end