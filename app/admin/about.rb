ActiveAdmin.register About do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :page_title, :content, :image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form html: { enctype: 'multipart/form-data' } do |f|
    f.inputs 'About Us' do
      f.input :page_title
      f.input :content
      f.input :image, as: :file
    end
    f.button :submit
  end

end
