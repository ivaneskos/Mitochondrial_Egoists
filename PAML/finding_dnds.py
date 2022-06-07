#!/usr/bin/env python
# coding: utf-8

# In[14]:


import os, sys, re
import numpy as np
from collections import defaultdict

def extract_w(filename):
    w = None
    with open(filename, "r") as fl:
            for line in fl:
                if "omega (dN/dS) =" in line:
                    w = line.split()[-1]
    return w

tree_file="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/trees_list.txt"
trees_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees"

with open(tree_file, "r") as tree_list:
  for tree in tree_list:
    tree_line = tree.strip()
    print(tree_line)
    paml_results_file=str(trees_directory + "/PAML_results/" + tree_line + "/PAML_tree_dnds_table.csv")
    with open(paml_results_file, "w") as file:
        file.write(tree_line + "_omega\n")        
    with open(str(trees_directory + "/" + tree_line + "/clades_list.txt"), "r") as clade_list:
        for clade in clade_list:
            clade_line = clade.strip()
            print(clade_line)
            paml_file=str(trees_directory + "/" + tree_line + "/" + clade_line+"/for_PAML_tree/" + tree_line + "_" + clade_line + ".txt")
            print (paml_file)
            print(extract_w(paml_file))
            with open(paml_results_file, "a") as file_object:
                file_object.write(extract_w(paml_file)+"\n")

