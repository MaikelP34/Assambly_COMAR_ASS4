def instr_to_binary_bytes(value):
    """Convert 32-bit integer to four 8-bit binary strings."""
    bin32 = f"{value:032b}"
    return [f'"{bin32[i:i+8]}"' for i in range(0, 32, 8)]


def process_program_binary(instructions, start_pc=0):
    pc = start_pc
    pc2=0
    for instr in instructions:
        bytes_bin = instr_to_binary_bytes(instr)
        print(f"{','.join(bytes_bin)},    -- {pc:02X},{pc2:02d}(hex,dec)")
        pc += 4
        pc2 += 1


# -------------------------------
# Read newline-separated input
# -------------------------------
file_path = "instructions.txt"  # jouw inputbestand

instructions = []
with open(file_path, "r") as f:
    for line in f:
        line = line.strip()
        if line == "":
            continue
        instructions.append(int(line, 16))

process_program_binary(instructions, start_pc=0)
