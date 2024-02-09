#!/usr/bin/env python
# coding: utf-8

# # Reading CSV Data using Pandas:
# 

# In[11]:


import pandas as pd
from io import StringIO

csv_data = """ID,Name,Age
1,John,25
2,Jane,30
3,Bob,22
"""


df = pd.read_csv(StringIO(csv_data))


print(df)


# In[12]:


df.head()


# In[13]:


df.tail()


# # Read Data from CSV Files to Pandas Dataframes

# In[15]:


import pandas as pd

file_path = 'Desktop/sample.csv'

df = pd.read_csv(file_path)

df


# In[16]:


df.head()


# In[17]:


df.tail()


# # 	Filter Data in Pandas Dataframe using query.

# In[19]:


import pandas as pd

file_path = 'Desktop/sample.csv'

df = pd.read_csv(file_path)

filtered_df = df.query("Age > 25 and Position == 'SG'")

print("\nFiltered DataFrame:")

filtered_df


# In[21]:


import pandas as pd

file_path = 'Desktop/sample.csv'

df = pd.read_csv(file_path)

filtered_df = df.query("Team == 'Boston Celtics' and College == 'Texas'")

print("\nFiltered DataFrame:")

filtered_df


# In[ ]:




