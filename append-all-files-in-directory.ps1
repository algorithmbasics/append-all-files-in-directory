# Set the directory path
$directory_path = 'C:\path\to\directory'

# Get a list of all the CSV files in the directory
$csv_files = Get-ChildItem -Path $directory_path -Filter *.csv | Select-Object -ExpandProperty FullName

# Create an empty array to store the data
$data = @()

# Read the first CSV file into an array
$data += Import-Csv -Path $csv_files[0]

# Iterate through the list of CSV files
for ($i = 1; $i -lt $csv_files.Length; $i++) {
    # Read the CSV file into an array
    $temp = Import-Csv -Path $csv_files[$i]
    
    # Append the array to the data
    $data += $temp
}

# Save the data to a CSV file
$data | Export-Csv -Path 'final_data_ps1.csv' -NoTypeInformation