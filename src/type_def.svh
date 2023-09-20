// Copyright 2023 Katolieke Universiteit Leuven (KUL)
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

// Author: Xiaoling Yi (xiaoling.yi@kuleuven.be)

// verilog_lint: waive-start line-length
// verilog_lint: waive-start no-trailing-spaces

localparam logic [31:0] CSRRW              = 32'b?????????????????001?????1110011;
localparam logic [31:0] CSRRS              = 32'b?????????????????010?????1110011;
localparam logic [31:0] CSRRC              = 32'b?????????????????011?????1110011;
localparam logic [31:0] CSRRWI             = 32'b?????????????????101?????1110011;
localparam logic [31:0] CSRRSI             = 32'b?????????????????110?????1110011;
localparam logic [31:0] CSRRCI             = 32'b?????????????????111?????1110011;

`ifndef TCDM_INTERFACE_TYPEDEF_SVH_
`define TCDM_INTERFACE_TYPEDEF_SVH_

`define TCDM_TYPEDEF_REQ_CHAN_T(__req_chan_t, __addr_t, __data_t, __strb_t, __user_t) \
  typedef struct packed { \
    __addr_t             addr;  \
    logic                write; \
    reqrsp_pkg::amo_op_e amo;   \
    __data_t             data;  \
    __strb_t             strb;  \
    __user_t             user;  \
  } __req_chan_t;

`define TCDM_TYPEDEF_RSP_CHAN_T(__rsp_chan_t, __data_t) \
  typedef struct packed { \
    __data_t data;        \
  } __rsp_chan_t;

`define TCDM_TYPEDEF_REQ_T(__req_t, __req_chan_t) \
  typedef struct packed { \
    __req_chan_t q;       \
    logic        q_valid; \
  } __req_t;

`define TCDM_TYPEDEF_RSP_T(__rsp_t, __rsp_chan_t) \
  typedef struct packed { \
    __rsp_chan_t p;       \
    logic        p_valid; \
    logic        q_ready; \
  } __rsp_t;

`define TCDM_TYPEDEF_ALL(__name, __addr_t, __data_t, __strb_t, __user_t) \
  `TCDM_TYPEDEF_REQ_CHAN_T(__name``_req_chan_t, __addr_t, __data_t, __strb_t, __user_t) \
  `TCDM_TYPEDEF_RSP_CHAN_T(__name``_rsp_chan_t, __data_t) \
  `TCDM_TYPEDEF_REQ_T(__name``_req_t, __name``_req_chan_t) \
  `TCDM_TYPEDEF_RSP_T(__name``_rsp_t, __name``_rsp_chan_t)

`endif
