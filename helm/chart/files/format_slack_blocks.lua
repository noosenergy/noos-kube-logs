function format_slack_blocks(tag, timestamp, record)
  -- JSON template with placeholders
  local template = [[{
	"blocks": [
		{
			"type": "rich_text",
			"elements": [
				{
					"type": "rich_text_section",
					"elements": [
						{
							"type": "text",
							"text": "${tag}: ",
							"style": {
								"bold": true
							}
						},
						{
							"type": "text",
							"text": "${event}",
							"style": {
								"code": true
							}
						},
						{
							"type": "text",
							"text": " @ ${time}"
						}
					]
				}
			]
		},
		{
			"type": "divider"
		},
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": "${params}"
			}
		}
	]
}]]

  -- Format params as markdown text
  local params_text = ""
  if record.params then
    for key, value in pairs(record.params) do
      params_text = params_text .. "*" .. key .. ":* " .. tostring(value) .. "\n"
    end
  end

  -- Substitute placeholders
  local json_string = template:gsub("${tag}", record.tag or tag)
                             :gsub("${event}", record.event or "unknown")
                             :gsub("${time}", record.timestamp or "unknown")
                             :gsub("${params}", params_text)

  -- Parse JSON (basic manual parsing since cjson might not be available)
  -- For now, return the JSON string - FluentBit may handle the parsing
  return 2, timestamp, {text = json_string}
end