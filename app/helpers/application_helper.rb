module ApplicationHelper
  include Pagy::Frontend

  def main_title
    if controller.controller_name == "suppliers"
      "Account Supplier"
    elsif controller.controller_name == "products"
      "Products"
    elsif controller.controller_name == "packages"
      "Packages"
    elsif controller.controller_name == "amenities"
      "Amenities"
    else
      ""
    end
  end

  def current_class?(current_path)
    return "active" if request.path == current_path
    ""
  end

  def package_status(status)
    if status == "unpublished"
      "bg-secondary"
    elsif status == "published"
      "bg-primary"
    elsif status == "active"
      "bg-success"
    elsif status == "canceled"
      "bg-danger"
    elsif status == "completed"
      "bg-info"
    else
      "bg-warning"
    end
  end
end
