// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Wed Apr 10 14:27:46 2024
// Host        : carson-yeet running 64-bit CachyOS
// Command     : write_verilog -force -mode funcsim
//               /home/carson/Nextcloud/Documents/school/ECEN340/final_project/8-bit-console-clone-verilog/eight_bit_console/eight_bit_console.gen/sources_1/ip/dsp_pc_counter/dsp_pc_counter_sim_netlist.v
// Design      : dsp_pc_counter
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_pc_counter,c_counter_binary_v12_0_17,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_17,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module dsp_pc_counter
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
  dsp_pc_counter_c_counter_binary_v12_0_17 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2336)
`pragma protect data_block
Mtgdj7eQfyUCQa8XBsKAvIr6yiYWOgvXJfbjrAahhWc/X9koJRMGxy+RnrK/ikJt4XGz4TkbN5BM
oc1yYoNbw6jx0bzZfZhXnTZz+ZToYe1EKFVj497jTVIOYW3xR1xFUhuo8J5x0hvyVquxVnjT8Y6L
rewfIxTSqrZSyGh7x9II+CoYM59zDEA+0OoHKhyiw44gF7ktXR3dMXzpW/4RSQCxFHcE/E+WjZ5E
Z4Z0F7mETplnawDSlMJFbF10SthZiRJx9sFb4gNQyI7GnA0w3pOV0RUwx1/j4RLJwG0vbpfnsYSR
xZ/XGne/AoyEs7kESq28h/185nOug8dpabZfyvExf7s8EmMoRtvvVKcEecC3eXLF1BGPZyrNMP7O
Yb2WICaDCPcLjDQNCqF+Xr40UunanHJ7FIT9sEloP86keLKs23HN4tuzi58dlaPOBfAP481YYml7
MsQZfI9Rw1N2IIF6NivQGT32GFHyPiGXE1YxvncN8CYtMa4sUOnpckN2RkxLpFkuuMFDuG2/zS3Q
w8rmYfaUUqoJtF+Xupo2BWtp42jfO/543l/N+SWAxJ1Jf8mpnLEpZtPQRHAYL6a+SzBNz6XVXUFx
O32/WZtaRrprO3kNBhatvlZTUHRNGyJsjHePM6zNVqVRHHbGzlhNMOCkOTCGJSAZiKwP3E5DR/Ec
EeRgZGs9YcMtL0Rfprno5wLToQFwLny7STYZ6msgQdL9YoVGC3ngtjBhqMdLmxKzzKAOItTCNkoP
9wgnA4TfHhUG/jyc5zbe3UoTL949hhotVLPGWSi2OabHRAcFnVELr5ZjpzsXy+LiE9AaRiC+UGNo
uXzLPQjGk/VU9mJJCH7bb68LEuZuqes7DGpAvsk6ncmnKe3S8bWAm/+gQeH84EKh8zpCIxf+fQ7N
Mtt4mWAvhPBVTKMQPuwuHnLKWk2XoASbyn3nHOOvuSRaCRiRJDdjCbkUVjfRszjonbWWGp4sLAmp
dnsJF82OTvH1pSpOKzCbnb0CmlOgFzuNjlHI/PNAR5Mn9k8JnO0bARxNMy6D9F6TOUiUzZYub22c
8zzKH84Th58LGDSa16RzlubGmf/M4+VnhDQpxiQZdx8+yuQsmN2JIfFNSKihSNc+UL/BQm4J6Lh6
X1VscJ4AnFBh2EJWDLkYcdEwetxGWXo+nOnulmxwQOC+dPZHxPEErSIoaoq9Somgmc6EaDoh/57G
UDiquYrIanr1p7bRrlIfar0Ecx0un4pqo3DUyroqgfnO4LixzApf/xmqV82edmH6DwR+l6A7n7Sq
8ZXZeb2Rv97GqVC0ZGlO12SD2ygJOfQLRZfRaB2GdlcvfQvSuCPuxeyhhxTqpVTAhZr0p6ik8vJq
CxVMKI4TCc5SVu7Zoa9P7tWxyShMzMKBdZZg1bt3KWtPD/aRZ+u1LWyPPgzX+PZJ+s2YOhP0AxzL
VX7RqXAY9Q5qgbhq7O6u16MVkmXh05WhExWhajKVm2y8n2/mEK0Ju/XPj7nFYSjmKE+TJqw2i1gq
wdKU+XRILb7++mq2xMB/Z75cDRticbhtaHXVoXeBmBGjZB/rgbTsjL2mhOHB7BcLSLpIHcdmz4hi
6PuIxCwcP2DFOicyHzncY8ve+cdzyjpxflK5ysKWeu3oYMUUcuv+f7aP585AStIa9DpPrcUr3yg4
+vwgeEV9Pah/wA8rMlTxjuArIXsq1oIzF2teZznnqbkWadnaguZ77ERkjyZMgRArmOStrf1ggbDT
EqXB+4+h+/Q9g11AT46UF7lmveRdcuHwQbo0fkofVchVrnsfd4w7MLx2WwnyEPg1u7Lni+8PjhVJ
+wvwtSbl4Kl9ooE3s1DbWV5PTqxOuownlzi3zJBk37zpnrN8wwUgD1gyHrIOKt33jYlYV9ziVwqZ
AAcNynnn7ZXRFMlQQtwmqU5awuvMxH7mDB0UEhD+4VHiTE1LYauUbYKqFjsRolEVW++n8XEHdFPb
yt6rUOHLonUmXK9cXiuVLPosan0yVjg5HL+E4nNx5JBVpuKR3j3J0brPJOMYyOmznKg+rAMetaVB
/SCq8eXlg4Zdq8pGg+V+LVR6OwCHM2HXPop2mA1DBtESspBNVcyPYZ160QRA9JephfBXIFleRZpj
a/QF5r97DA97LP+VtMom3DnDpaRULXAK7UW31+i1Ke9It6JC6ZuBkIRs1FePqoUmVrjIhMRXUtjj
31CjJW+mHSXhZOVqOP4GpNpbV6tvKxxKTicsstVyHe5yHjICMiqlxa8wB+gEdZ+sthp+28qR+E8c
stjVE8fDcH+bdsHeb8yUTqj+vhiluq7rn7RuwJbRomu1oISZusxo3WvaEsSTN0KHtIjhfviAPIYD
NRNTO8ozerDbnIvBvqxrVq1/C4A2coC8oPFeL+h8O/sNoPImTvw8drzxxAfr7SeWszQsw4QsxEZ6
r1wIiXcZPn1/KE4Qm5s69ZVBM+zU/5eygEDnLmBX3nDca9TMiWSDYb3y/K7Y6PugXPlhtG5poHQw
9fZGMerRBfr0BznSwFLpxqR6iokz6rfefYngtnYwHGrobEPf5OiVYkLqcBe/B2VK8/Aariat9ffa
cJcPV86xTGXTlAeHuGqcFTu7jjaeG0IIJfLvt3dGlp7pjrpnNm6VZlDcpZe/QjO0c6Uqzishuycp
EAy9n7/EztlRTlTR79V8jOuD9WVBVEPUr9f7RuwME5zpbg6Ok/eO18nPiTFQU+Ru4DADY69Ta+EZ
sBm4zFEwUAoiNesePVAuCnSHy02jEPJlCSKuE5dcdIJEb2+raNIdrXdPXHLD3u2/12pBrZh6xwbk
R2h5sLpvXzOybgGixsNvghg7EROplXafSJyxtiHacdG4FHNF3+fOtxq0DqgBvIWuJHjvUzMEKsec
1Y9h1604VACiGeQYMa930MRRxLCQc0Z0OPTTBad05P22aBUi0KdPb07JSWeInN2F2WfPDZVIABR2
0nWA7kwniNDowEhCb0rYcPPH/VtxeCX7MLaOMjOMQT+rFsYhXa3LnIGJKgLZon/TS/tiKFwBkzbQ
Vs7QUQJ5RLaziqrlHXrM4NKLL//U3ho4q10DYxzOsPA5j6bW+jCVhsCa59AZ7u2EkTKzLs3DCpI=
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
rC+sRfOXZvUCzmvUY0Ca8ASwGvCw/M2vGOmRcT0NQZxi5KPeNAN5BSZhOtIM/na90fIhdzrEgOUM
EasVaHAHFbDTkina6L4xO2HtNjSaCNShZ2isEMJyH1xyVZYd4WWcsjcEZF/H4/FN7hfsWXDoDjvE
2YGvVvvloYsoByOOXsfOq5k4/1xXsljIpn3A/R97f9LTgYS2djMmQ6CilSoZTE7ys+LDlVrPxoWL
+NcV88puZpBMNaTtq8MHYU9VfFyga8zmKZy7ZTbyN1+ToJzhsMOO0MyP160WXBZzxGlLekRmXLwZ
WhWXYwQ80LM6170sZx0WC2/GI282P0Uca28YWw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KsKA7tUzW0oZp/LxI0l+rGmKuhpFJs6F5T3Kd/7QRXhMsedHbMmZ8uYe0OMg1Ui1uAJ5AM5t6xzr
tx9FUsb3P9e/JhOTvbpXtEkvx1EdFugkop+b5JfF+SOf9Hj5K5ABjuDyCZRZMICtxjY4JbBDBe8v
1IqqNHbZH53nIIaYmBHLWP34Gbg8odVVI1mIFwFchFiaVGZNdnmrJ01G/XvywNtv5izmm2dfCqNr
I8kP7M0JJFiZP/SAd/f+6TXFYBRgIBpmzWMbzQpMZ4aM28j7oir96gQIjvsqIAnd0gUMXz6Wfix2
aZr8/W/BcosotU3lcDVXHNNEF7pLjB5y/l4Xbg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11808)
`pragma protect data_block
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
JlkLmAb4yUCR
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
