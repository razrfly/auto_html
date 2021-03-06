# encoding: UTF-8

# set these options and default values
# :width => '100%', :height => 166, :auto_play => false, :theme_color => '00FF00', :color => '915f33', :show_comments => false
AutoHtml.add_filter(:soundcloud).with(:width => '100%', :height => 166, :auto_play => false, :show_user => true, :show_comments => false, :visual => true, :hide_related => true) do |text, options|
  require 'uri'
  require 'net/http'
  text.gsub(/(https?:\/\/)?(www.)?soundcloud\.com\/\S*/) do |match|
    new_uri = match.to_s
    new_uri = (new_uri =~ /^https?\:\/\/.*/) ? URI(new_uri) : URI("http://#{new_uri}")
    new_uri.normalize!
    width = options[:width]
    height = options[:height]
    auto_play = options[:auto_play]
    show_user = options[:show_user]
    hide_related = options[:hide_related]
    visual = options[:visual]
    show_comments = options[:show_comments]
    %{<iframe width="#{width}" height="#{height}" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=#{new_uri}&auto_play=#{auto_play}&hide_related=#{hide_related}&show_comments=#{show_comments}&show_user=#{show_user}&visual=#{visual}"></iframe>}
  end
end