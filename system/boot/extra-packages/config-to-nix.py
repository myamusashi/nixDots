import re

# Baca file .config
with open("kernel-config.config", "r") as f:
    lines = f.readlines()

# Filter dan konversi ke format Nix
nix_config = []
for line in lines:
    line = line.strip()
    if line and not line.startswith("#"):
        match = re.match(r"^(CONFIG_\w+)=(y|m|n|\d+|0x.+|\".*\")$", line)
        if match:
            key, value = match.groups()
            if value == "y":
                nix_config.append(f"{key} = yes;")
            elif value == "m":
                nix_config.append(f"{key} = module;")
            elif value == "n":
                nix_config.append(f"{key} = no;")
            else:
                nix_config.append(f"{key} = {value};")

# Tulis ke file Nix
with open("kernel-config.nix", "w") as f:
    f.write("{ pkgs }:\nwith pkgs.lib.kernel; {\n")
    f.write("\n".join(nix_config))
    f.write("\n}\n")

print("Konversi selesai! File kernel-config.nix telah dibuat.")
