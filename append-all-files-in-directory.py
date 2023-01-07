import os
import pandas as pd

# Prompt the user to enter the directory path
# directory_path = input("Enter the directory path: ")

## or,

# Set the directory path
directory_path = '/path/to/directory'

# Get a list of all the CSV files in the directory
csv_files = [f for f in os.listdir(directory_path) if f.endswith('.csv')]
csv_files = [os.path.join(directory_path, f) for f in csv_files]

# Create an empty list to store the dataframes
df_list = []

# Read the first CSV file into a dataframe and get the list of column names
df = pd.read_csv(csv_files[0], nrows=1)
column_names = list(df.columns)

# Read the first CSV file into a dataframe and get the list of column names

# Iterate through the list of CSV files
for file in csv_files:
    # Read the CSV file into a dataframe
    df = pd.read_csv(file)
    
    # Uploading ...
    print('Uploading ', file, ' ...')

    # Append the dataframe to the list
    df_list.append(df)
    
    # Uploading done...
    print('Uploading ', file, ' done...')

# Concatenate all the dataframes into a single dataframe
df_final = pd.concat(df_list, ignore_index=True)

# Save the final dataframe to a CSV file
df_final.to_csv('final_data.csv', index=False)