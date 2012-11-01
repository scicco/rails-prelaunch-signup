ActiveAdmin.register User do
  actions :index

  filter :email
  filter :created_at
  filter :confirmed_at
  filter :sign_in_count

  batch_action :invite, :confirm => "Activate all selected Users?" do |selection|
     User.find(selection).each { |user| user.send_confirmation_instructions }
     redirect_to collection_path, :notice => "#{selection.count} #{I18n.t(:user, :count => selection.count).capitalize} invited!"
  end

  index do
    selectable_column
    column :email, :sortable => true
    column :created_at, :sortable => true
    column :confirmed_at, :sortable => true do |user|
      unless user.confirmed_at
        user.confirmation_token.nil? ? (link_to"send invitation", invite_user_path(user)) : (link_to "resend", invite_user_path(user))
      else
        user.confirmed_at.strftime("%B %d, %Y %R")
      end
    end
    column :sign_in_count, :sortable => true
    column :last_sign_in_at, :sortable => true
  end
end
