from matplotlib import pyplot as plt
import numpy as np
import h5py as h5
import seaborn as sns

sns.set_theme()
file = h5.File("dft.h5", "r")

fig, ax = plt.subplots(figsize=(8, 6))

total_time_naive = np.sum(file["naive"][()], axis=1)
total_time_efficient = np.sum(file["efficient"][()], axis=1)

efficient = "dotted"
naive = "solid"
print(np.sum(file["target"][()]))
ax.plot(
    file["sizes"][()],
    np.sum(file["target"][()]) / total_time_naive,
    color="black",
    linestyle=naive,
    label="total naive",
)
ax.plot(
    file["sizes"][()],
    np.sum(file["target"][()]) / total_time_efficient,
    color="black",
    linestyle=efficient,
    label="total efficient",
)

ax.plot(
    file["sizes"][()],
    file["target"][()][0] / file["naive"][()][:, 0],
    color="red",
    linestyle=naive,
    label="compress naive",
)
ax.plot(
    file["sizes"][()],
    file["target"][()][1] / file["naive"][()][:, 1],
    color="blue",
    linestyle=naive,
    label="decompress naive",
)

ax.plot(
    file["sizes"][()],
    file["target"][()][0] / file["efficient"][()][:, 0],
    color="red",
    linestyle=efficient,
    label="compress naive",
)
ax.plot(
    file["sizes"][()],
    file["target"][()][1] / file["efficient"][()][:, 1],
    color="blue",
    linestyle=efficient,
    label="decompress naive",
)
ax.set_xlabel("number of threads")
ax.set_ylabel("speed-up")

ax.legend()
plt.savefig("scalling.pdf", dpi=300)
file.close()
