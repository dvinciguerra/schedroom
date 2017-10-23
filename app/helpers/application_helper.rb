module ApplicationHelper
  # show page title component
  def page_title(title)
    render partial: 'partial/page_title', locals: { page_title: title }
  end

  # show navbar date component
  def show_header_date
    I18n.localize(Date.today, format: :long)
  end

  def days_of_week(week)
    Schedroom::Date.days_of_week(week)
  end

  def number_to_hours(value = 0)
    format '%s:00', value.to_s.rjust(2, '0')
  end

	def datetime_at_presenter(day, hour)
		day.strftime('%Y-%m-%dT') << number_to_hours(hour) << ":00.000Z"
	end
end
