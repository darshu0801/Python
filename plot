import matplotlib.pyplot as plt
import pandas as pd

# Read Excel File
file_path = 'your_file_path.xlsx'  # Replace with your file path
sheet_name = 'Sheet1'  # Update if necessary

# Load Data
df = pd.read_excel(file_path, sheet_name=sheet_name)

# Filter rows based on Command Name
filtered_df = df[df['Command name'].isin(['Single Plane Page Write Operation', 'Random Data Output'])]

# Map Command Name to W/R for plotting
filtered_df['W/R'] = filtered_df['Command name'].map({
    'Single Plane Page Write Operation': 'W',
    'Random Data Output': 'R'
})

# Extract relevant columns
time = filtered_df['Time(ns)']
die = filtered_df['Die']
command = filtered_df['W/R']

# Find the maximum Die value
max_die = die.max()

# Scaling factors
block_width = 1  # Each time unit is visually wide (adjust later if needed)
block_height = 0.5  # Each Die occupies 0.5 cm vertically

# Convert Time(ns) to scaled units for X-axis spacing
time_scaled = (time - time.min()) / (time.max() - time.min()) * len(time)

# Plot setup
fig, ax = plt.subplots(figsize=(10, max_die * block_height + 2))  # Dynamically scale the plot size

# Plot blocks
for t, d, cmd in zip(time_scaled, die, command):
    color = 'lightblue' if cmd == 'W' else 'lightcoral'
    adjusted_y = (max_die - d) * block_height  # Adjust Die position for descending order
    ax.add_patch(plt.Rectangle((t, adjusted_y), block_width, block_height, color=color, ec='black'))

# Set axes limits and invert Y-axis
ax.set_xlim(-1, time_scaled.max() + 1)  # Slight padding on X-axis
ax.set_ylim(0, (max_die + 1) * block_height)  # Adjust Y-axis range
ax.invert_yaxis()  # Descending order for Die

# Configure axes labels and ticks
plt.xticks(time_scaled, labels=[f"{t} ns" for t in time], rotation=45, fontsize=8)  # Time ticks
plt.yticks([i * block_height for i in range(max_die + 1)], range(max_die, -1, -1))  # Die ticks

# Labels and title
plt.xlabel("Time (ns)")
plt.ylabel("Die")
plt.title("Time vs Die with W/R Blocks (Filtered Commands)")

# Add grid for clarity
plt.grid(True, which='both', linestyle='--', linewidth=0.5)

# Show the plot
plt.tight_layout()
plt.show()