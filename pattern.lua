print("Welcome to the pattern interpreter. Please attach a focal port if you haven't already.")
print("PASTE the URL your pattern list (formatted like .hexpattern) is located at.")

local event, text = os.pullEvent("paste")


local file = io.open("patterns.json", "r")

io.input(file)

local patterns = textutils.unserialiseJSON(io.read())

io.close(file)

local patternListContents = http.get(text).readAll()

function splitLines(s)
  local lines = {}
  for line in s:gmatch("([^\n]*)\n?") do
    table.insert(lines, line)
  end
  return lines
end



local placeholder = {}

local lines = splitLines(patternListContents)
print(textutils.serialise(lines))

for i, v in lines do
    local pattern = patterns[v]
    if pattern then
        local pattern1 = {}
        pattern1["startDir"] = pattern[1]
        pattern1["angles"] = pattern[2]
        table.insert(placeholder, pattern1)
    end
end

local done =peripheral.find("focal_port").writeIota(placeholder)

if done then
    print("Done. \n Thanks for using this!")
end
if not done then
    print("Write failed. Do you have a focus in your port? (respond 'yes' if yes.)")
    if read() == "yes" or read == "Yes" then
        print("Alright. Try bringing it up with me or putting it in issues.")
    end
end




