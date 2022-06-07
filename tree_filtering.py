#!/usr/bin/env python
# coding: utf-8

# In[143]:


import ete3
import os
import re
from ete3 import Tree
t = Tree("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/nwk_trees/LAGLIDADG_1.nwk", format=2)

for node in t.traverse("preorder"):
    if node.name == '':
        node.name = 'Internal node'
    else:
        node.name = str(re.sub('^[0-9]*_', '', node.name))

clade_COUNTER=1
path_to_clade_file="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/LAGLIDADG_1/clade" #for LAGLI_1 tree
for node in t.traverse("preorder"):
    print (node.name)
    flag = ""
    if (node in t) and (node.name == 'Internal node') and (node.support >= 70):
        for child in node.traverse("preorder"):
            if (child.support >= 70) or (child.support == 1):
                continue
            elif (child.support < 70) or (child.support != 1):
                flag="beda"
                break
        if flag != "beda":
            print (node)
            leaf_list = node.get_leaf_names()
            clade_path = path_to_clade_file + "_" + str(clade_COUNTER)
            isExist = os.path.exists(clade_path)
            if not isExist:
                os.makedirs(clade_path)
                print("The new directory is created!")
            with open(str(clade_path + "/leafs_list.txt"), mode='wt', encoding='utf-8') as myfile:
                myfile.write('\n'.join(leaf_list))
            node.write(format=5, outfile=str(clade_path + "/node_tree.nwk"))
            clade_COUNTER+=1
            node.detach()
            continue
    else:
        continue


# In[144]:


import ete3
import os
import re
from ete3 import Tree
t = Tree("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/nwk_trees/LAGLIDADG_2.nwk", format=2)

for node in t.traverse("preorder"):
    if node.name == '':
        node.name = 'Internal node'
    else:
        node.name = str(re.sub('^[0-9]*_', '', node.name))

clade_COUNTER=1
path_to_clade_file="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/LAGLIDADG_2/clade" #for LAGLI_1 tree
for node in t.traverse("preorder"):
    print (node.name)
    flag = ""
    if (node in t) and (node.name == 'Internal node') and (node.support >= 70):
        for child in node.traverse("preorder"):
            if (child.support >= 70) or (child.support == 1):
                continue
            elif (child.support < 70) or (child.support != 1):
                flag="beda"
                break
        if flag != "beda":
            print (node)
            leaf_list = node.get_leaf_names()
            clade_path = path_to_clade_file + "_" + str(clade_COUNTER)
            isExist = os.path.exists(clade_path)
            if not isExist:
                os.makedirs(clade_path)
                print("The new directory is created!")
            with open(str(clade_path + "/leafs_list.txt"), mode='wt', encoding='utf-8') as myfile:
                myfile.write('\n'.join(leaf_list))
            node.write(format=5, outfile=str(clade_path + "/node_tree.nwk"))
            clade_COUNTER+=1
            node.detach()
            continue
    else:
        continue


# In[148]:


import ete3
import os
import re
from ete3 import Tree
t = Tree("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/nwk_trees/Intron_maturas2.nwk", format=2)

for node in t.traverse("preorder"):
    if node.name == '':
        node.name = 'Internal node'
    else:
        node.name = str(re.sub('^[0-9]*_', '', node.name))

clade_COUNTER=1
path_to_clade_file="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/Intron_maturas2/clade" #for LAGLI_1 tree
for node in t.traverse("preorder"):
    print (node.name)
    flag = ""
    if (node in t) and (node.name == 'Internal node') and (node.support >= 70):
        for child in node.traverse("preorder"):
            if (child.support >= 70) or (child.support == 1):
                continue
            elif (child.support < 70) or (child.support != 1):
                flag="beda"
                break
        if flag != "beda":
            print (node)
            leaf_list = node.get_leaf_names()
            clade_path = path_to_clade_file + "_" + str(clade_COUNTER)
            isExist = os.path.exists(clade_path)
            if not isExist:
                os.makedirs(clade_path)
                print("The new directory is created!")
            with open(str(clade_path + "/leafs_list.txt"), mode='wt', encoding='utf-8') as myfile:
                myfile.write('\n'.join(leaf_list))
            node.write(format=5, outfile=str(clade_path + "/node_tree.nwk"))
            clade_COUNTER+=1
            node.detach()
            continue
    else:
        continue


# In[149]:


import ete3
import os
import re
from ete3 import Tree
t = Tree("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/nwk_trees/COX1.nwk", format=2)

for node in t.traverse("preorder"):
    if node.name == '':
        node.name = 'Internal node'
    else:
        node.name = str(re.sub('^[0-9]*_', '', node.name))

clade_COUNTER=1
path_to_clade_file="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/COX1/clade" #for LAGLI_1 tree
for node in t.traverse("preorder"):
    print (node.name)
    flag = ""
    if (node in t) and (node.name == 'Internal node') and (node.support >= 70):
        for child in node.traverse("preorder"):
            if (child.support >= 70) or (child.support == 1):
                continue
            elif (child.support < 70) or (child.support != 1):
                flag="beda"
                break
        if flag != "beda":
            print (node)
            leaf_list = node.get_leaf_names()
            clade_path = path_to_clade_file + "_" + str(clade_COUNTER)
            isExist = os.path.exists(clade_path)
            if not isExist:
                os.makedirs(clade_path)
                print("The new directory is created!")
            with open(str(clade_path + "/leafs_list.txt"), mode='wt', encoding='utf-8') as myfile:
                myfile.write('\n'.join(leaf_list))
            node.write(format=5, outfile=str(clade_path + "/node_tree.nwk"))
            clade_COUNTER+=1
            node.detach()
            continue
    else:
        continue


# In[150]:


import ete3
import os
import re
from ete3 import Tree
t = Tree("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/nwk_trees/COX2.nwk", format=2)

for node in t.traverse("preorder"):
    if node.name == '':
        node.name = 'Internal node'
    else:
        node.name = str(re.sub('^[0-9]*_', '', node.name))

clade_COUNTER=1
path_to_clade_file="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/COX2/clade" #for LAGLI_1 tree
for node in t.traverse("preorder"):
    print (node.name)
    flag = ""
    if (node in t) and (node.name == 'Internal node') and (node.support >= 70):
        for child in node.traverse("preorder"):
            if (child.support >= 70) or (child.support == 1):
                continue
            elif (child.support < 70) or (child.support != 1):
                flag="beda"
                break
        if flag != "beda":
            print (node)
            leaf_list = node.get_leaf_names()
            clade_path = path_to_clade_file + "_" + str(clade_COUNTER)
            isExist = os.path.exists(clade_path)
            if not isExist:
                os.makedirs(clade_path)
                print("The new directory is created!")
            with open(str(clade_path + "/leafs_list.txt"), mode='wt', encoding='utf-8') as myfile:
                myfile.write('\n'.join(leaf_list))
            node.write(format=5, outfile=str(clade_path + "/node_tree.nwk"))
            clade_COUNTER+=1
            node.detach()
            continue
    else:
        continue


# In[151]:


import ete3
import os
import re
from ete3 import Tree
t = Tree("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/nwk_trees/COX2_TM.nwk", format=2)

for node in t.traverse("preorder"):
    if node.name == '':
        node.name = 'Internal node'
    else:
        node.name = str(re.sub('^[0-9]*_', '', node.name))

clade_COUNTER=1
path_to_clade_file="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/COX2_TM/clade" #for LAGLI_1 tree
for node in t.traverse("preorder"):
    print (node.name)
    flag = ""
    if (node in t) and (node.name == 'Internal node') and (node.support >= 70):
        for child in node.traverse("preorder"):
            if (child.support >= 70) or (child.support == 1):
                continue
            elif (child.support < 70) or (child.support != 1):
                flag="beda"
                break
        if flag != "beda":
            print (node)
            leaf_list = node.get_leaf_names()
            clade_path = path_to_clade_file + "_" + str(clade_COUNTER)
            isExist = os.path.exists(clade_path)
            if not isExist:
                os.makedirs(clade_path)
                print("The new directory is created!")
            with open(str(clade_path + "/leafs_list.txt"), mode='wt', encoding='utf-8') as myfile:
                myfile.write('\n'.join(leaf_list))
            node.write(format=5, outfile=str(clade_path + "/node_tree.nwk"))
            clade_COUNTER+=1
            node.detach()
            continue
    else:
        continue


# In[152]:


import ete3
import os
import re
from ete3 import Tree
t = Tree("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/nwk_trees/COX3.nwk", format=2)

for node in t.traverse("preorder"):
    if node.name == '':
        node.name = 'Internal node'
    else:
        node.name = str(re.sub('^[0-9]*_', '', node.name))

clade_COUNTER=1
path_to_clade_file="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/COX3/clade" #for LAGLI_1 tree
for node in t.traverse("preorder"):
    print (node.name)
    flag = ""
    if (node in t) and (node.name == 'Internal node') and (node.support >= 70):
        for child in node.traverse("preorder"):
            if (child.support >= 70) or (child.support == 1):
                continue
            elif (child.support < 70) or (child.support != 1):
                flag="beda"
                break
        if flag != "beda":
            print (node)
            leaf_list = node.get_leaf_names()
            clade_path = path_to_clade_file + "_" + str(clade_COUNTER)
            isExist = os.path.exists(clade_path)
            if not isExist:
                os.makedirs(clade_path)
                print("The new directory is created!")
            with open(str(clade_path + "/leafs_list.txt"), mode='wt', encoding='utf-8') as myfile:
                myfile.write('\n'.join(leaf_list))
            node.write(format=5, outfile=str(clade_path + "/node_tree.nwk"))
            clade_COUNTER+=1
            node.detach()
            continue
    else:
        continue


# In[14]:


print (t)


# In[43]:


# we load a tree
t = Tree('((((H,K)D,(F,I)G)B,E)A,((L,(N,Q)O)J,(P,S)M)C);', format=1)
print (t)

for node in t.traverse("postorder"):
  # Do some analysis on node
    print (node.name)
    print (node.children)

# If we want to iterate over a tree excluding the root node, we can
# use the iter_descendant method
for node in t.iter_descendants("postorder"):
  # Do some analysis on node
  print (node.name)

print (A.children)

