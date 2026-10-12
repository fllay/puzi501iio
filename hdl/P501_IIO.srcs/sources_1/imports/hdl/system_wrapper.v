//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Fri Aug  8 18:03:42 2025
//Host        : XHPC running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (MDIO_PHY_mdc,
    MDIO_PHY_mdio_io,
    RGMII_rd,
    RGMII_rx_ctl,
    RGMII_rxc,
    RGMII_td,
    RGMII_tx_ctl,
    RGMII_txc,
    adf_spi_clk_0,
    adf_spi_cs_0,
    adf_spi_dio_0,
    dp_aux_data_in_0,
    dp_aux_data_oe_n_0,
    dp_aux_data_out_0,
    dp_hot_plug_detect_0,
    enable,
    gpio_i,
    gpio_o,
    gpio_t,
    rx_clk_in_n,
    rx_clk_in_p,
    rx_data_in_n,
    rx_data_in_p,
    rx_frame_in_n,
    rx_frame_in_p,
    spi0_csn,
    spi0_miso,
    spi0_mosi,
    spi0_sclk,
    sys_clk_n,
    sys_clk_p,
    sys_rstn,
    tdd_sync_i,
    tdd_sync_o,
    tdd_sync_t,
    tx_clk_out_n,
    tx_clk_out_p,
    tx_data_out_n,
    tx_data_out_p,
    tx_frame_out_n,
    tx_frame_out_p,
    txnrx,
    up_enable,
    up_txnrx);
  output MDIO_PHY_mdc;
  inout MDIO_PHY_mdio_io;
  input [3:0]RGMII_rd;
  input RGMII_rx_ctl;
  input RGMII_rxc;
  output [3:0]RGMII_td;
  output RGMII_tx_ctl;
  output RGMII_txc;
  output adf_spi_clk_0;
  output adf_spi_cs_0;
  inout adf_spi_dio_0;
  input dp_aux_data_in_0;
  output [0:0]dp_aux_data_oe_n_0;
  output dp_aux_data_out_0;
  input dp_hot_plug_detect_0;
  output enable;
  input [94:0]gpio_i;
  output [94:0]gpio_o;
  output [94:0]gpio_t;
  input rx_clk_in_n;
  input rx_clk_in_p;
  input [5:0]rx_data_in_n;
  input [5:0]rx_data_in_p;
  input rx_frame_in_n;
  input rx_frame_in_p;
  output [2:0]spi0_csn;
  input spi0_miso;
  output spi0_mosi;
  output spi0_sclk;
  input sys_clk_n;
  input sys_clk_p;
  input sys_rstn;
  input tdd_sync_i;
  output tdd_sync_o;
  output tdd_sync_t;
  output tx_clk_out_n;
  output tx_clk_out_p;
  output [5:0]tx_data_out_n;
  output [5:0]tx_data_out_p;
  output tx_frame_out_n;
  output tx_frame_out_p;
  output txnrx;
  input up_enable;
  input up_txnrx;

  wire MDIO_PHY_mdc;
  wire MDIO_PHY_mdio_i;
  wire MDIO_PHY_mdio_io;
  wire MDIO_PHY_mdio_o;
  wire MDIO_PHY_mdio_t;
  wire [3:0]RGMII_rd;
  wire RGMII_rx_ctl;
  wire RGMII_rxc;
  wire [3:0]RGMII_td;
  wire RGMII_tx_ctl;
  wire RGMII_txc;
  wire adf_spi_clk_0;
  wire adf_spi_cs_0;
  wire adf_spi_dio_0;
  wire dp_aux_data_in_0;
  wire [0:0]dp_aux_data_oe_n_0;
  wire dp_aux_data_out_0;
  wire dp_hot_plug_detect_0;
  wire enable;
  wire [94:0]gpio_i;
  wire [94:0]gpio_o;
  wire [94:0]gpio_t;
  wire rx_clk_in_n;
  wire rx_clk_in_p;
  wire [5:0]rx_data_in_n;
  wire [5:0]rx_data_in_p;
  wire rx_frame_in_n;
  wire rx_frame_in_p;
  wire [2:0]spi0_csn;
  wire spi0_miso;
  wire spi0_mosi;
  wire spi0_sclk;
  wire sys_clk_n;
  wire sys_clk_p;
  wire sys_rstn;
  wire tdd_sync_i;
  wire tdd_sync_o;
  wire tdd_sync_t;
  wire tx_clk_out_n;
  wire tx_clk_out_p;
  wire [5:0]tx_data_out_n;
  wire [5:0]tx_data_out_p;
  wire tx_frame_out_n;
  wire tx_frame_out_p;
  wire txnrx;
  wire up_enable;
  wire up_txnrx;

  IOBUF MDIO_PHY_mdio_iobuf
       (.I(MDIO_PHY_mdio_o),
        .IO(MDIO_PHY_mdio_io),
        .O(MDIO_PHY_mdio_i),
        .T(MDIO_PHY_mdio_t));
  system system_i
       (.MDIO_PHY_mdc(MDIO_PHY_mdc),
        .MDIO_PHY_mdio_i(MDIO_PHY_mdio_i),
        .MDIO_PHY_mdio_o(MDIO_PHY_mdio_o),
        .MDIO_PHY_mdio_t(MDIO_PHY_mdio_t),
        .RGMII_rd(RGMII_rd),
        .RGMII_rx_ctl(RGMII_rx_ctl),
        .RGMII_rxc(RGMII_rxc),
        .RGMII_td(RGMII_td),
        .RGMII_tx_ctl(RGMII_tx_ctl),
        .RGMII_txc(RGMII_txc),
        .adf_spi_clk_0(adf_spi_clk_0),
        .adf_spi_cs_0(adf_spi_cs_0),
        .adf_spi_dio_0(adf_spi_dio_0),
        .dp_aux_data_in_0(dp_aux_data_in_0),
        .dp_aux_data_oe_n_0(dp_aux_data_oe_n_0),
        .dp_aux_data_out_0(dp_aux_data_out_0),
        .dp_hot_plug_detect_0(dp_hot_plug_detect_0),
        .enable(enable),
        .gpio_i(gpio_i),
        .gpio_o(gpio_o),
        .gpio_t(gpio_t),
        .rx_clk_in_n(rx_clk_in_n),
        .rx_clk_in_p(rx_clk_in_p),
        .rx_data_in_n(rx_data_in_n),
        .rx_data_in_p(rx_data_in_p),
        .rx_frame_in_n(rx_frame_in_n),
        .rx_frame_in_p(rx_frame_in_p),
        .spi0_csn(spi0_csn),
        .spi0_miso(spi0_miso),
        .spi0_mosi(spi0_mosi),
        .spi0_sclk(spi0_sclk),
        .sys_clk_n(sys_clk_n),
        .sys_clk_p(sys_clk_p),
        .sys_rstn(sys_rstn),
        .tdd_sync_i(tdd_sync_i),
        .tdd_sync_o(tdd_sync_o),
        .tdd_sync_t(tdd_sync_t),
        .tx_clk_out_n(tx_clk_out_n),
        .tx_clk_out_p(tx_clk_out_p),
        .tx_data_out_n(tx_data_out_n),
        .tx_data_out_p(tx_data_out_p),
        .tx_frame_out_n(tx_frame_out_n),
        .tx_frame_out_p(tx_frame_out_p),
        .txnrx(txnrx),
        .up_enable(up_enable),
        .up_txnrx(up_txnrx));
endmodule
