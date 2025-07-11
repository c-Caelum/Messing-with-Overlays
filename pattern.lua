print("Welcome to the pattern interpreter. Please attach a focal port if you haven't already.")
print("PASTE the URL your pattern list (formatted like .hexpattern) is located at.")

local event, text = os.pullEvent("paste")

function stringSplit(inputstr, sep)
    inputstr = sep .. inputstr:gsub(sep, string.char(2) .. sep)
    local t = {}
    for str in string.gmatch(inputstr, "([^"..string.char(2).."]+)") do
      table.insert(t, string.sub(str,2))
    end
    return t
end


local file = io.open("patterns.json", "r")

io.input(file)

local patterns = textutils.unserialiseJSON(io.read())

io.close(file)

local patternListContents = http.get(text).readAll()

local split = stringSplit(patternListContents, "\n")

local placeholder = {}

for i, v in pairs(split) do
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




