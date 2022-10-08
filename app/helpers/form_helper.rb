module FormHelper
  def errors_for(form, field)
    content_tag(:div, form.object.errors[field].try(:first), class: 'invalid-feedback')
  end

  def form_group_for(form, field, opts={}, &block)
      label = opts.fetch(:label) { true }
      has_errors = form.object.errors[field].present?
      capture_block = capture(&block)

      if has_errors
        capture_block = capture_block.gsub("class=\"form-control\"", "class=\"form-control is-invalid\"")
      end

      # content_tag :span do
      #     concat capture_block
      #     concat errors_for(form, field)
      # end
      capture_block
  end
end
