import re
def count_word(file_path,words):
    dict_count_word={}
    with open (file_path,"r") as file :
        text=file.read()
        for word in words:
            pattern=r"\b{}\b".format(re.escape(word))
            match=re.findall(pattern,text,re.IGNORECASE)
            dict_count_word[word]=len(match)
    return dict_count_word
print(count_word("file.txt",["sara"]))