ActiveAdmin.register Attraction do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :category_id, :image, :published_at

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      f.input :title
      f.input :description
      f.input :category_id
      f.input :image, as: :file
      f.actions
    end
  end



  show do
    attributes_table do
      row :title
      row :description
      row :published_at
      row :category_id
      row :image do |ad|
        image_tag url_for(ad.image)
      end

    end
  end

  action_item :publish, only: :show do
    link_to "Publish", publish_admin_attraction_path(attraction), method: :put if !attraction.published_at?
  end

  member_action :publish, method: :put do
    attraction = Attraction.find(params[:id])
    attraction.update(published_at: Time.zone.now)
    redirect_to admin_attraction_path(attraction)
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
