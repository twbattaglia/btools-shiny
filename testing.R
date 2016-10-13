# Testing Env

source("helpers.R")

# Create new phylosqe object
phylo <- create_phylo(biom_fp = "test/test_qiime.biom", 
                      tree_fp = "test/rep_set.tre", 
                      map_fp = "test/test_map.txt")

# Example data
data(esophagus)
data(enterotype)
data(soilrep)
data(dietswap)
data(peerj32)
data(atlas1006)
data("GlobalPatterns")
rank_names(GlobalPatterns)
taxa_sums(GlobalPatterns)
sample_sums(GlobalPatterns)
phylo = enterotype

filter_prevalent(GlobalPatterns, detection.threshold = 500, 0.20)


# Valuesboxes
nsamples(phylo)
ntaxa(phylo)
sum(sample_sums(phylo))
mean(sample_sums(phylo))
median(sample_sums(phylo))
min(sample_sums(phylo))
max(sample_sums(phylo))
sd(sample_sums(phylo))


# Sample depth histogram
data <- sample_sums(phylo)
hchist(data, breaks = 50) %>%
  hc_title(text = "Sample Depths") %>%
  hc_legend(enabled = FALSE)

# Old sample depthds plot
hist(x = sample_sums(phylo), 
     breaks = 30, 
     main = "", 
     xlab = "Sampling Depth")


# Rank abundance barplot
sort(taxa_sums(phylo), TRUE)[1:30] %>%
  data.frame(Values = unlist(.), ID = names(.)) %>%
  hchart(., "column", x = ID, y = Values)
  

