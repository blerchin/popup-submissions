module ApplicationHelper
	def text_field(*args)
		args[2][:class] = "form-control"
		super *args

	end
	def submit_tag(*args)
		args[1][:class] = "btn btn-primary"
		super *args

	end
end