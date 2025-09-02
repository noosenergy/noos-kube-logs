function format_slack_msg(tag, ts, record)
    local function s(x, d) return x ~= nil and tostring(x) or (d or "") end
    local lo = (type(record) == "table" and type(record.log_object) == "table") and record.log_object or {}

    -- Build strings for the markdown title
    local tag_s = s(tag or "unknown")
    local event_s = s(lo.event, "unknown"):gsub("`", "ʼ")
    local time_s  = s(record.timestamp or ts or "unknown"):gsub("`", "ʼ")

    -- Build params as mrkdwn: "*key*: value" per line; angle-bracket URLs to ensure link
    local lines = {}
    if type(lo.params) == "table" then
      for k, v in pairs(lo.params) do
        local val = s(v)
        if type(v) == "string" and v:match("^https?://") then
          val = "<" .. val .. ">"
        end
        lines[#lines+1] = string.format(">*%s*: %s", s(k), val)
      end
    end
    local params_md = (#lines > 0) and table.concat(lines, "\n") or ""

    local markdown = string.format("*%s* `%s` @ `%s`%s%s",
                               tag_s, event_s, time_s,
                               params_md ~= "" and "\n" or "",
                               params_md)

    -- Return ONLY what Slack needs
    return 2, ts, { text = markdown }
  end
