#!/usr/bin/env python
# coding: utf-8

# # Reading CSV Data using Pandas:

# In[13]:


import pandas as pd

df = pd.read_csv('Desktop/SalesRecords.csv')

print(df)


# # Read Data from CSV Files to Pandas Dataframes

# In[ ]:


df=pd.read_csv('Desktop/SalesRecords.csv')


# In[23]:


df


# # total columns

# In[24]:


df.columns


# # distinct values

# In[25]:


df['Sales Channel'].unique()


# # Filter Data in Pandas DataFrame using Query:

# In[29]:


df.query('`Sales Channel` == "Online"')


# # Get Count by Status using Pandas DataFrame APIs:

# In[30]:


status_count = df['Order Priority'].value_counts()

print(status_count)


# In[31]:


df. \
   groupby('Order Priority'). \
   agg('count')


# In[32]:


df. \
   groupby('Order Priority')['Order ID']. \
   agg(ordercount='count')


# # Get Count by Month and Status using Pandas DataFrame APIs:

# In[33]:


df['Order Date'] = pd.to_datetime(df['Order Date'])

df['Month'] = df['Order Date'].dt.month


count_by_month_status = df.groupby(['Month', 'Order Priority']).size()

print(count_by_month_status)


# # Creating Dataframes using dynamic column list on CSV Data:

# In[36]:


selected_columns = ['Country', 'Item Type', 'Sales Channel', 'Total Revenue']
                    
new_df = df[selected_columns]

print(new_df)


# # Performing Inner Join between Pandas Dataframes:

# In[38]:


merged_df = pd.merge(df, new_df, how='inner', on='Country')

merged_df


# # Perform Aggregations on Join results:

# In[41]:


aggregated_df = merged_df.groupby('Country').agg({'Total Revenue_x': 'sum', 'Total Profit': 'mean'})

aggregated_df


# # Sort Data in Pandas Dataframes:

# In[42]:


sorted_df = df.sort_values(by='Total Profit', ascending=False)

sorted_df


# # Writing Pandas Dataframes to Files:

# In[45]:


df.to_csv('samplecsv.csv', index=False)



# # Write Pandas Dataframes to JSON Files:

# In[46]:


df.to_json('output_file.json', orient='records')


# In[ ]:




