# frozen_string_literal: true

# name: basic-plugin
# about: Demonstrate how plugins work
# version: 0.1
# authors: RickyC0626
# url: https://github.com/RickyC0626

register_asset 'stylesheets/common/basic-plugin.scss'
register_asset 'stylesheets/desktop/basic-plugin.scss', :desktop
register_asset 'stylesheets/mobile/basic-plugin.scss', :mobile

enabled_site_setting :basic_plugin_enabled

PLUGIN_NAME ||= 'BasicPlugin'

load File.expand_path('lib/basic-plugin/engine.rb', __dir__)

after_initialize do
  # https://github.com/discourse/discourse/blob/master/lib/plugin/instance.rb
  add_admin_route 'purple_tentacle.title', 'purple-tentacle'

  Discourse::Application.routes.append do
    get '/admin/plugins/purple-tentacle' => 'admin/plugins#index', constraints: StaffConstraint.new
  end
end
