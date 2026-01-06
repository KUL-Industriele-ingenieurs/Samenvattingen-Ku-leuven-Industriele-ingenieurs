import matplotlib.pyplot as plt
import numpy as np

# Helper function to convert polar to cartesian
def p2c(mag, ang_deg):
    ang_rad = np.radians(ang_deg)
    return mag * np.cos(ang_rad), mag * np.sin(ang_rad)

# Data
V_mag = 208
V_AB_c = p2c(V_mag, 0)
V_BC_c = p2c(V_mag, -120)
V_CB_c = p2c(V_mag, 60) # V_CB is -V_BC

I_A_c = p2c(8.33, -13.9)
I_C_c = p2c(5.04, 83.4)

# Plot setup
fig, ax = plt.subplots(figsize=(8, 8))
origin = [0, 0]

# Plot Voltages
ax.quiver(*origin, *V_AB_c, color='blue', scale=1, scale_units='xy', angles='xy', label='$V_{AB}$ (Ref)', width=0.012)
ax.quiver(*origin, *V_CB_c, color='cyan', scale=1, scale_units='xy', angles='xy', label='$V_{CB}$ (for W2)', width=0.012)

# Plot Currents (Scaled up for visibility)
scale_I = 15 # Scaling factor for current vectors to match voltage scale visually
I_A_plot = (I_A_c[0]*scale_I, I_A_c[1]*scale_I)
I_C_plot = (I_C_c[0]*scale_I, I_C_c[1]*scale_I)

ax.quiver(*origin, *I_A_plot, color='red', scale=1, scale_units='xy', angles='xy', label='$I_A$ (Line)', width=0.012)
ax.quiver(*origin, *I_C_plot, color='orange', scale=1, scale_units='xy', angles='xy', label='$I_C$ (Line)', width=0.012)

# Annotations
plt.text(V_AB_c[0], V_AB_c[1], r'$V_{AB}$', fontsize=12, color='blue')
plt.text(V_CB_c[0], V_CB_c[1], r'$V_{CB}$', fontsize=12, color='cyan')
plt.text(I_A_plot[0], I_A_plot[1], r'$I_A$', fontsize=12, color='red')
plt.text(I_C_plot[0], I_C_plot[1], r'$I_C$', fontsize=12, color='orange')

# Angles text
plt.text(50, -10, r'$\phi_1 \approx 13.9^\circ$', fontsize=10)
plt.text(20, 50, r'$\phi_2 \approx -23.4^\circ$', fontsize=10)

# Settings
ax.set_xlim(-100, 250)
ax.set_ylim(-150, 250)
ax.axhline(0, color='black', linewidth=0.5)
ax.axvline(0, color='black', linewidth=0.5)
ax.set_aspect('equal')
plt.grid(True, which='both', linestyle='--', alpha=0.6)
plt.legend(loc='lower left')
plt.title('Phasor Diagram for 2-Wattmeter Method')

# Show
plt.show()