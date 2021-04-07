ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :firstname, :lastname, :encrypted_password

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      f.input :email
      f.input :firstname
      f.input :lastname
      f.input :password
      f.input :password_confirmation
      f.actions
    end
  end

  show do
    attributes_table do
      row :email
      row :firstname
      row :lastname
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :firstname, :lastname, :slug]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
