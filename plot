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

# Plot setup
block_width = 1  # Each block is 1cm wide
block_height = 1  # Fixed small height for better visualization
fig, ax = plt.subplots(figsize=(6, 2))  # 6cm wide (6 seconds), 2cm tall for clean view

# Draw blocks for W/R
for idx, row in df.iterrows():
    color = 'lightblue' if row['W/R'] == 'W' else 'lightcoral'
    ax.add_patch(plt.Rectangle((row['Time'] - 1, 0), block_width, block_height, color=color, ec='black'))
    
    # Place Die values as text above each block
    plt.text(row['Time'] - 0.5, block_height + 0.2, str(row['Die']), 
             ha='center', va='center', fontsize=10, color='black')

# Configure axes
ax.set_xlim(0, len(df['Time']))  # 1 cm per second
ax.set_ylim(0, block_height + 1)  # Height limited to small value
ax.set_aspect('equal')  # Ensure 1cm width for each unit

# Set labels and clean grid
plt.xticks(range(0, len(df['Time']) + 1))  # 1 unit per second
plt.yticks([])  # Hide Y-axis ticks for cleaner display
plt.xlabel("Time (1 cm per unit)")
plt.title("Time vs Die with W/R Blocks")

# Final touches
plt.grid(False)  # Disable grid for a cleaner block view
plt.tight_layout()
plt.show()