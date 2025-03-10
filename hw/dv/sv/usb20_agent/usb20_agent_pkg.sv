// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

package usb20_agent_pkg;
  // dep packages
  import uvm_pkg::*;
  import dv_utils_pkg::*;
  import dv_lib_pkg::*;

  // macro includes
  `include "uvm_macros.svh"
  `include "dv_macros.svh"

  // usb20_item enums
  typedef enum bit [2:0] {PktTypeSoF, PktTypeToken, PktTypeData, PktTypeHandshake} pkt_type_e;
  // TODO: these are presently nibble-swapped relative to the specification.
  typedef enum bit [7:0] {PidTypeOutToken = 8'b0001_1110, PidTypeInToken = 8'b1001_0110,
      PidTypeSofToken = 8'b0101_1010, PidTypeSetupToken = 8'b1101_0010,
      PidTypeData0 = 8'b0011_1100, PidTypeData1 = 8'b1011_0100, PidTypeData2 = 8'b0111_1000,
      PidTypeMData = 8'b1111_0000, PidTypeAck = 8'b0010_1101, PidTypeNak = 8'b1010_0101,
      PidTypeStall = 8'b1110_0001, PidTypeNyet = 8'b0110_1001, PidTypePre = 8'b1100_0011,
      PidTypeSplit = 8'b1000_0111, PidTypePing = 8'b0100_1011} pid_type_e;

  typedef enum byte {bmRequestType0 = 8'b0_00_00000, bmRequestType1 = 8'b0_00_00001,
      bmRequestType2 = 8'b0_00_00010, bmRequestType3 = 8'b1_00_00000,
      bmRequestType4 = 8'b1_00_00001, bmRequestType5 = 8'b1_00_00010} bmrequesttype_e;

  typedef enum byte {bRequestGET_STATUS = 8'h00, bRequestCLEAR_FEATURE = 8'h01,
      bRequestSET_FEATURE = 8'h03, bRequestSET_ADDRESS = 8'h05, bRequestGET_DESCRIPTOR = 8'h06,
      bRequestSET_DESCRIPTOR = 8'h07, bRequestGET_CONFIGURATION = 8'h08,
      bRequestSET_CONFIGURATION = 8'h09, bRequestGET_INTERFACE = 8'h0A,
      bRequestSET_INTERFACE = 8'h0B, bRequestSYNCH_FRAME = 8'h0C} brequest_e;
  typedef enum bit [2:0] {CtrlTrans, IsoTrans, IntrptTrans, BulkTrans} usb_transfer_e;
  // local types
  // forward declare classes to allow typedefs below
  typedef class usb20_item;
  typedef class usb20_agent_cfg;

  // reuse dv_base_seqeuencer as is with the right parameter set
  typedef dv_base_sequencer #(.ITEM_T     (usb20_item),
    .CFG_T      (usb20_agent_cfg)) usb20_sequencer;

  // functions

  // package sources
  `include "usb20_item.sv"
  `include "usb20_agent_cfg.sv"
  `include "usb20_agent_cov.sv"
  `include "usb20_driver.sv"
  `include "usb20_monitor.sv"
  `include "usb20_agent.sv"
  `include "usb20_seq_list.sv"

endpackage: usb20_agent_pkg
