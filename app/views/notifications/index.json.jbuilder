json.array! @notifications do |notification|
  json.id notification.id
  # json.follower notification.follower
  json.author notification.author.name
  json.action notification.action
  # notification.notifiable
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.downcase}"
  end
  json.url post_path(notification.notifiable, anchor: dom_id(notification.notifiable))
end
