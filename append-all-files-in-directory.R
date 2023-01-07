# Set the directory path
directory_path <- '/path/to/directory'

# Get a list of all the CSV files in the directory
csv_files <- list.files(path = directory_path, pattern = "*.csv", full.names = TRUE)

# Create an empty list to store the dataframes
df_list <- list()

# Read the first CSV file into a dataframe and get the list of column names
df <- read.csv(csv_files[1])
column_names <- names(df)

# Iterate through the list of CSV files
for (file in csv_files) {
  # Read the CSV file into a dataframe
  df <- read.csv(file)
  
  # Append the dataframe to the list
  df_list[[length(df_list) + 1]] <- df
}

# Concatenate all the dataframes into a single dataframe
df_final <- do.call(rbind, df_list)

# Save the final dataframe to a CSV file
write.csv(df_final, file = 'final_data.csv', row.names = FALSE)