
import pandas as pd

# Load the CSV file
df = pd.read_csv("sales_data.csv")

# Display the first five rows
print("First five rows:")
print(df.head())

# Display the number of rows and columns
print("\nDataset shape:")
print(df.shape)

# Display column names
print("\nColumn names:")
print(df.columns)

# Check for missing values
print("\nMissing values:")
print(df.isnull().sum())

# Check for duplicate rows
print("\nNumber of duplicate rows:")
print(df.duplicated().sum())

# Calculate revenue for each sale
df["Revenue"] = df["Quantity"] * df["Price"]

# Display product revenue
print("\nRevenue by product:")
print(df[["Product", "Revenue"]])

# Calculate total revenue
print("\nTotal Revenue:")
print(df["Revenue"].sum())

# Calculate total revenue for each product
product_revenue = df.groupby("Product")["Revenue"].sum()

print("\nTotal revenue by product:")
print(product_revenue)

# Sort products by revenue, highest first
sorted_revenue = product_revenue.sort_values(ascending=False)

print("\nProducts ranked by revenue:")
print(sorted_revenue)

# Calculate total revenue by category
category_revenue = df.groupby("Category")["Revenue"].sum()

print("\nTotal revenue by category:")
print(category_revenue)

# Sort by category, then revenue from highest to lowest
df_sorted = df.sort_values(
    by=["Category", "Revenue"],
    ascending=[True, False]
)

print("\nData sorted by category and revenue:")
print(df_sorted[["Category", "Product", "Revenue"]])

# Select numerical columns
numeric_data = df[["Quantity", "Price", "Revenue"]]

# Create correlation matrix
correlation_matrix = numeric_data.corr()

print("\nCorrelation Matrix:")
print(correlation_matrix)
