import matplotlib.pyplot as plt
import pandas as pd
import matplotlib.patches as mpatches

# Read CSV File
file_path = 'your_file_path.csv'  # Replace with your CSV file path

# Load Data
df = pd.read_csv(file_path)

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
block_width = 1      # Each time unit is visually wide
block_height = 0.5   # Each Die occupies 0.5 cm vertically

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
plt.xticks(time_scaled, labels=[f"{int(t)} ns" for t in time], rotation=45, fontsize=8)  # Time ticks
plt.yticks([i * block_height for i in range(max_die + 1)], range(max_die, -1, -1))  # Die ticks

# Labels and title
plt.xlabel("Time (ns)")
plt.ylabel("Die")
plt.title("Time vs Die with W/R Blocks (Filtered Commands)")

# Create legend
legend_w = mpatches.Patch(color='lightblue', label='Single Plane Page Write Operation (W)')
legend_r = mpatches.Patch(color='lightcoral', label='Random Data Output (R)')
plt.legend(handles=[legend_w, legend_r], loc='upper left', fontsize=10)

# Add grid for clarity
plt.grid(True, which='both', linestyle='--', linewidth=0.5)

# Show the plot
plt.tight_layout()
plt.show()






import matplotlib.pyplot as plt
import pandas as pd
import matplotlib.patches as mpatches

# Read CSV File
file_path = 'your_file_path.csv'  # Replace with your CSV file path

# Load Data
df = pd.read_csv(file_path)

# Filter rows based on Command Name
filtered_df = df[df['Command name'].isin(['Single Plane Page Write Operation', 'Random Data Output'])]

# Map Command Name to W/R for plotting
filtered_df['W/R'] = filtered_df['Command name'].map({
    'Single Plane Page Write Operation': 'W',
    'Random Data Output': 'R'
})

# Extract relevant columns
time = filtered_df['Time(ns)'].reset_index(drop=True)  # Reset index for consistent calculations
die = filtered_df['Die'].reset_index(drop=True)
command = filtered_df['W/R'].reset_index(drop=True)

# Find the maximum Die value
max_die = die.max()

# Calculate dynamic block widths for every Die
time_diff = time.diff().shift(-1).fillna(1)  # Width = time difference; Last block gets default 1 ns

# Block height
block_height = 0.5  # Each Die occupies 0.5 cm vertically

# Plot setup
fig, ax = plt.subplots(figsize=(12, max_die * block_height + 2))  # Dynamically scale the plot size

# Plot blocks
for t, t_diff, d, cmd in zip(time, time_diff, die, command):
    color = 'lightblue' if cmd == 'W' else 'lightcoral'
    adjusted_y = (max_die - d) * block_height  # Adjust Die position for descending order
    ax.add_patch(plt.Rectangle((t, adjusted_y), t_diff, block_height, color=color, ec='black'))

# Set axes limits and Y-axis ordering
ax.set_xlim(time.min() - 1, time.max() + 1)  # Slight padding on X-axis
ax.set_ylim(0, (max_die + 1) * block_height)  # Adjust Y-axis range

# Configure axes labels and ticks
plt.xticks(time, labels=[f"{int(t)} ns" for t in time], rotation=45, fontsize=8)  # Time ticks
plt.yticks(
    [i * block_height for i in range(max_die + 1)],  # Position ticks evenly along Y-axis
    range(max_die, -1, -1)  # Tick labels go from max_die to 0
)

# Labels and title
plt.xlabel("Time (ns)")
plt.ylabel("Die")
plt.title("Time vs Die with W/R Blocks (Filtered Commands)")

# Create legend
legend_w = mpatches.Patch(color='lightblue', label='Single Plane Page Write Operation (W)')
legend_r = mpatches.Patch(color='lightcoral', label='Random Data Output (R)')
plt.legend(handles=[legend_w, legend_r], loc='upper left', fontsize=10, bbox_to_anchor=(1, 1))

# Add grid for clarity
plt.grid(True, which='both', linestyle='--', linewidth=0.5)

# Adjust layout to make room for the legend
plt.tight_layout()

# Show the plot
plt.show()









import matplotlib.pyplot as plt
import pandas as pd
import matplotlib.patches as mpatches

# Read CSV File
file_path = 'your_file_path.csv'  # Replace with your CSV file path

# Load Data
df = pd.read_csv(file_path)

# Filter rows based on Command Name
filtered_df = df[df['Command name'].isin([
    'Single Plane Page Write Operation',
    'Random Data Output',
    'Read Status'
])]

# Map Command Name to W/R/RD for plotting
filtered_df['W/R/RD'] = filtered_df['Command name'].map({
    'Single Plane Page Write Operation': 'W',
    'Random Data Output': 'R',
    'Read Status': 'RD'
})

# Extract relevant columns
time = filtered_df['Time(ns)'].reset_index(drop=True)  # Reset index for consistent calculations
die = filtered_df['Die'].reset_index(drop=True)
command = filtered_df['W/R/RD'].reset_index(drop=True)

# Find the maximum Die value
max_die = die.max()

# Calculate dynamic block widths with conditions
time_diff = []
for i in range(len(time)):
    if i == len(time) - 1:
        # Last block gets default width
        time_diff.append(50_000)
    else:
        # Check for "Read Status" or other commands between current and next row
        current_time = time[i]
        next_time = time[i + 1]
        width = next_time - current_time

        # If the width exceeds 1,000,000 ns, set default to 50,000 ns
        if width > 1_000_000:
            width = 50_000

        time_diff.append(width)

# Block height
block_height = 0.5  # Each Die occupies 0.5 cm vertically

# Plot setup
fig, ax = plt.subplots(figsize=(12, max_die * block_height + 2))  # Dynamically scale the plot size

# Plot blocks
for t, t_diff, d, cmd in zip(time, time_diff, die, command):
    if cmd == 'W':
        color = 'lightblue'
    elif cmd == 'R':
        color = 'lightcoral'
    elif cmd == 'RD':
        color = 'lightgreen'
    else:
        color = 'gray'

    adjusted_y = (max_die - d) * block_height  # Adjust Die position for descending order
    ax.add_patch(plt.Rectangle((t, adjusted_y), t_diff, block_height, color=color, ec='black'))

# Set axes limits and Y-axis ordering
ax.set_xlim(time.min() - 1, time.max() + 1)  # Slight padding on X-axis
ax.set_ylim(0, (max_die + 1) * block_height)  # Adjust Y-axis range

# Configure axes labels and ticks
plt.xticks(time, labels=[f"{int(t)} ns" for t in time], rotation=45, fontsize=8)  # Time ticks
plt.yticks(
    [i * block_height for i in range(max_die + 1)],  # Position ticks evenly along Y-axis
    range(max_die, -1, -1)  # Tick labels go from max_die to 0
)

# Labels and title
plt.xlabel("Time (ns)")
plt.ylabel("Die")
plt.title("Time vs Die with W/R/RD Blocks (Filtered Commands)")

# Create legend
legend_w = mpatches.Patch(color='lightblue', label='Single Plane Page Write Operation (W)')
legend_r = mpatches.Patch(color='lightcoral', label='Random Data Output (R)')
legend_rd = mpatches.Patch(color='lightgreen', label='Read Status (RD)')
plt.legend(handles=[legend_w, legend_r, legend_rd], loc='upper left', fontsize=10, bbox_to_anchor=(1, 1))

# Add grid for clarity
plt.grid(True, which='both', linestyle='--', linewidth=0.5)

# Adjust layout to make room for the legend
plt.tight_layout()

# Show the plot
plt.show()
