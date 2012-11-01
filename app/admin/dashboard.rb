ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    panel "Graphic" do
      para do
        link_to('Insert HighCharts graphic about users here. More info..', "http://www.highcharts.com/", :target => '_blank')
      end
    end

    panel "Send Bulk Invitations:" do
      ul do
        li link_to("10 &#183;".html_safe, bulk_invite_path(:quantity => '10'))
        li link_to("50 &#183;".html_safe, bulk_invite_path(:quantity => '50'))
        li link_to("100 &#183;".html_safe, bulk_invite_path(:quantity => '100'))
        li link_to("500 &#183;".html_safe, bulk_invite_path(:quantity => '500'))
        li link_to("1000", bulk_invite_path(:quantity => '1000'))
      end
    end

    #div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #  span :class => "blank_slate" do
    #    span "Welcome to Active Admin. This is the default dashboard page."
    #    small "To add dashboard sections, checkout 'app/admin/dashboards.rb'"
    #  end
    #end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
