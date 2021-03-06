# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def convert_to_yes_no(flag)
    return 'Yes' if flag
    'No'
  end

  def display_utc_time_in_pacific(utc_time)
    return nil if utc_time.nil?
    utc_time.in_time_zone('Pacific Time (US & Canada)').to_formatted_s(:long)
  end
  
  def display_utc_time_in_pacific_iso_no_zone(utc_time)
    return nil if utc_time.nil?
    utc_time.in_time_zone('Pacific Time (US & Canada)').strftime('%F %T')
  end
  
  def display_now_in_pacific
    Time.now.in_time_zone('Pacific Time (US & Canada)').to_formatted_s(:long)
  end

  def display_price(price)
    if price < 0
      '-&nbsp;' + number_to_currency(- price)
    else
      number_to_currency price
    end
  end
end
