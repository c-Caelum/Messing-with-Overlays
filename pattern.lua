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

for i, v in pairs(split) do
    local pattern = patterns[v]
    if pattern then
        print(v)
        print(pattern)
    end
end


