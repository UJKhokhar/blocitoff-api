every :hour do
  rake "todo:delete_items"
end

every :reboot do
  rake "todo:delete_items"
end