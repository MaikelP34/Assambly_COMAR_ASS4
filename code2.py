import re

# -------------------------------------------------
# Binary helpers
# -------------------------------------------------
def instr_to_binary_bytes_from_int(value):
    bin32 = f"{value:032b}"
    return [f'"{bin32[i:i+8]}"' for i in range(0, 32, 8)]


def instr_to_binary_bytes_from_bin(bin32):
    return [f'"{bin32[i:i+8]}"' for i in range(0, 32, 8)]


# -------------------------------------------------
# Custom instruction encoding
# -------------------------------------------------
def encode_custom(instr, address):
    opcode = 0b1111111  # 7 bits

    rs1 = 0
    rs2 = 0

    # Split address into imm bits
    imm_low  = address & 0b11111      # bits 4:0 → imm[11:7]
    imm_high = (address >> 5) & 0b1111111  # bits 11:5 → imm[31:25]

    # funct3 afhankelijk van instructie
    if instr == "lwi":
        funct3 = 0b001
    elif instr == "lww":
        funct3 = 0b010
    elif instr == "mulan":
        funct3 = 0b100
    else:
        raise ValueError(f"Unknown instruction {instr}")

    # Plaats alle velden op de juiste posities
    bin32 = (
        (imm_high << 25) |   # imm[31:25]
        (rs2 << 20)     |    # rs2[24:20]
        (rs1 << 15)     |    # rs1[19:15]
        (funct3 << 12)  |    # funct3[14:12]
        (imm_low << 7)  |    # imm[11:7]
        opcode               # opcode[6:0]
    )

    return f"{bin32:032b}"





# -------------------------------------------------
# Load assembly (ignore labels/comments)
# -------------------------------------------------
def load_assembly_lines(filename):
    lines = []
    with open(filename) as f:
        for line in f:
            clean = line.strip()

            if clean == "":
                continue
            if clean.endswith(":"):
                continue

            clean = re.split(r"#|//", clean)[0].strip()
            if clean == "":
                continue

            lines.append(clean)
    return lines


# -------------------------------------------------
# Load hex instructions
# -------------------------------------------------
def load_hex_instructions(filename):
    with open(filename) as f:
        return [line.strip() for line in f if line.strip()]


# -------------------------------------------------
# Main
# -------------------------------------------------
hex_instr = load_hex_instructions("instructions.txt")
asm_instr = load_assembly_lines("no_memloop_no_cheat.s")

hex_index = 0
pc = 0

for asm in asm_instr:
    tokens = asm.split()

    # -------------------------------
    # Custom instructions
    # -------------------------------
    if tokens[0] in ("lwi", "lww", "mulan"):
        input_rs2 = int(tokens[1])
        bin32 = encode_custom(tokens[0], input_rs2)
        bytes_bin = instr_to_binary_bytes_from_bin(bin32)

    # -------------------------------
    # Normal instruction (from hex)
    # -------------------------------
    else:
        if hex_index >= len(hex_instr):
            raise RuntimeError("Ran out of hex instructions!")

        value = int(hex_instr[hex_index], 16)
        bytes_bin = instr_to_binary_bytes_from_int(value)
        hex_index += 1

    print(f"{','.join(bytes_bin)},    -- {pc:02X} {asm}")
    pc += 4


if hex_index != len(hex_instr):
    print("WARNING: unused hex instructions left!")
