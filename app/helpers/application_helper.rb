module ApplicationHelper
  include Pagy::Frontend


  def main_title
    if controller.controller_name == 'suppliers'
        'Account Supplier'
    elsif controller.controller_name == 'products'
        'Products'
    elsif controller.controller_name == 'packages'
        'Packages'
    elsif controller.controller_name == 'amenities'
        'Amenities'
    else
      ''
    end
  end

  def current_class?(current_path)
    return 'active' if request.path == current_path
    ''
  end
end
