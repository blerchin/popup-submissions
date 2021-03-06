module ApplicationHelper
	def text_field(*args)
		args[2][:class] = "form-control"
		super *args

	end
	def submit_tag(*args)
		args[1] ||= {}
		args[1][:class] = "btn btn-primary"
		super *args
	end
	def button_to(*args)
		args[2] = args[2] || {}
		args[2][:class] = "btn" 
		link_to *args
	end
	def admin_only
		if is_admin?
			yield
		end
	end

end

class ActionView::Helpers::FormBuilder
	include ActionView::Helpers::TagHelper
	def control_label(*args)
		args[1] ||= {}
		args[1][:class] = "control-label"
		label *args
	end
	def control_text_field(*args)
		content_tag(:div, text_field(*args), class: "controls")
	end
end
