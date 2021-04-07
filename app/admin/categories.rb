ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :published_at

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      f.input :title
      f.actions
    end
  end

  show do
    attributes_table do
      row :title
      row :published_at
    end
  end

  action_item :publish, only: :show do
    link_to "Publish", publish_admin_category_path(category), method: :put if !category.published_at?
  end

  action_item :publish, only: :show do
    link_to "Unpublish", unpublish_admin_category_path(category), method: :put if category.published_at?
  end

  member_action :publish, method: :put do
    category = Category.find(params[:id])
    category.update(published_at: Time.zone.now)
    redirect_to admin_category_path(category)
  end

  member_action :unpublish, method: :put do
    category = Category.find(params[:id])
    category.update(published_at: nil)
    redirect_to admin_category_path(category)
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
