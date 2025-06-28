local url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent"
local apiKey = "your_api_key_here" -- Replace with your actual API key

-- JSON Payload
local payload = [[
{
  "contents": [
    {
      "parts": [
        {
          "text": "Explain how AI works in a few words"
        }
      ]
    }
  ],
  "generationConfig": {
    "thinkingConfig": {
      "thinkingBudget": 0
    }
  }
}
]]

-- Headers
local headers = {
  ["x-goog-api-key"] = apiKey,
  ["Content-Type"] = "application/json"
}

-- Make the POST request
local response, err = http.post(url, payload, headers)

-- Check the response
if response then
  local body = response.readAll()
  response.close()
  print("Response: " .. body)
else
  print("Error: " .. err)
end
