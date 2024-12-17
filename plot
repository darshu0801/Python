import matplotlib.pyplot as plt
import pandas as pd

# Sample Data
data = {
    'Time': [1, 2, 3, 4, 5, 6],
    'Die': [0, 1, 2, 3, 0, 1],
    'W/R': ['W', 'W', 'W', 'R', 'R', 'R']
}

# Create DataFrame
df = pd.DataFrame(data)

# Find the maximum Die value
max_die = df['Die'].max()

# Plot setup
fig, ax = plt.subplots(figsize=(6, 6))  # 1x1 scaling (6 cm wide, 6 cm tall)

# Plot W/R blocks at Die values
block_width = 1  # 1 cm wide for each time unit
block_height = 1  # 1 cm high for Die units

for idx, row in df.iterrows():
    color = 'lightblue' if row['W/R'] == 'W' else 'lightcoral'
    # Rectangle starts at (Time - 1, Die) and spans 1x1 block
    ax.add_patch(plt.Rectangle((row['Time'] - 1, max_die - row['Die']), block_width, block_height, 
                               color=color, ec='black'))

# Set axes limits and invert Y-axis
ax.set_xlim(0, len(df['Time']))  # X-axis: Time
ax.set_ylim(0, max_die + 1)      # Y-axis limits based on max Die
ax.invert_yaxis()  # Invert Y-axis for descending order

# Configure axes labels and ticks
plt.xticks(range(0, len(df['Time']) + 1))  # Time ticks
plt.yticks(range(0, max_die + 1))  # Die ticks
plt.xlabel("Time (1 cm per unit)")
plt.ylabel("Die")
plt.title("Time vs Die with W/R Blocks (Descending Y-axis)")

# Add grid for clarity
plt.grid(True, which='both', linestyle='--', linewidth=0.5)

# Show the plot
plt.show()