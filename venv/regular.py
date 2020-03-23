import re #importing regular expression library
txt= "The rain in Spain"
#x = re.search("^The.*Spain$", txt)
x = re.split("\s",txt)
print(x)
