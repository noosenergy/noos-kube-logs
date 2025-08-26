function restructure_log(tag, timestamp, record)
  -- Create a new record with timestamp and kubernetes at top level
  local new_record = {}
  new_record["timestamp"] = record["timestamp"]

  -- Keep kubernetes metadata at top level for infrastructure separation
  if record["kubernetes"] then
    new_record["kubernetes"] = record["kubernetes"]
  end

  -- Create log object to hold all other application fields
  local log_object = {}

  -- Iterate through all fields in the original record
  for key, value in pairs(record) do
    -- Skip timestamp and kubernetes as they're already at top level
    if key ~= "timestamp" and key ~= "kubernetes" then
      log_object[key] = value
    end
  end

  -- Add the log object to the new record
  new_record["log_object"] = log_object

  return 2, timestamp, new_record
end
