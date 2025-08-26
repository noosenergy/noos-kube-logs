function add_tag_field(tag, timestamp, record)
  record["tag"] = tag
  return 2, timestamp, record
end
