#!/usr/bin/python
import argparse
from os.path import isfile as filehere

REG_SIZE = 8
REG_ADDR_SIZE = 4
ROM_ADDR_SIZE = 8
MAX_ARGS = 3
OPCODE_SIZE = 3
# Note: some of these are macros that allow representing data differently or formatting arguments differently
VALID_OPCODES = {'nop', 'ld', 'ldc', 'mov', 'disp', 'xor', 'or', 'add', 'lsr', 'lsl', 'com', 'jmp', 'jp', 'jpc', 'jpnc', 'inc', 'dec', 'cp', 'sub', 'dispd' 'disp_str'}
REGISTERS = {'r0': 0,
             'r1': 1,
             'r2': 2,
             'r3': 3,
             'r4': 4,
             'r5': 5,
             'r6': 6,
             'r7': 7,
             'r8': 8,
             'r9': 9,
             'ra': 10,
             'rb': 11,
             'rc': 12,
             'rd': 13,
             're': 14,
             'rf': 15,
             'r10': 10,
             'r11': 11,
             'r12': 12,
             'r13': 13,
             'r14': 14,
             'r15': 15
             }


def is_empty(line):
    return len(line.strip()) == 0


def is_label(line):
    return line.strip()[-1] == ':'


def get_label(line):
    return line.strip()[:-1]


def is_comment(line):
    return line.strip()[0] == ';'


def get_register(reg):
    return REGISTERS[reg.lower().strip()]


def is_macro_start(line):
    return line.strip().lower().split(' ', 1)[0] == 'macro'


def get_macro_name(line):
    return decompose_line(line)[1][0]


def is_macro_end(line):
    return line.lower().strip() in {'endm', 'endmacro'}


def is_const(line):
    return line.strip().lower().split(' ', 1)[0] == 'const'


def get_const(line):
    const_args = decompose_line(line)[1]
    return (const_args[0], const_args[1])


def register_oob(val:int):
    if val > (2 ** REG_SIZE) - 1 or val < ((2 ** REG_SIZE) // -2):
        raise ValueError(f'Value {val} is out of bounds for register size {REG_SIZE}!')


def register_addr_oob(val:int):
    if val > (2 ** REG_ADDR_SIZE) or val < 0:
        raise ValueError(f'Value {val} is out of bounds for register address size {REG_ADDR_SIZE}!')


def rom_addr_oob(val:int):
    if val > (2 ** ROM_ADDR_SIZE) or val < 0:
        raise ValueError(f'Value {val} is out of bounds for ROM address size {ROM_ADDR_SIZE}!')


def args_split(args_line):
    args_list = []
    arg_buffer = ''
    in_quotes = False
    esc_char = False
    for index, c in enumerate(args_line):
        if esc_char and in_quotes:
            match c:
                case 'n':
                    c = '\n'
                case 't':
                    c = '\t'
                case 'r':
                    c = '\r'
                case '"':
                    c = '"'
                case "'":
                    c = "'"
                case '\\':
                    c = '\\'
            esc_char = False
        elif c == '\\':
            esc_char = True
            continue
        elif c == '"':
            in_quotes = not in_quotes
            continue

        if c == ',' and not in_quotes:
            args_list.append(arg_buffer)
            arg_buffer = ''
            continue
        elif c == ';' and not in_quotes:
            args_list.append(arg_buffer)
            arg_buffer = ''
            break
        elif c == ' ' and not in_quotes:
            continue
        arg_buffer += c
    if len(arg_buffer) > 0:
        args_list.append(arg_buffer)
        arg_buffer = ''
    return list(filter(lambda x: len(x) > 0, args_list))


def decompose_line(line):
    line = line.strip()
    opcode, arguments = line.split(' ', 1)
    split_args = args_split(arguments)
    return (opcode.lower(), split_args)


def get_op_size(macros, line):
    opcode, arguments = decompose_line(line)
    if opcode == 'disp_str':
        return len(arguments[0])
    elif opcode == 'args':
        return 0
    elif opcode in macros:
        m_size = 0
        for m_line in macros[opcode]:
            m_size += get_op_size(macros, m_line)
        return m_size
    else:
        return 1


def map_macros_labels(asm_file):
    addr_counter = -1
    labels = dict()
    macros = dict()
    consts = dict()
    in_macro = False
    cur_macro = ''
    asm_file.seek(0)
    for line in asm_file:
        if is_empty(line):
            continue
        elif is_const(line):
            n_const_name, n_const_val = get_const(line)
            consts[n_const_name] = n_const_val
            continue
        elif is_macro_start(line):
            in_macro = True
            cur_macro = get_macro_name(line)
            macros[cur_macro] = []
            continue
        elif is_macro_end(line):
            in_macro = False
            continue
        elif in_macro:
            if is_label(line):
                raise ValueError(f'Macro {cur_macro}: cannot have a label inside a macro!')
            macros[cur_macro].append(line)
            continue
        elif is_label(line):
            labels[get_label(line)] = addr_counter + 1
            continue
        elif is_comment(line):
            continue
        addr_counter += get_op_size(macros, line)
    print(labels)
    return (macros, labels, consts)


def generate_machine_code(opcode, args):
    match opcode:
        case 'nop':
            return (0).to_bytes(OPCODE_SIZE, 'big')
        case 'ld':
            register_oob(int(args[1]))
            return ((1 << 12) + (get_register(args[0]) << 8) + (int(args[1]))).to_bytes(OPCODE_SIZE, 'big')
        case 'ldc':
            return ((1 << 12) + (get_register(args[0]) << 8) + (ord(args[1]))).to_bytes(OPCODE_SIZE, 'big')
        case 'mov':
            return ((2 << 12) + (get_register(args[0]) << 8) + (get_register(args[1]) << 4)).to_bytes(OPCODE_SIZE, 'big')
        case 'disp':
            return ((3 << 12) + (get_register(args[0]) << 4)).to_bytes(3, 'big')
        case 'dispd':
            if type(args[0]) == str:
                return ((3 << 12) + (1 << 8) + (ord(args[0]))).to_bytes(3, 'big')
            return ((3 << 12) + (1 << 8) + (int(args[0]))).to_bytes(3, 'big')
        case 'xor':
            return ((4 << 12) + (get_register(args[0]) << 8) + (get_register(args[1]) << 4) + (get_register(args[2]))).to_bytes(OPCODE_SIZE, 'big')
        case 'and':
            return ((5 << 12) + (get_register(args[0]) << 8) + (get_register(args[1]) << 4) + (get_register(args[2]))).to_bytes(OPCODE_SIZE, 'big')
        case 'or':
            return ((6 << 12) + (get_register(args[0]) << 8) + (get_register(args[1]) << 4) + (get_register(args[2]))).to_bytes(OPCODE_SIZE, 'big')
        case 'add':
            return ((7 << 12) + (get_register(args[0]) << 8) + (get_register(args[1]) << 4) + (get_register(args[2]))).to_bytes(OPCODE_SIZE, 'big')
        case 'lsr':
            return ((8 << 12) + (get_register(args[0]) << 8) + (get_register(args[1]) << 4)).to_bytes(OPCODE_SIZE, 'big')
        case 'lsl':
            return ((9 << 12) + (get_register(args[0]) << 8) + (get_register(args[1]) << 4)).to_bytes(OPCODE_SIZE, 'big')
        case 'com':
            return ((10 << 12) + (get_register(args[0]) << 8) + (get_register(args[1]) << 4)).to_bytes(OPCODE_SIZE, 'big')
        case 'jmp':
            return ((11 << 12) + (get_register(args[0]))).to_bytes(OPCODE_SIZE, 'big')
        case 'jp':
            rom_addr_oob(int(args[0]))
            return ((11 << 12) + (1 << 8) + (int(args[0]))).to_bytes(OPCODE_SIZE, 'big')
        case 'jpc':
            rom_addr_oob(int(args[0]))
            return ((11 << 12) + (2 << 8) + (int(args[0]))).to_bytes(OPCODE_SIZE, 'big')
        case 'jpnc':
            rom_addr_oob(int(args[0]))
            return ((11 << 12) + (3 << 8) + (int(args[0]))).to_bytes(OPCODE_SIZE, 'big')
        case 'inc':
            return ((12 << 12) + (get_register(args[0]) << 8) + (get_register(args[0]) << 4)).to_bytes(OPCODE_SIZE, 'big')
        case 'dec':
            return ((13 << 12) + (get_register(args[0]) << 8) + (get_register(args[0]) << 4)).to_bytes(OPCODE_SIZE, 'big')
        case 'cp':
            return ((14 << 12) + (get_register(args[0]) << 4) + (get_register(args[1]))).to_bytes(OPCODE_SIZE, 'big')
        case 'sub':
            return ((15 << 12) + (get_register(args[0]) << 8) + (get_register(args[1]) << 4) + (get_register(args[2]))).to_bytes(OPCODE_SIZE, 'big')
        case 'disp_str':
            final_macro = b''
            for c in args[0]:
                if final_macro == b'':
                    final_macro = ((3 << 12) + (1 << 8) + (ord(c))).to_bytes(OPCODE_SIZE, 'big')
                else:
                    final_macro = final_macro + ((3 << 12) + (1 << 8) + (ord(c))).to_bytes(OPCODE_SIZE, 'big')
            return final_macro
        case _:
            raise ValueError(f'Instruction "{opcode}" is not a vaild opcode')


def expand_macro(output_file, labels, macros, consts, mac_name, mac_given_args):
    addr_delta = 0
    macro_contents = macros[mac_name]
    mac_set_args = dict()
    if decompose_line(macro_contents[0])[0] in {'args', 'arguments'}:
        mac_set_args = dict(zip(decompose_line(macro_contents[0])[1], mac_given_args))
    for line in macro_contents:
        line_op, line_args = decompose_line(line)
        if line_op == 'args':
            continue
        arg_swapped_line = list(map(lambda a: mac_set_args[a] if a in mac_set_args else a, line_args))
        addr_delta += parse_asm_op_args(output_file, labels, macros, consts, line_op, arg_swapped_line)
    return addr_delta


def parse_asm_op_args(output_file, labels, macros, consts, opcode, args):
    """Parse a line with an opcode or macro in it.

    Returns: change in address incremented
    """
    # Substitute constants
    const_subbed_args = list(map(lambda a: consts[a] if a in consts else a, args))
    # Substitute labels
    const_subbed_args = list(map(lambda a: labels[a] if a in labels else a, const_subbed_args))
    if opcode in macros:
        return expand_macro(output_file, labels, macros, consts, opcode, const_subbed_args)
    mach_code = generate_machine_code(opcode, const_subbed_args)
    output_file.write(mach_code)
    if opcode == 'disp_str':
        return 2 * len(args[0])
    else:
        return 1


def do_in_out(in_file, output):
    with open(in_file, mode='r') as asm_file:
        # This first pass maps labels, macros and constants
        macros, labels, consts = map_macros_labels(asm_file)
        addr_counter = 0
        with open(output, mode='wb') as output_file:
            asm_file.seek(0)
            in_macro = False
            for line in asm_file:
                if is_empty(line) or is_comment(line) or is_label(line) or is_const(line):
                    continue
                if is_macro_start(line):
                    in_macro = True
                    continue
                if is_macro_end(line):
                    in_macro = False
                    continue
                if in_macro:
                    continue
                opcode, args = decompose_line(line)
                addr_counter += parse_asm_op_args(output_file, labels, macros, consts, opcode, args)
    return


def main():
    # Arguments
    parser = argparse.ArgumentParser(description='Assembler for Logisim circuit')
    parser.add_argument('asm', help='Input assembly file')
    parser.add_argument('-o', '--output', help='Output binary file')
    parser.add_argument('-f', '--overwrite', help='Force overwriting output binary', action='store_true')
    args = parser.parse_args()
    if args.output is None:
        args.output = 'a.bin'
    if filehere(args.output) and args.overwrite is False:
        confirm = input(f'{args.output} exists, overwrite anyway? [y/N] ').lower()
        if confirm != 'y':
            return 1
    do_in_out(args.asm, args.output)


if __name__ == '__main__':
    main()
