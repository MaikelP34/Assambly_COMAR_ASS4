import re

def instr_to_binary_bytes(value):
    bin32 = f"{value:032b}"
    return [f'"{bin32[i:i+8]}"' for i in range(0, 32, 8)]


def load_assembly_lines(filename):
    """Extract only real instructions, ignore labels & comments."""
    instructions = []
    with open(filename, "r") as f:
        for line in f:
            clean = line.strip()

            # ignore empty
            if clean == "":
                continue

            # ignore labels (e.g., loop:)
            if clean.endswith(":"):
                continue

            # remove trailing comments
            clean = re.split(r"#|//", clean)[0].strip()

            if clean == "":
                continue

            instructions.append(clean)

    return instructions


def load_hex_instructions(filename):
    hexlist = []
    with open(filename, "r") as f:
        for line in f:
            clean = line.strip()
            if clean:
                hexlist.append(clean)
    return hexlist


hex_instr = load_hex_instructions("instructions.txt")
asm_instr = load_assembly_lines("test.s")

if len(hex_instr) != len(asm_instr):
    print("WARNING: hex count != asm instruction count!")

pc = 0
for hexval, asm in zip(hex_instr, asm_instr):
    value = int(hexval, 16)
    bytes_bin = instr_to_binary_bytes(value)
    print(f"{','.join(bytes_bin)},    -- {pc:02X} {asm}")
    pc += 4
