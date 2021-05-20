module ApplicationHelper
  def flash_class(level)
    bootstrap_alert_class = {
      'success': 'alert-success',
      'error': 'alert-danger',
      'notice': 'alert-info',
      'alert': 'alert-danger',
      'warn': 'alert-warning'
    }
    bootstrap_alert_class[level]
  end

  def toastr_flash
    flash.collect do |type, message|
      next unless message

      type = case type
             when 'notice'
               'info'
             when 'alert'
               'warning'
             else
               type
             end
      config = '{postionClass:\'toast-top-right\',closeButton:true,'\
               'progressBar:true,newestOnTop: true}'
      "toastr.#{type}('#{message}',null,#{config});".html_safe
    end
  end
end
