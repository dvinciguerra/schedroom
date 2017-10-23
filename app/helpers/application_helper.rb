module ApplicationHelper

	# show page title component
	def page_title(title)
		render partial: 'partial/page_title', locals: { page_title: title }
	end

	# show navbar date component
	def show_header_date
		I18n.localize(Date.today, format: :long)
	end

end
