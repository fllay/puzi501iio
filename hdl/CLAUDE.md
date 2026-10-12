# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Xilinx Vivado 2024.1 FPGA project targeting the **PZSDR P501** board (Zynq UltraScale+ MPSoC, `xczu5ev-sfvc784-2-i`). It implements an SDR (Software Defined Radio) platform based on the ADI FMCOMMS2 reference design, integrating an **AD9361** wideband 2×2 RF transceiver with the Zynq PS (Processing System) over AXI.

## Opening and Building the Project

The project is opened in Vivado 2024.1 GUI:
```
vivado P501_IIO.xpr
```

Or in batch mode (non-interactive):
```
vivado -mode batch -source <script.tcl>
```

### Building the IP Library

Before synthesis, all custom ADI IP cores in `library/` must be packaged. Each IP core has its own Makefile invoking a TCL packaging script:

```bash
# Build all library IPs (run from library/ directory)
cd library && make lib

# Build a single IP core
cd library/axi_ad9361 && make

# Clean all IPs
cd library && make clean
```

The IP repository is registered in Vivado at `$PPRDIR/library`. When opening the project, Vivado auto-loads it.

### Synthesis and Implementation

Run from Vivado Tcl console:
```tcl
# Run synthesis
launch_runs synth_1
wait_on_run synth_1

# Run implementation
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1

# Export hardware for Vitis/PetaLinux
write_hw_platform -fixed -include_bit -force system_top.xsa
```

## Architecture

### Signal Flow

```
AD9361 RF <--LVDS--> axi_ad9361 IP <--AXI--> axi_ad9361_adc_dma / axi_ad9361_dac_dma
                                                      |
                                               HP AXI Interconnects
                                                      |
                                              Zynq UltraScale+ PS
                                           (Linux / IIO framework)
```

### Key Source Files

| File | Role |
|------|------|
| `P501_IIO.srcs/sources_1/imports/hdl/projects/fmcomms2/zcu102/system_top.v` | Top-level PL module; GPIO pin mapping, SPI routing, RF switch assignments |
| `P501_IIO.srcs/sources_1/imports/hdl/system_wrapper.v` | Auto-generated PS/PL wrapper (do not edit manually) |
| `P501_IIO.srcs/sources_1/bd/system/system.bd` | Block design — the canonical definition of all IP connectivity |
| `P501_IIO.srcs/constrs_1/imports/zcu102/system_constr.xdc` | Pin assignments and timing constraints for the P501 board |
| `P501_IIO.srcs/sources_1/imports/hdl/adf4002_dri.v` | ADF4002 PLL driver (instantiates `adf4002_config` and `spi_config`) |
| `P501_IIO.srcs/sources_1/imports/hdl/adf4002_config.v` | LUT holding the 3 ADF4002 initialization words |
| `P501_IIO.srcs/sources_1/imports/hdl/spi_config.v` | SPI sequencer state machine (walks LUT, drives `adc_spi`) |
| `P501_IIO.srcs/sources_1/imports/hdl/adc_spi.v` | Low-level 3-wire SPI master |

### Block Design IPs (system.bd)

The block design connects these IPs to the `sys_ps8` (Zynq UltraScale+ PS):

- **`axi_ad9361`** — AD9361 RF transceiver controller; exposes ADC/DAC data as AXI-Stream
- **`axi_ad9361_adc_dma` / `axi_ad9361_dac_dma`** — DMA engines that move RF samples to/from PS DDR
- **`axi_ad9361_dac_fifo`** — DAC data FIFO
- **`util_ad9361_adc_pack` / `util_ad9361_dac_upack`** — Sample packing/unpacking between I/Q channels
- **`util_ad9361_adc_fifo`** — ADC FIFO
- **`util_ad9361_divclk` / `_sel` / `_reset`** — Divided-clock selection for the AD9361 sample clock domain
- **`clk_wiz_0`** — Clock wizard deriving PL fabric clocks from the 200 MHz differential system clock
- **`gmii_to_rgmii_0`** — Converts PS GEM GMII to board RGMII for gigabit Ethernet
- **`adf4002_dri_0`** — ADF4002 PLL init driver (connected to PL, not PS SPI)
- **`axi_sysid_0` / `rom_sys_0`** — ADI system-ID ROM (read from Linux to identify bitstream)
- **`sys_rstgen`** — Reset synchronizer for PL fabric resets

### GPIO Mapping (system_top.v)

| gpio_o bit | Signal |
|-----------|--------|
| [48] | `up_txnrx` (AD9361 TDD TX/RX select) |
| [47] | `up_enable` (AD9361 enable) |
| [46] | `gpio_resetb` (AD9361 active-low reset) |
| [45] | `gpio_sync` |
| [44] | `gpio_en_agc` |
| [43:40] | `gpio_ctl[3:0]` |
| [20:13] | `gpio_bd_o[7:0]` (board GPIO) |

| gpio_i bit | Signal |
|-----------|--------|
| [39:32] | `gpio_status[7:0]` (AD9361 status) |

### RF Switch Hardcoding

RF switches in `system_top.v` are currently hardcoded for FDD mode:
```verilog
assign fddtdd_sw  = 0;
assign trx_sw     = 0;
assign fddtdd_sw1 = 1;
assign trx_sw1    = 1;
assign clk_en[0]  = 1;
assign clk_en[1]  = 1;
```

### Library IP Build System

Each IP in `library/` contains:
- `<ip>_ip.tcl` — Vivado packaging script (calls `adi_ip_create`, `adi_ip_files`, etc.)
- `<ip>_hw.tcl` — Parameters and port definitions
- `component.xml` — Packaged IP descriptor (generated; do not edit)
- `Makefile` — Invokes the TCL script via Vivado batch mode

The `library/scripts/adi_env.tcl` sets `ad_hdl_dir` to the `library/` parent directory. Override with `ADI_HDL_DIR` environment variable if building outside the default tree.

## Constraints Notes

- The 200 MHz system clock (`sys_clk_p/n`, pins L3/L2) has **no `create_clock`** in the XDC — the Clocking Wizard IP owns it. Defining it manually causes a "Clock Overrides" Critical Warning.
- RGMII receive clock uses `create_clock -period 8.001` (not 8.000) to avoid IDELAY frequency mismatches.
- AD9361 RX clock period is set to 10.000 ns (100 MHz); adjust for other sample rates (e.g., 16.27 ns for 61.44 MHz).
- `set_clock_groups -asynchronous` covers PL clocks, MDIO, RGMII, RX data, and SPI clocks.

## Exported Hardware

`system_top.xsa` is the hardware handoff file for PetaLinux / Vitis. Regenerate after any bitstream change:
```tcl
write_hw_platform -fixed -include_bit -force system_top.xsa
```
