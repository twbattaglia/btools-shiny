# @ Thomas W. Battaglia
# Helper functions for Btools-shiny

# Load libraries
library(phyloseq)
library(ggplot2)
library(microbiome)
library(plotly)
library(bubbles)
library(DT)
library(lazyeval)
library(randomcoloR)
library(highcharter)
library(dplyr)

# Function for create phyloseq object from
# an OTU/Map/Tree files
create_phylo <- function(biom_fp, map_fp, tree_fp){
  
  # Import BIOM + tree
  data = phyloseq::import_biom(BIOMfilename = biom_fp, 
                               treefilename = tree_fp, 
                               parseFunction = parse_taxonomy_greengenes)
  
  # Import mapping file
  mapping =  phyloseq::import_qiime_sample_data(mapfilename = map_fp)
  
  # Create phyloseq object
  phylo <- phyloseq::merge_phyloseq(data, mapping)
  
  # Change rank names
  colnames(tax_table(phylo)) <- c("Kingdom", "Phylum", "Class", "Order", "Family",  "Genus", "Species")
  
  # return object for phyloseq
  return(phylo)
}