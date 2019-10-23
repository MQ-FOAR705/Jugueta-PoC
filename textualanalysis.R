# Packages and libraries required for this work
if(!require(tm)){
  install.packages("tm")
  library(tm)
}
if(!require(wordcloud)){
  install.packages("wordcloud")
  library(wordcloud)
}
# The file path to where the .txt files are stored
folder <- "/Users/janakin/Documents/PoC/data/corpus_output/body"
filelist <- list.files(path=folder, pattern="*.txt")
filelist <- paste(folder, "/", filelist, sep="")
readtext <- lapply(filelist, FUN = readLines)
# Collapses elements into one element
corpus <- lapply(readtext, FUN = paste, collapse=" ")
# Convert corpus to something tm package can use
VCorpus <- Corpus(VectorSource(corpus))
# Using a new corpus name 'VCorpus_clean to keep the original VCorpus object untouched
# Strip whitespace from corpus
VCorpus_clean <- tm_map(VCorpus, stripWhitespace)
# Convert corpus to lower case
VCorpus_clean <- tm_map(VCorpus_clean, content_transformer(tolower))
# Remove German stop words
VCorpus_clean <- tm_map(VCorpus_clean, removeWords, stopwords("german"))
# Remove punctuation
VCorpus_clean <- tm_map(VCorpus_clean, removePunctuation)
# Remove "„" and "—"from corpus
VCorpus_clean <- tm_map(VCorpus_clean, removeWords, c("„","—"))
# Create Term-Document Matrix
dtm <- TermDocumentMatrix(VCorpus_clean)
# To get the list of frequency of words
m <- as.matrix(dtm)
v <- sort(rowSums(m), decreasing=TRUE)
d <- data.frame(word = names(v), freq=v)
# Find the top 20 frequent words
head(d,20, min.freq=2)
# Create output folder
dir.create("most_frequent")
# Output dataframe as a .txt file
write.table(d,"most_frequent/corpus_wordfrequency.txt", sep="\t", row.names=FALSE)
