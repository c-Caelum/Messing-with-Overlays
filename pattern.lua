print("Welcome to the pattern interpreter. Please attach a focal port if you haven't already.")
print("PASTE the URL your pattern list (formatted like .hexpattern) is located at.")

local event, text = os.pullEvent("paste")

local file = io.open("patterns.json", "r")

io.input(file)

local patterns = textutils.unserialiseJSON(io.read(file))

io.close(file)

shell.run("wget", text, "patternlist.txt")

file = io.open("patternlist.txt")

io.input(file)

local patternListContents = textutils.unserialise(io.read(file, "*all"))

print(patternListContents)
