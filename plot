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

# Scaling factors
block_width = 1      # 1 unit wide (1 cm per Time)
block_height = 0.5   # Height for each Die level

# Plot setup
fig, ax = plt.subplots(figsize=(6, max_die * block_height + 1))  # Scale Y-axis height appropriately

# Plot W/R blocks at Die values
for idx, row in df.iterrows():
    color = 'lightblue' if row['W/R'] == 'W' else 'lightcoral'
    # Adjust Die value for descending order and scale height
    adjusted_y = (max_die - row['Die']) * block_height
    ax.add_patch(plt.Rectangle((row['Time'] - 1, adjusted_y), block_width, block_height, 
                               color=color, ec='black'))

# Set axes limits
ax.set_xlim(0, len(df['Time']))  # X-axis: Time
ax.set_ylim(0, (max_die + 1) * block_height)  # Scale Y-axis with 0.5 cm steps
ax.invert_yaxis()  # Invert Y-axis for descending order

# Configure axes labels and ticks
plt.xticks(range(0, len(df['Time']) + 1))  # X-axis ticks (Time)
plt.yticks([i * block_height for i in range(max_die + 1)], range(max_die, -1, -1))  # Y-axis ticks

# Labels and title
plt.xlabel("Time (1 cm per unit)")
plt.ylabel("Die")
plt.title("Time vs Die with W/R Blocks (Scaled Y-axis)")

# Grid for clarity
plt.grid(True, which='both', linestyle='--', linewidth=0.5)

# Show the plot
plt.show()