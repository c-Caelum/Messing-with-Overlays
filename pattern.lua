print("Welcome to the pattern interpreter. Please attach a focal port if you haven't already.")
print("PASTE the URL your pattern list (formatted like .hexpattern) is located at.")

local event, text = os.pullEvent("paste")

local file = io.open("patterns.json", "r")

io.input(file)

local patterns = textutils.unserialiseJSON(io.read())

io.close(file)

local patternListContents = http.get(text).readAll()

print(patternListContents)
