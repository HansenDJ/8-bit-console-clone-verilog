// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Wed Apr 10 14:27:45 2024
// Host        : carson-yeet running 64-bit CachyOS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dsp_pc_counter_sim_netlist.v
// Design      : dsp_pc_counter
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_pc_counter,c_counter_binary_v12_0_17,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_17,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    CE,
    LOAD,
    L,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 load_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME load_intf, LAYERED_METADATA undef" *) input LOAD;
  (* x_interface_info = "xilinx.com:signal:data:1.0 l_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME l_intf, LAYERED_METADATA undef" *) input [15:0]L;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [15:0]Q;

  wire CE;
  wire CLK;
  wire [15:0]L;
  wire LOAD;
  wire [15:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_COUNT_BY = "1" *) 
  (* C_COUNT_MODE = "0" *) 
  (* C_COUNT_TO = "1" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_LOAD = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_HAS_THRESH0 = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "1" *) 
  (* C_LOAD_LOW = "0" *) 
  (* C_RESTRICT_COUNT = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_THRESH0_VALUE = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "16" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_17 U0
       (.CE(CE),
        .CLK(CLK),
        .L(L),
        .LOAD(LOAD),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
eFbqyWxvTxgrA/YtdaoI20/0Oxv6heWR3Rkp9/xOWnvLDdGDhtGJBQqdO4v1RO/kikveHE3JyVBx
OMXM/QBYbcn/QmEMFud4drsy8IbaUwVstP+Mzovw04CY0e6ucHcNG8bkdAhiixaw1DGilwl8tfXo
1/LD/FGivkVY+qD5JIE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qZVOEd9Suj8PFYlAHZ5eNfv9g67bFY/Iau3fGJHFAIz/4EbdSAUDaGh/Aj5F/sayLnlRNhD6w+39
N7ODCROvgCW/DEQMBCPz7kcEchwyjzrqkhJexEv0Dz7kFQn1ftmdbnZ6SxsSg0bAUSqDETfwIrDN
VELNGURpq3DjO751fQLkz152JThZlONrPm6SqH+2yq0k/imlDMyhznvq+Up4EXiczfO25/APInqH
9ImfZSrqCiz3p7BNa9t1DtJtjx4nO4g/3qItwAhtZOzSyNgUZUJkS0OgYwLaNbOAMte1lEZ3aCj/
PtYFcVrRv6BV9zObKm5JRWmYYw/qLDjrN9AsCA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
PTqB7iZsvJeVQbxSYRkkEOB7dur2/Y+zWd7rSI4QgTOZZuY7cx4mymLcNTtY69vWs3+Ir6xtLuRI
kV9wRh0KJKuphJal6eQJChHGu6rp+AHyp8AyhIwGgID1vxyyu7xhU5nl4qM40fYe+ov2uBp5DVP0
GoOHS6Gilji9DRkCQuI=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nl92noyushAx6EnMgw3oSlb0lEtv202gnVMSNN83+NLaV5DJ/HimKQF470dvcnALDIl0xa3e3Dx2
/s2hBMgu9+fSioH4xbMFQTaBWMjBfDKLVgBkEfT5zBbn1LpjuMEnd/TVHxe/dqXJ8Ev1EIyVB5r3
7KAUvfDL8CretmawtvJtixs8bH8vAxLO4BUzVNbXDL44NeL/PffK31PA74odtZbSUGIq+Gf0nEXP
yEajhFawSXpK6M+iRpsuDwKHS/YxQldY5i8FGvVQrcrDBe3XAh+jjvxUqPhZBRChKpDSo0q7V9L4
JAZoQiGn28UrFoWwrxxP1gsv7sPdry3YTRu8DA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KbhPmoTx5e7VcsW2JDC/J/bcPlnz66gRyRCtg0E0qHv9wqViijoH+owrxv0IWMQoDBsXBaeQm2xz
nHRZDc5s+B+JlzwwZQGB8pQM3sXMmxGcH+jeVqy6X8gKOEQFgnIK2FJlAjHpfO0xmJkl3wxWImNr
ADPNoWEMdruR5ksSgKexng6J3lkv4vPYoEvCF+Jq91pp71EIJgPtwlY833cs1Exi28xe2Qo/nzU7
oEFG5gySNEidQa25q1QrCDnSmj7j5wDJg5xzjXYmwWk9873dPWyEXdpFMqjxovIcyph/uXidS1PQ
XxFetrAMjtseoYWmz4Lm4f+rpe89PGRhWXsiZw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
u7x25sjZWe79yzU52TdAK1EHhzoxhg0OOXYOwTp455Bu78gqkmKRv90VNHoa9foKyQc+Ui9ovV+f
Mu2Crcme1IbP51J6eQdKys/57qJrcFCxGtJs1Tw7KJ7NffFwkytoqR7pgvmtIH6+qncA8b3aZTLq
uwD9bGF9UFZVZ2XBc83+LRU+GZnNMHOa4eegWtueYHh1zUhGju1xbiGWuhliZ58pcNp6gCDiDv+p
GdiwFDT5RDj1bjrkOecRL2fvOdGLrhdqiTh7mvJeDStjjXiovaCdny21gVHf+dzrpyPE2xGgBinA
czj0D2pyt8plttBhpmMBtLm7Yegb1rHiA1UC4Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ax8Nn3y8qIY97tYqs/w6/65Cp2CG+WRyi20ND2JmdKrfZukanonYYzlNsDdtoOeMZdG6gzVR279V
Et2Qz8YBLQmhBZMJ13mNxEOwpSUbc5lUbLJ9CQ+4u6jvStTDzX+odxkCCqHG8GJhSSFPGX+Z3VZc
TdU/OWddzxwk6JO1tiPn+qt2Q8nMj3Ulh7gqAxPMp0gosh6z+Kx5ZXSuVE/EPNyUDXjRSXjnWPwN
NnM94gbzG23dPqFIOG6f2m5ugBmUUghvI75DFpM7vJkXsEWAfZeOV351MLISR26yMaWxONCdGWTQ
DW1hvUkse+kVt5BxF8ft6CnT7VchA/flFKvfPg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
e/Ry1l/vqJFJqrtAPFKKjxxp0MWhiORDa7WOuKdNY7LaztvYcFdzfNmZDmSuTrj2jPF7WDL6uDC8
FMboEovqCHZ9s014f2WS+jYxvraqlkgyGQ1Q7gAZ6yaBsdSi2RgWdbpy++ECpfVjq8/sYcJl+CZl
ZIsOc7C4BTFh3wysjt9r3cLq/k/dOO8xw2ZAarjqRzjr0h9T3TEzowI/jWVIqkEICEpCsA6k6h2U
oRuVQxQmdtSXmU/Zm/g8I4dj6axYw/zYpYJe2v9s4sy3NCBf/p+z3JFoReqcGYtminQ5ba3zzR5v
mVNiXw+YtQVCe0IsGLqjaEBWcXrs5SNFVYKce0xzBupVSQ0hP5cTBMtcToem7n2nM+9LdhZqlPBl
KimcvX+KrlUbox8H49P1OzL0A8+Eterrfdy0jE2DF+YuIuSAnudKM11WtjqK5yq8zJk5JOHQUQZl
qO7dmmZT95FjGPG/jqS+uYlHdZCNNyQ2l2SbVZw7NPkIJGq5bAKeGsSg

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OqTG2QUdaSjYwH6PeUiMov3bCDPXiUvE4U1Z/Vd7xbPVo7tNNwQeTcXKi/ZUR5G1tkEs1OoxIqaH
ytImL/6Ro6liEE5oT3otxdQb1Yz3ukWdnhQpgw3O2DRb5K1R4L7p5QCVIgq+/7f4oNn8VSJ1hT7o
jVMeT5IvgkJXZsqX/2c86iOEUQ/Xha6SVw6W50dS1u8Q/FzR54WBSo0MFMxZWh5Pyf5qnBJKna0d
nVdDHDBFDajINOk8j7Oonu6ynHrhNkyo1IEnNv/ZQPbHo2aynI/MIaO/5etmCQO2m+53okz5H7pu
RWYkE0zXoE1v6jl/QhZyc23SZppXzWGhd1zsRw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2352)
`pragma protect data_block
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
TeAFH8odCriEUfUUfkbx
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
eFbqyWxvTxgrA/YtdaoI20/0Oxv6heWR3Rkp9/xOWnvLDdGDhtGJBQqdO4v1RO/kikveHE3JyVBx
OMXM/QBYbcn/QmEMFud4drsy8IbaUwVstP+Mzovw04CY0e6ucHcNG8bkdAhiixaw1DGilwl8tfXo
1/LD/FGivkVY+qD5JIE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qZVOEd9Suj8PFYlAHZ5eNfv9g67bFY/Iau3fGJHFAIz/4EbdSAUDaGh/Aj5F/sayLnlRNhD6w+39
N7ODCROvgCW/DEQMBCPz7kcEchwyjzrqkhJexEv0Dz7kFQn1ftmdbnZ6SxsSg0bAUSqDETfwIrDN
VELNGURpq3DjO751fQLkz152JThZlONrPm6SqH+2yq0k/imlDMyhznvq+Up4EXiczfO25/APInqH
9ImfZSrqCiz3p7BNa9t1DtJtjx4nO4g/3qItwAhtZOzSyNgUZUJkS0OgYwLaNbOAMte1lEZ3aCj/
PtYFcVrRv6BV9zObKm5JRWmYYw/qLDjrN9AsCA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
PTqB7iZsvJeVQbxSYRkkEOB7dur2/Y+zWd7rSI4QgTOZZuY7cx4mymLcNTtY69vWs3+Ir6xtLuRI
kV9wRh0KJKuphJal6eQJChHGu6rp+AHyp8AyhIwGgID1vxyyu7xhU5nl4qM40fYe+ov2uBp5DVP0
GoOHS6Gilji9DRkCQuI=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nl92noyushAx6EnMgw3oSlb0lEtv202gnVMSNN83+NLaV5DJ/HimKQF470dvcnALDIl0xa3e3Dx2
/s2hBMgu9+fSioH4xbMFQTaBWMjBfDKLVgBkEfT5zBbn1LpjuMEnd/TVHxe/dqXJ8Ev1EIyVB5r3
7KAUvfDL8CretmawtvJtixs8bH8vAxLO4BUzVNbXDL44NeL/PffK31PA74odtZbSUGIq+Gf0nEXP
yEajhFawSXpK6M+iRpsuDwKHS/YxQldY5i8FGvVQrcrDBe3XAh+jjvxUqPhZBRChKpDSo0q7V9L4
JAZoQiGn28UrFoWwrxxP1gsv7sPdry3YTRu8DA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KbhPmoTx5e7VcsW2JDC/J/bcPlnz66gRyRCtg0E0qHv9wqViijoH+owrxv0IWMQoDBsXBaeQm2xz
nHRZDc5s+B+JlzwwZQGB8pQM3sXMmxGcH+jeVqy6X8gKOEQFgnIK2FJlAjHpfO0xmJkl3wxWImNr
ADPNoWEMdruR5ksSgKexng6J3lkv4vPYoEvCF+Jq91pp71EIJgPtwlY833cs1Exi28xe2Qo/nzU7
oEFG5gySNEidQa25q1QrCDnSmj7j5wDJg5xzjXYmwWk9873dPWyEXdpFMqjxovIcyph/uXidS1PQ
XxFetrAMjtseoYWmz4Lm4f+rpe89PGRhWXsiZw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
u7x25sjZWe79yzU52TdAK1EHhzoxhg0OOXYOwTp455Bu78gqkmKRv90VNHoa9foKyQc+Ui9ovV+f
Mu2Crcme1IbP51J6eQdKys/57qJrcFCxGtJs1Tw7KJ7NffFwkytoqR7pgvmtIH6+qncA8b3aZTLq
uwD9bGF9UFZVZ2XBc83+LRU+GZnNMHOa4eegWtueYHh1zUhGju1xbiGWuhliZ58pcNp6gCDiDv+p
GdiwFDT5RDj1bjrkOecRL2fvOdGLrhdqiTh7mvJeDStjjXiovaCdny21gVHf+dzrpyPE2xGgBinA
czj0D2pyt8plttBhpmMBtLm7Yegb1rHiA1UC4Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ax8Nn3y8qIY97tYqs/w6/65Cp2CG+WRyi20ND2JmdKrfZukanonYYzlNsDdtoOeMZdG6gzVR279V
Et2Qz8YBLQmhBZMJ13mNxEOwpSUbc5lUbLJ9CQ+4u6jvStTDzX+odxkCCqHG8GJhSSFPGX+Z3VZc
TdU/OWddzxwk6JO1tiPn+qt2Q8nMj3Ulh7gqAxPMp0gosh6z+Kx5ZXSuVE/EPNyUDXjRSXjnWPwN
NnM94gbzG23dPqFIOG6f2m5ugBmUUghvI75DFpM7vJkXsEWAfZeOV351MLISR26yMaWxONCdGWTQ
DW1hvUkse+kVt5BxF8ft6CnT7VchA/flFKvfPg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
e/Ry1l/vqJFJqrtAPFKKjxxp0MWhiORDa7WOuKdNY7LaztvYcFdzfNmZDmSuTrj2jPF7WDL6uDC8
FMboEovqCHZ9s014f2WS+jYxvraqlkgyGQ1Q7gAZ6yaBsdSi2RgWdbpy++ECpfVjq8/sYcJl+CZl
ZIsOc7C4BTFh3wysjt9r3cLq/k/dOO8xw2ZAarjqRzjr0h9T3TEzowI/jWVIqkEICEpCsA6k6h2U
oRuVQxQmdtSXmU/Zm/g8I4dj6axYw/zYpYJe2v9s4sy3NCBf/p+z3JFoReqcGYtminQ5ba3zzR5v
mVNiXw+YtQVCe0IsGLqjaEBWcXrs5SNFVYKce0xzBupVSQ0hP5cTBMtcToem7n2nM+9LdhZqlPBl
KimcvX+KrlUbox8H49P1OzL0A8+Eterrfdy0jE2DF+YuIuSAnudKM11WtjqK5yq8zJk5JOHQUQZl
qO7dmmZT95FjGPG/jqS+uYlHdZCNNyQ2l2SbVZw7NPkIJGq5bAKeGsSg

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OqTG2QUdaSjYwH6PeUiMov3bCDPXiUvE4U1Z/Vd7xbPVo7tNNwQeTcXKi/ZUR5G1tkEs1OoxIqaH
ytImL/6Ro6liEE5oT3otxdQb1Yz3ukWdnhQpgw3O2DRb5K1R4L7p5QCVIgq+/7f4oNn8VSJ1hT7o
jVMeT5IvgkJXZsqX/2c86iOEUQ/Xha6SVw6W50dS1u8Q/FzR54WBSo0MFMxZWh5Pyf5qnBJKna0d
nVdDHDBFDajINOk8j7Oonu6ynHrhNkyo1IEnNv/ZQPbHo2aynI/MIaO/5etmCQO2m+53okz5H7pu
RWYkE0zXoE1v6jl/QhZyc23SZppXzWGhd1zsRw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SO6s1dzpGs1ydOUA8qj8lHlEhVYNKPLjgLf8H4v2eXWm3V9RjVxuSaj+Irs+nk99FVLDWMojM9JZ
WbSsK0mjpBTwzNqKQcDdTFLKjrRGPTgmyV+ID/wtS6IsFTezIBGE8Cz4nCHQWh4g+xsYMkt/9DdZ
vr9yU5wZCzvnCXXrU8O8bUNv90hpt3WR4ozbtrt+w2JlFqGkrmCECZQyNCUG0AdJ7LiwpMor9LKs
FOYrA59rQnT8EoqVkaKOidkejJHW0rtJD27RlhnPubo0GuRaTy2kabEYBCBsRm2/hZWJ0nhJ+GtG
qCiqmFIhFsECf7VqaZw+tDfYFipqvAfzkplGyg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tWVWDtfD5Jeqg27Z9GjOaAHd8Z37X9KxQVxqUP+uMweXjuZp2vJ1ZZpwl6v/8qZkSW5SAPsrAl9T
euxevbkxzAgU/EfZ9zv7ausLwRM7SGaGZNQfoxLU2Iingz+zli54fDmu7KWBlh9PfzNwEyNbNVWC
XKw04VXB8dbzBjeUNt6oMNYbIEADaKeqb+A3vp+F2Ge9u0qQ896FlWXchfJsvSYMVSAdK1qXN86e
qRJctKzbgnZ5qkfXVYnxPtQfTWBH6rf+9yX3k/pddEKHPwgX885F3Axn0fN/X2Qij0iBFsl2BXhM
qpVrJ3wylkhSxijkmbmQn/nnsdJUzE7mnF20nw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11808)
`pragma protect data_block
MWidQ1PA6yaUcmnj3+PPj5ZGlEQ7WCctN7HtXDLOXHFIAsE6FCBVyIi+SwdUIHon20/p+d+qhbnu
qmwtnWN7uUeZl3rxuCAmhX/zjW91uMGrw/bgFnIyxaTCxbocV9M59CoGl1RFLEOU3+fLLBlaD41E
0Mq2RZUvF2ohhs38EBEbgEI9rq+naGNxlqkvXY2x0R1Yr0Kg9SA/QzTOorgpNfYAkLtb7d1Uw6MJ
vfc829D56xmDyUcv8Z3DUI8SxozStiDOaGWejNxrz93xLQhmyCEU/mEem5K0s8+AWh+i/SJcTuJA
YtG+7f0L7XVRKYKJtjOXC4F/y00+nvsNjnd4smkNg5xreot8cuL+Z48rFzPpIOuAXjC+Le/362ja
ASEOA2QMkkGWBEzQWYzdvlV8uzI0PwldeG6N4FMhcaG0Ex7BVgPEOafDL62koOnLY2PzuMTzYs0R
JCIWRSmYNHxDsdKsYILbwXvidNqzRp6nt9yF0iFZMIuKfsx0So7As2PABA5qzIo9p4W01FyL8X5Q
vnDZ8tMKQfCk9a4PnrRYu4u1wdPvciMH1jB/tx2su+h8HLaHVAA0nr6cPdWNalxIfS7TEriJpVcd
eCz4/OokBrvB11Dk95h3YKqC6LMf+5ddz3CrzgUSZI6P2GFwNHryjSL6ZGDmbDCySAsp66MZpHot
JcCOb1khQj5EZyHdX+V/spVHPm/X6gnnSquCcD3PxSze3hqkvjOUN6ghPCUkh5wHFH/oO/8OtDbY
gU6HtR5bDQGT0jPLAgfe5buxBfesJH04DjdFgRx8j54pyhU1jjiRJjZ86N9YW0AhU4gTptM+EGuA
BN4LgU4/rZiutyDDcgbt3ltNuqbHQjBNKzMpptFfID+Tb5oWcEa40qh7Iq8SK6xhzr70muAtFp5N
437kCra0xMdlFtj1yawvqu0Itw3KFkdNODLV7LdQ5ha+bW2JajSkxrcLyMOBCxBOTOzrb+zxnh0Q
8fVF3wkYZkdikOdRs0/uyMl0yk3TuU60+G6vLojzcH0/Vhrm81lTnJvKO3MhA28wpxypZeY0M2/O
qL1D6sfSMJalaPr5EAPh8Gs2qoSsmKztJi+Ebna4FidS7oBKDeiftpuKYuLkmLnKtOLs6zCT58a2
FgKhKFHcTcG1kFGA+IA3HX/dUJ2i/xNpR/+3gtjkIh6D2sHnC11lrlgLwCmNFQPYruBsrbD/uLYX
gctSHYkFds5jP24ViIE3NhVt+x8pjB1WCYB/b8BGlC+GiA70DhMKm9LRWGMme+xLQ6zhsXj7y7sB
0RSNWD4L/CfNWeUeTS7MH4iqZuJzcZH4vK5vHfpWHtkuqSoDM+1rT0w387lNEIhJ95Ih7p+g0HV6
U3ybWChs0U3XzkiAm9glIO8XXK3jdBgwUzr/XU4QUuosFzdaptqRDFqdkyOzq7Y6aLRi67QLxSKX
/hMR5xbVY1Y8UM5BigznNEyjg3CN/9xf6LDFGqanAuYRvnjgqikcWyoC0pkXEb6kVKozPOhI8BAb
8oYDH4IisZt5UVr/JE7x5j1V6oOFhBu/6+OAOrZbpY3I2NGf2NWC0T1HjRgEjyUplK1EnIYjBSQh
GeG8OtXn3zm3jWlbASTFVgK8sFz1dKJWJlI8XxuXWaMkWYTkY1HWYTnIV7X63bjvjlwGeWCz/fhS
DexKtmwh4gAZ82bxQXjueGWv3tj2RKfEGgQ/7EqJEbQg2xMAFz36W7DwOvpUhErD/0XdHxurh6DC
+AGzEsT+u/HYodopypyEg9XCik4kK5+eswcb+uY2a0Ba8lc0jwNJ7PIIvjsKE3hFeboh3d4fyH1L
qiW0z4uLfI/8RbDBSoLn8dcQtYgp5frngOfe2evhkvT6Dix5M1ztop7DQfZuG5sYIBfx4RrtZmRb
mgGmazvxzYcuzpfjuty3K1kxzzqV3QxRrtwSwztQ1N7mMXBUg/F34KxWmzf4XPMcynYPMpHVnhHF
ISnc8+eZkjkBs7iPWU0hhVaVxXqSwYkgfY1+b2rOrluz5Q16Ixus6aXhKBV54QObjbZLDG0Pybri
OjKdLLXiGFoGc6fg5HU1i+jf8mP6JDjuJ9xwChKawC1RFelAi3sAE7AVCFpHcsRGWlpyzGuEDDW9
RRdodNhxdA9IfDiG9xoydYc5KPfm6AJsOVz2fi1HocpW6pb3Ae84Cwi4QBX35p4pcJCxCAKPZ++m
7blBG9WUAch5cRG9sRZJVjs0yq2mP0YvQIsmu7Rz6QmkFgcH83vH03M+Pm5IaaC6YTwLY+Cda2kF
tI969O2KK4s+Z9VvS5fefNFuuoNqzGLHnvA+apCDnoqK0ue5/4UQgPfJatEkNdu8DIRJ7X+tS85c
X236pHri5FfgeNb978cInFNDWKJ1bjSMaeQwbxXE6ifOlM0JFuTBORJWzBf7lT6AIrg3EfgSsZA8
vyi1VgZlyGrOCvL+ZmtA809nkZGq5MFloCjKBBdV2sg559EfDjLLrTHplzm0SQzVUgSlAhzM5NMv
ItfKoCcHbFSvu2YCluqowHUIBJLlWfKNHjaa3IXD5mPmXbVgY1Gx1lxsRbzMF4B5kETuJPsHCTVG
MOj2b1e9IovzVSOEhgJsNAp6uc2BTYumo0pFf5yx5cN5DTYwN5IUULhhgCajx/FzgE7JsclgU8IS
OSso/mVJo3/zo0pLTJgI7zXU7dOVJi14vTKl7VbjNAWuQAeiZ0SROnLrnvVVI+aQjj0NWtoR4UKm
NCdI4hz8+Z/6xrO01CRcZnM+r1hKsx0v1yRQ5OzDDGsLjOPFu8z4CfuoZZFV5Mbjb1bbWj12cjz5
kYNL3Q/P40XkpSugE7T1gd7GS2dYi4LPETM/TeCIFEii95x7CQwaU/pth4Da7m/0fiSubYvH2HhP
A/a98Vgnw/nu2Wc0WJjldBzNs4IQcFUr+x3VpfUzBhDBNzp0IgDo8nDvGfNvRStYHUMUNH9CYHPw
gWpQlzc340BzcJ0PnD+aDPqqwdz/cAgTVYYrzC5PlnNwBO8KKQfra+8egK0zfEqdraC39LhT8NnP
+EJWMIn2/U88CxsyeBjo1JRlxHXxjechDmBDXPozIK37y6s4RfOad7kegwPM0QXF+MBQRZ306KD1
3fgvPyLdDO9Hiq8+qac7cmfZzGdEEd4U/cJ+zBsyhFIb81GiSL8G+qGpHQ5P9QCO0cDQ2FXr7+Mi
Au7mETrYLIq8yxLJJ1q0veCHsrvcE7jvZj2gtRDETSQymbX/7w6bLu7caJaEhYNJE/O/NjyBGf21
wnIq7/Svmx5L3W1m3MnypgnYankXL6Wa12RiMtaFHs82RWe6eG2d2bVJIwEYbbjhmoPz0yuUKKvW
C37vmw5frIj9KeD2FmGn3zduc2ObroHe75tj60AIw2k5MUKpvUhOsoFLg7d8yYd3mBEdIeqGG2nr
5cX7ar3xI4IjQ2qarBbgT/IEoYb/mTrXmHpB/LQrZng3vF8n/r+SpVjlI5DDz0iZy8aif3UgocBU
R7a5dQrNdFU+tVdGTMc9Nc7vHhdcOKj9Ea1rtsxA8j38e6yX36k6E9KlbRd1WwYrdXgRvpbCYU6o
DKzxpLG6x3EC4pkMvw74rvMc7d+jgiKZUf8ahO4S+Kiu+BGu851J9Rjhi+eGgxP2DP4I2wXI2iuq
a+Mjm9OZQCJjaCExAqeug/QVSvTql42dM68MoKmRgeBj48v5wJZSCu1OSrYTm9fNxnOFm1RfA9Op
OGd+hBcbQgbnEbUTnMA26+gk70Np0C/8yOyayTaJztP8MdCwcOOm3GaA/Ml37dQ7K3rJXIsTZCOd
OPu48LJyfRq9uBXAOzHBSegSeT3kjh0FIRSngT1Z5Ynztg1Vig3Ythj4/0th+LJXo1dOSzzlMcUJ
ovfFh70E1PEn0iw5aWoM3fq3Iw8WGYfNq/St+XahTUotlpcPFCqPCQTVcd2Y/TXKj2Y/Js7Goco9
YH4sgihOiQ/tgIr3G2OzYIdc8XoMCqZHLKa1M3fJ5g8gwWLa0iz+qsGJouJ/WhbKcR1mtCRH1WRZ
GEDl70rcinm30D7Yz3igep35nyHelkKGwLJFU8aPdM3/4PzSAsc5KIZg4fVPV2y9R4hxiRofT0//
jhpUMpwfnliIxTsP22guDLqmvopXM9kGnu9O3bkCt7M8l+voggSyd+kT5dF8h0J/Dwd7EH6stVss
thoHMh2n41gPMA9w81g0g/LMrFXuqSWxpvunoMTMCzfQx4GnmRdFYtLDKESGV70nzQqj7kn5GPLG
u4NbV5BkW5UYc20603wyePW01NhFQxQrONtW9vYXAgxOUmEK2STcGQV0mmMmO9ACh8UMLkaJsBBO
mncGuN/+w+PuO9UXyx59oUt2Z9b2hjSHSODgjdw8IzrZMLhO5bZPw+3dJnluaTvh/hTZk2GTwaIF
YROG5Zn3eriqjHENtEP49MjSSRH72w8GRO2e3P+gqx6YH6vYVZSDsUcM5bDGBVR8LyRjOq9D12TC
WzmoLmQzRHUAB3/FAHAa2lmp6htk/wy8xLMxslV/KOQmpnIB9CvUTr0eQolVFx/xzy2BbhARoV3z
XlKXgRaWd6lsX1E6tFk36ax4lhTqveRU7GXOIKAzozrHNxWRrH6yABBQl/scZLFhwJVWBRcSJHKa
fDQl/v+8fUNPSCusGtPmRfob9dNG0fCj+LM8a1VeBC35e/Db9x8LDItjLdzQmjpP2xp4J3feilA6
qhnu0PHE05mbxwTK41rRBG9aMG82Ev43XgRhQc0HlH7aIBjhDi+dg37pyOYlOe59iJIb7wtqhNoC
80rNiTtGIdTWzNadhq7VtWHq7kqEmSC4957VWc19LP6x0wmx+NywibUepxVvsgED/Z0J9wPiKbhq
D7Qxmqkyr7lBB2bNl5CjLSzE5qngsfFagjf8Gq6zoiBmkB1GQAPv+7REvgClY/DODVkrNKL0B6Hr
6U2Y5A1Wi2Kol2FKj2iUx77ifXiXRnE114lGy5ubGy439jtUFSnmriWy6X/492xa1OH2VcKJzF+n
TaU0jG7Gz/io2H7MXw2brPEiXa9xe5eBWPi0kYyhsMtOTyv4fNRxb/i2gyH+yoEVGDKp5ftCSguo
+bGIZRmt3HeYfojNRaKscZCaE497Z44b9eKCXYqdqikC/uwrcji5bJOnTjQELZwiCoC5N1Avo+G8
3iWLWjTOZ9QrvAPXE19Ng93mYppHI5t6ExhNACHuIa/kCR7wCGzK4nnPmhC9eI/I3VlPbIQUta6K
N1OIZxrMKSpkjhKF+GU1PEF43VugAWakudc+PO1aU0FRd0q7LguLFACo/S5TNb/VkGEdHfuiX8xi
QvC2xcDxHPb5Rh+o9aS5Owu7g4EG7ekwKhiLRsggVU0mtdIwPzid5rgMAc40LF9t72hEvPxxRq0w
5SsJz9twUG4z1WO4+tnYhR9TwJf+hKqykP7OunLabmlZSq549zD8yn+QKsKbgt1mOTCZKq5PNnCe
O/ZIgTOwbLoCAY5ffRBMoPf0WTCK4drTNxO4nZEuBTXU3CtzShGD0kTcqTy7FFYz1R/TWdU3Gn3B
b9+sLxfD7DhaeEfEG0+6Mg6CndaF86seY/JPWXrVz1c9VC49Oy4l8jceaqlqaE/+23OYgZjfP6AH
Wg3giMVTkOQF34DpOjLDtVsKlVgKGj0Rr/PjtiXWgNbAmCra8BdPy7o8/oBd9TqOyUo0m90OyQ3V
knY3E+MroXjyU/xu369Yi3ZcvzMcvY6QCHqBHE0/kfYo93YbnzMccOCxe4orZIUyRwAeNEXq77Cv
LiOvPsolPylSsX7eFcXn4nlzMqCYfr6mS3pZn+u4aZ37hCLO2FE/FHvh3vXwni8egm98dCp7Z5KT
vkLJoNC6Ggwc1THNtb23HKdhPnYR6UbdU4rHyfSEN428LLs6cOoA0zRlnQ1zYuj5dGPWjaRYV/l3
5bucZPibY2mIshKd9CzyvdpI0xdw/oXO28nixMuG9lfOeU42Uw/NBKQGHjPJZd7maatoBTwaBwX0
Bj6eLi8VTx75uYTaSvfbPxGJr0aGSCqnIuU0hZbtQFHUxHm59qSvJ0tAoBg5+Eu/5mDqhVdn0rJ/
H2KnSgg1ht74dn2GXPCDrFciUuE4Zy8sByKb3WNSob37NVUbPbnK/ze+Yrlo8BlX62PoJ5iSKiVL
rv3Vq/ei38Qs8FJwOXWnig9mQ+Yph/hDA53uhv2oHQqGkX/OZj0gU+IleJHFX8QnE8KoiX2U3rcv
Wt7baAFG5PVNewTn+KaCDVWsuM3ckqIKJqmc7S/iApChPEoDArtbSFkDtsqDP5zQyVsIgrTxTJfU
73TMcGk7Q1l+dyWsVfxwPDqy1VAc3Y9Z4hxnHJwC78Xd/DEmuc9dq1oSe4YtDq5iNz1pLEJhnpWf
A8tm4809tWwxzTiw+lg+HhsqyRK7jZefKIyqENS7d+NMv8WWls+g56PVhi0toPVJug67MeykQQn0
iU+vH+5jCvq13Kj662g91vwKrjayl6/IxMhbt/lB29zKjP+saSDCfrkOQaWrkuHk6cK2rKB867y2
RYPKNh+qLlXvlnbtz6oAJ7HMRnSnBxz1H7ejtsrnfoSHsmuXiPJAx/aTiuMCCyIWTRjPAQUiDyau
3GyTwPAVs5f5I418d9GDNSudW/zRROF6BDGVOokHokF2b+kM9bMFgP6QqiqRPEjIrXqXMUw3+ePa
dmCavj9eJ2XlHZquGFFc1k13AzAHTVN5agI/SWv1m7i2GU4SL+g7FAbSH6TXfSGrHbLWnJrZD8f6
37NBVpMo//54yWobQiuu2+Oay10N7mp/giyjWDswU+lyjbV0s6vLdq0OQcIkzLDw5nYuMazaBBm/
ZqoifN32WBsYl9CcWnY3nNewiY3I9ydKGbBeQZ6Ffyt7jpmxCAsm9vktPsvLfLfPY5YFOLrcCBNS
BAMYRDXnRuux9F3QFnd/DwYCHFgV0TUShAyFg09YeW14Qxq+jfKo7M/Jd/o1j53yxFO9KoNsYM2O
mmBdDs+PcNk6+1KM/VSaBt6sSD9Srk33w4DHqywerOM1EVZARnWP4viUTM41BsAq8TnLCrtiWxUR
3b+vemYZyaFcgk174xuyEBforehX+YPnGSRDEFkcQzNne2ly9UbBnhBqb/u4VwlNj1rbBgdQnp8U
234TR7zZ8XuqSz8ie/b/Iijj4aPIAYyJOufW926uxV3UXEX6XKOV3K6/gJajvikRuGkLZQBuzlHE
+5QbA9rKxXq2LX8O4Mnu4IZRYtjC7WbjqU7kZvSAG9NhIECOG3TSe7vpgjMMqqxz6jCpni8raIt/
lJRmWrj9v+q5YdLlyKEldwl8wJ08U2PBOKvwVyitFQ5hMHb/AoCWnptxq88MFXo5z9UazILeQOhw
6dns9h5JJPjqzLIkmA2kRWWj44Na9ISIHNdxIfppz+5gHJl0qbhfUCSV0JNML86SmdUw32Lm8Ep5
zMB5DHlW0KFPpu3z3sixmopIM9J8gFxTYjD9lJMDq47hjoeVQPnVBuTU2R4JWVfrkSGF4yNeKvaq
9E8Njjp4fOdpaLO0axYvCkATrunnyWjahj5R8LF5Qhokvvzo99rvWY0mVdO6c+MxhE6zwgO48Qjj
bF/1L2Jy3Nj7nr4F9poS0ofjiay66PipCY9sbFci7aZziZdOAq9Na+YYZxIK4j0SmWgAE0ZPLKJ9
wpluPYpuRiEj/PCzNrHWkrOuHGJEef+75SHG3NB1ZO6+Ji84XhlD2DWlszHeI8C7Y8SaGOfPGBOI
VS0S5EDCP0RFsfL5dskmBfZ/qjTHUDHBZYf6opksVqKIDIHha+s7XxO53AMgkuBBBSEz+IFk5QfD
V4fUJeHdwDNQtg++BIdjXhFvYHnoz2BAD1bPeSM8oroT0FMbp7tlvWzZY2ciJgztalHeRpNdwRig
jzXCrkfxZLOaCi+rg73fngML4+I6ESwRg8upM9XYQTOUmnXySjBzkiHGrv0OWP/LXjjzzzs5IoML
nzDzx+DzFnkO5J93Xb2RUElsG1modqWaPTMOhsU7N2IAQKmAuPOl6Y1L7N6Gr8sotPw+9wi5PoMy
r9JVxH7R7eCd5/nixPIyAxBtYT8oln2ARH1kbDpvJj+tZwJDbGZTckkjVoDwNw+u7CIGUdQMgmn2
cSPtNuhMimN8wvWIrY5O2PDsd61FDIkyv2mEguwWTK6oPCbeAyptHemo9DtwPFhOZWgYlQ9qAWov
vAFBpMMk3q+Wy/cxU1xLDR2xadqUqoQwlDZm/omsA+M4Y7kNnCzZ4F92MnWWWMn1aJ0VvBT7qk8Q
XyUFNAarl2adnAcJ7TomFQfnhbZj7c675Lcq0iNwmpFdkq/l3YekPEqs/at6EaNeoxWJ2do1S/6T
vqiSivQKJUi80kKTKDGRnRf3IbgY6qXGDf8ZsuNN8JSnKS8cv+jY9vrv6WZIv5RPLDtxSSYWjErP
B4hqc9XKxbBlumuedPtTK7IqWyYrsqBfM+MeU4uhNqh2jNJ4MV2uc4YCWkIYXrKXcfoH8k4zAR3/
KdE67YKm22Vrq5JruRbPviaEFfPAx2O/ew4DA4TAtXu88ZnF/PATovAPVEYr84ww0Ia1Q5KteOos
qAtvOuPZxUPA1HKRt4FFrCDHrVndSEPk8nhLoFuo6gSIVSMDv+f0GkDTOSwARD1vEQlQQC9dvVYQ
d/J+QZup2/HoHGqg+et8wr+mZKLnnJ+Lt69lg9QtgRe2UbjN2d3TPRIE81Z/htnPRqY8GADClfHV
1p58eBMJdvS8rflyi3OcFr11KCDHIkA34ouZ7MdL5Tgxa+R+JAGkAfwvcodrlpPRHjZ2jkb3tSAJ
8fyafbDeUQPH9PyU3cHoTsCUBaayQYaikZmKPlBrkgoqyjdO1+9DdvTyl0RY11SLhfppR4N3o4DG
LeH5WnUMIqmDIuwBf7yb2IEuzOS3TRUDnmhh6d/Y8oAN09yQb/YFo1cuN/uol9dvS38TMLA+OkG2
YMNM8Zcd18ytLIFZtWCrSpZrApQ6xM/pSArsmA8fiqOwqo+E1kHvyg/H3a4CVNArSLaAQmxALRfu
Rgn+BFifehOf8gix+4eo/YHHwkvSTOyRxGHb0eU0dPlW2SLvciXY465wDkDhGXeGbY+GK0au4QEa
I/eVMPUNbTkWoueJj6PkDKAmtcXxMuJkBuzAlaYzNbpJ6hTyFGd/HVJFe306lErgvhccHu5vTnTx
oSkM2w7hy+zewDBvHokssxtSHw3qmrOqr8o89ViOsoyCrrRHfD1HkFENS/3FAFmVN3KxPGvrjEMH
ozRGco/m01ZWOnKnXOn1FSsMCt6oj+AWOx4q9YIucmBDvt1Kjpv8Y1XuTPD7XBtwftPSuPOKFqLo
G4rDy1+CSYzEMBS+Bvr+m1VL5Kn2wo4mBp2BMoSps3TwY5IhYqepf6eXaQ1h0+wdhS9wpWBXtBh3
vpAy+URY/rMssNjzai+cV9hI0ExksTc2UXbNG/2o3YTrbEQ2qqHt77Eu8InRJG3j9vcv7jLe60sp
eFNOkYhYjUDzN+SOkMYlOtJunRqASMRVgttfXjkadrO9OIF3HDkj7HHZLrSx4C/rhFKKny8ScRo8
5QiGtS31LQswcdajbbi3aMhWtLSGFVs/thBGzUdIOabTg12fHG7T5sB6MI8qKuYZVcslOVAH5GGf
Fpu6TkrDAIey1xbheP+DEueBEw7XsM/ozWAOt5+r2oUFW0XAgSA3PZK/tDWvd8xkoASN2FsYl2qX
5hmagcZiJB1shdw0Hj4K3lKd42xj472Uai0GTmHH2VBdZVUZ4OjM73yPClQxDf5j0ngmyFGgdbcL
JU2Va8+D+Rt4zE28ZhahzIZ6ZdznWa59HtUD3cq41Rn6mlRMzw/P6fCO5NazILVDmCaFIqRezPR/
FEm6Y+DStowHar03fTvz4/WxqquZQwJe1ZaAqjFvfZDbgCq3fROvbEGJ5m46GVOmgv0wKspAVwrQ
/p0s+An6h50Hap6Orujv6c3vRU0AclSwWPaWvBgV77FUXHKUROrVaFqKncdaEn1WTmTfh55tkrRc
EhWvkKRCisd/lrc9EmjusSs87iJYRFF583MATljqcYPdNPq94er3VTfgrXancHqNeyXCVcbFIMv3
GLznq08mE4Yr4OBFBkZ1kRYbhm9/ALVy8eSba0uU4np8GZkKa/GsfgmyEHvGLa+Qjw0CbzXnGAAI
L3cj+KtdeWMB4N98MnivaiXIHST1xxneT0VonOb3RHck/RqUTYvyJRiyzjt0FmYm5qoC8tJBNBM1
+o5Aq4nlqTdf1SbvwWhsBk3+6eMtnPF+rsoRfMSQITPDFgewGCAD53XLXJ/y4VyscrI2luZv7ufd
pjqfZHOjIrmOTP2m6QUIUP19cxWaUzaAqX1RRm41q4UlicceJPZ3mf+GYJoMS8NRqyDxvbP/IJK9
jdolQfGMKsAJGwHwC7r6G69Mll1Z3zYZQ4WQppg838ddJyRYqAAPylhUUWCjIl0Yfph1SyKAOkeS
LkrbN8IiETU0/O4QUxjnBNIwusyVA+Yj1dz+OOhzVcEyYorXm4su5YqmqtGUXmcLJh6Ib5C4gtnN
T3EegFQQZ3TVzq+7NLQQ4DCKmLxPr3xU71EauirHc7urMVxRkr7bKWtuSQ8ZPVmYcLVwNWKmiqNY
4+fXbJM6wTbIEgoXPc4zl1Yi0oxIC+UyMPu6E0qGmw5H4NPOlmvJfxZVLiTxYb1nsYWWI8tWayDW
Ed6mD+gsZWuRhG3GJMgjr1Vp43S+IfWhD5+XH4MhHN2yq5frn0Tcw2K0p7DNGSoMF0jtO0geurno
LI6axJUp2NfIv8S3trCd7GoLOJeyMmAOZyktJgntL+peKD9lesc3Q5Krfu0VlB2vHqKROkSeFv4D
87tw25soEgA/yuMWZr96sDBGwb1MwpWat+6OcY1Fk4fAFNIAuDebGJl9L3yrxVxI+b7XTH+k2hRa
dS7UQf9/tTS+kpke3GHjWUW0jr1gZEw+p7CdY9m5PuPGEIthJ8kk+y3svL1neK2bLMXEhQpxbXnP
O9RfdMXedizuf0RURUshOfkIwSk1eCMSooQgkwCw0GUNZZDgj59cSMObNETgdhTVw0c2cqngiVOg
cR/wBebXtsTg4C0HVc7jEaLuqW7GzQzXqVEu+3uD7OIaXCKDO5CtoLXUep+4Q+6w1bd7CrwTQcyU
dk3PCpxY3316dV9zahrI2OXo90zv3BbUxtf71WuCAJtx3/4LZsoLDFGclSelGYOaTADDxHz/4MgY
bgUO+vB85JgG4hXHdWeRP1xsZ/x/OwS94XJ0ONnv1CO+aGAnykNDguu3iPHrU3ebF9aaok0//iBb
wUoL42lgO/HYgs08AX+MMcRslmV+7RVq/v3FAVdZxZndGBdVKLrfvDtdwsSWnZJuvpEh+vj15I8A
f4kE4EVH1+zWRYe4np54tolpmkrjjk47adS3n/IzC9vodNmvxE0eKjXEH6wBGrismFsmOYLkMnjk
Voi1zJ6D+sFf1E3CMlFG0x4Bo7j3chWKTFAvNe5t10A9MvdVDiRXsjZ0IuycetVIxBRgv9yQ8HsK
ot0keF7SKcvraQzYMLguD78atQDLPIPm9d9xl90mv2UH33KtGIl/PSs1DNyzWL4u79mtYnJfIgnY
lHAH+F7qBQe91C8KOJLvSjJQIxa+A52uuBmprsKKMpqtouWdvVQqb4G+cDD6KPyPgkRfjtaetELm
af3zrcghcdcPlos3MKlgFqE0Ff0uxTKdUazTjPPeNt/TxJmL94zzHx0w+EpOHCYNHBk4lVpg5ttv
9vsV4CnOHa/GzL76kIvXIjQfHP4NiOffPC7nR2vBCOLaL7X/Izltp8ThwJvbN9oeX5HEpyovuSY5
jKrps9sf26lkLIYhNymTATs67bJjQSbdM+d4pAi/Ux70yhL+CKYwXThlMahb5Fs0yZZ+GnxOYPJT
outF+F2wjDS9Gmj+xon6zfdfVr2fKwqd4joVAQFdl+MxloMo7lDuJ91ZQFs3tvHHXCuk40AlHFFO
Bs5zGhfR2bnopXNQQI1FXVn9iwqQmbNWz4+osN428KnV+Pn+pY/PwRVLtI/VwMTk0lTwwgyjudhc
xdA9u4tb9d50pszLfwfhJSqyUYaM9kEewDnGbIsSSJMRD1UJJwkW8OJSmdYpCgFOgqjmxoJmVZ+c
sUgDIHfFYmiJd0aAQt8Egsbqb/UnpWUrMK8KI6XEeHlaMlhUJ6OxQewVepuo/b2mGv+KhFNdT+cc
spWsbmozm/JGWNz0pLCNUs8YDlH6rIieKna4OXC5yPlDblgkdnvq/ky818VxAL3FXIeaRxlHCabi
Qtxxu94BTisGfqBoWEvMgjqZIgxY/kaY2/LjN4LBzRzxXC26XBOnstSB/mlikNLs3Wp2J2LIq191
UDCwx4O/U3hIyOdCSwydGCVBHaperE5++YijE91gR//6rN4EkmHcVqkmnEnU4sF5ESQTXfjzsKwo
nHSNmTqVq0cjJA6ZMEYz2FRXkfiXCWEB4cAgX6cb6HIK6EvAWDg5GIE6+lx8Kfx1FY3BSZ/V48Sq
/euww0qYP6ZhaBS/Yayrt8NrhUA8NovGsN4ro0e183EiYss/FwE6Tj00D89zxtghmzSRCroff59W
CQ/zdyV6wGoe754V7Aql3tNoAe3Z7DSVi2Sbdq9DilaagXIy7vR12UFPNEuyHho8soi9+gtgKNjG
NBVaSG3AGYnSiXZt93qH9ROBW0P36kcUpqZqtaLtjGUh3qOHY/aMnBpK3qfJUumv+oz2huwxa34m
xFXQJwAreXH6tBWmk3/I4otlABUT1Trd1G6/7eNGFBeqq/Z7LQ3qUqZf9d/RR5b7AzttgXxTwUEZ
jHrxc73PeB1Uq6BeBkp/dDW43ORB/ne/zV7U/XpYWnr9lXAtH468Mxqic0kbQ4HNri97I/gleLXW
ZYpgtNU4JSVFeT1hygI1bWZVBrXHvjRu8FLYtAPQWFZFVn5BsGWsez7xlci4AW0yWUk4EFsu2FIi
dNhfn37Wj5RCXS23NFCMGFZwpiCJ2w5eSZX3vE+RCFRvUTcZc2Bc6IKOix75LvpZ7CHIVaMvLEsA
2wWOzq9YCrVt7aLCKuvdK09uY8/ky/vyJMT8vyq4/kKzUOhcBge4PzbdMXJqRqBrdEbbCdn111Wu
o1ABoyQr93JKZfia/KlQWArNE5UfIS8kaWs8KSD8voITswxoOGGwHlkDd84vhY5xl9RkAoaazjk0
cBDIn9L14xWWbaK9/KQCd4+sV5dsuRYXIbHolTHXsl2XDhjlpsH/x6aWxBlg219iQ/7cnithCqxw
DfxynwwS0m3Dk+6nXGnBzcXTViFLvQf/VOlcrOoCvXCb9OmkrOqAYfPpydfx477nUNXCxSpMWbi0
p7W3Gbs33MebbMVJ35UvL/FxMiV4tyd64tXiGjAf35QnFPMjs8aZ/05AK2tPlUjyfVsUGEnGZdr5
PmFBn3ULCGMkOklHvHi3Ii4x5Y+SHj0nz9X0CrGUAZcDmdOSQz8xgmi5CZYy7kgHeREovinMPmlx
qzqA/AWNFnLc6CPBV6mBr00h5yKSsPbc1vh9at08JaGNq6HeXuwnZPEUEIiVWi8EI5/N19lIkplH
a8y/Nla1PYVmsQlK9ZG0/0IkbsZx6+MJM0DF0j4Gu/oYRd8Z1/C+t/LX/OaSPD4xePWMYod69QPB
dPHoIMRoHgy0NbwZUi3M6jsLVDud8v9mA1ZCC23tjhNv5trGEY6eUhpfsDwUjla4oRBfrugn/w4m
RgHWSELbK2jrocD7fyTD0WD+4RK0YJMo6mz4jy0vGar4G0p2gZUAY1lAy4J4dagY03+YXXd+0e7o
r6WS76Bf6O7BJrDsj3alLM0/v1F1FFgwLRsCqWGJzFC4Tth4mF3IRLO6ZQJe4akXyda1qWCvUjyw
93/N8YQGnFyXTa2AtCT4LbTUf+0DVHKrESpYLQvsDegFEODHvItHEeryiT7n5d7TrmLIEqKQp27z
zNvZ2okNhtr14zAv/1rw7N5HqVBTQ3mgdiDCZnPKL1enkQonkLTU13+LwEjNqkxIvClR3+YE31o1
UPulHUbRZ+BOX8g2DNxG7ligDnIZ6VFDrtKNCg6SyhRcAyrCx0HJKDg68amqQplcoW9rT2NKSyaU
RrHoC6xqqlFGTlDBsT0TxzNne1oGpNNXN9+4UViFvxGGR+Bh6bk7kJJ7AT5x3z3rknuqZNAQ7g38
ZfqHQGPR60QJF67lYytix/BSNZm/eoxHHUAee7WkpdktSFqwr2H+ROyX5LxKIOIN5i5gpFgTgkt6
jOFHCUaIvrkj4QcCPJMOTWuNZFgI/Ilg9cF/93EAHcpxkJHag0dWa8U1I5/3PrzBz7dz88P40H+6
DOC95YgL66vIejM2qGMypmqQXvvBh9OGFKYmtwzMChQTOF4q1yFbo+xEg7AUE2RXCavC0Y5sKlRZ
GQj0KSfC//+hjn5UeuuaBcgBCXrBVnCgP3Zw4E1G0mPvvqZ14XnIWOe8+vpM3zjzBNVt8T8TxFWZ
SE2YJoMbYnLEc+qtU7NBXySq38//D4JUSbPItrKwz4AqaFfWJPUxtsb5AQkjtOGanbd5F26MeT5v
ktd4gSvELLbnaozoz2+HcbTNcc+ROZsLwuW5gczzqcPZ7SyyjPQkpAOC1eWnc34uAJZ+9XYrZK6D
2poGAuJLbVxp59mFSbBc0A1NONw56dT3/B8Vw9LN1jcJb04VRF+T2RVt+FJU1UtW1Znf/n6W5rU/
sqrMPfBiKygplxpntP6dRXnq+ZuJvdZhkTemmcn4hSD366zJJxHuCl3ZWZys5WWofcWBbUF7LJO5
mwa//VyQahw1t/cXMEskuXBZjjoEjVFHjRRg17OXnJ4s/YkiGgtopsFUnnOOTnpd2Cc7/9HFWyAU
r7JBvveFYuQngJx5DTqbVFgq5M7P7h7iD8Xc2V13pagAmTBG0P7PQe6YhCXaMiYrvZ5swj8mRpRC
3G73vAZabqU1CEqkFXBj2kyGAg6WX/PvhzxqWckxebe7THqijRo2rbTQvNOK4Vrf5/bM2EQmP8AA
WcHZw7fVLW6gfGL+b+dQeyADc02qZHHbi4c4Pl4+M1qDwjkygJZUKnukaEDGbgNnEO6uwCArHo2P
wyzWIg50Pu2TQ8qpUt/0ugknNvwBwVqxRUmFBGbqqhya38EDSA1cbhdHdD+toIGtgnqfrprdS85l
QUQh8OFaDp76mbNU6YzZZbW5nBp8sUUsZ6p4++o14VDCAvPFKr4/V4T0/aXi/EW3fqqzj/910oL3
P40Cmhc9/K4dth47NxldKS8SdaKtHODMWVe87oTOVeABSG939qDtxp8zC2UCpvjh2uiRY7yfpT0t
oglmE5YsYEYJYXSfgqvPbWDL7sa5zmElWNPDA+rH1jGcaDwn1XbimSOZuBVVatOwjeHrPkg9QdqH
Yb0CH5RZuf0trSNFK1ONxoUMTBa1W5UMY3VGcoC/P3HbZs7GpMKyJ5oaeWvXSoP/coj44M6a2VN/
+FGKEbyDnqnxsokp2uUkNuicoJH/lU1TQkZVFUKohvKT3Zji0+OwuFuy3Nkfn2B1rUTZFUyVydGJ
/cKQxfk6mV9dI1n50Y4eV8P+jh+hSEoCuRMXLdOM9VpH1TXI5NjpT5yzyKW8Jno4JqNlKXwhHybA
UXHxoe4EEPtY5rLZWmjqEyeUrF6GcWyCVsEiExYmpuesd+CPOSMr63uK3+FsAiaFa6zuZaKsFCKb
tOKi64KysWj/
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
