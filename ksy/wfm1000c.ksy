meta:
  id: wfm1000c
  title: Rigol DS1021CA oscilloscope waveform file format
  file-extension: wfm
  endian: le

doc: |
  This is the same format as used for DS1000D scopes except that the first byte
  of the file is 0xA1 and the data starts at an offset of 256.

instances:
  header:
    pos: 0
    type: header
  data:
    pos: 256
    type: raw_data

types:
  header:
    seq:
      - id: magic            # 00 => file offset in decimal
        contents: [0xa1, 0xa5, 0x00, 0x00]
      - id: unknown_1        # 04
        type: u4
        repeat: expr
        repeat-expr: 6
      - id: points           # 28
        type: u4
      - id: active_channel   # 32
        type: u1
      - id: unknown_2a       # 33
        size: 3
      - id: ch               # 36, 60
        type: channel_header
        repeat: expr
        repeat-expr: 2
      - id: time_scale       # 84 (in picoseconds)
        type: u8
      - id: time_offset      # 92 (in picoseconds)
        type: s8
      - id: sample_rate_hz   # 100
        type: f4
      - id: unknown_3        # 104
        type: u4
        repeat: expr
        repeat-expr: 9
      - id: unknown_4        # 140
        type: u2
      - id: trigger_mode     # 142
        type: u1
        enum: trigger_mode_enum
      - id: unknown_6        # 143
        type: u1
      - id: trigger_source   # 144
        type: u1
        enum: trigger_source_enum

    instances:
      seconds_per_point:
        value: 1.0/sample_rate_hz

  channel_header:   # 24 bytes total
    seq:
      - id: scale_display    # 36, 60
        type: s4
      - id: shift_display    # 40, 64
        type: s2
      - id: unknown_1        # 42, 66
        type: u1
      - id: unknown_2        # 43, 67
        type: u1
      - id: probe_value      # 44, 68
        type: f4
      - id: invert_disp_val  # 48, 72
        type: u1
      - id: enabled_val      # 49, 73
        type: u1
      - id: invert_m_val     # 50, 74
        type: u1
      - id: unknown_3        # 51, 75
        type: u1
      - id: scale_measured   # 52, 76
        type: s4
      - id: shift_measured   # 56, 80
        type: s2
      - id: unknown_3a       # 58, 82
        type: u2
    instances:
      inverted:
        value: "invert_m_val != 0 ? true : false"
      enabled:
        value: "enabled_val != 0 ? true : false"
      volt_per_division:
        value: "inverted ?
                -1.0e-6 * scale_measured:
                +1.0e-6 * scale_measured"
      volt_scale:
        value: volt_per_division/25.0
      volt_offset:
        value: shift_measured * volt_scale
      time_scale:
        value: _root.header.time_scale
      time_offset:
        value: _root.header.time_offset
      unit:
        value: "unit_enum::v"

  raw_data:
    seq:
      - id: ch1
        size: _root.header.points
        if: _root.header.ch[0].enabled

      - id: ch2
        size: _root.header.points
        if: _root.header.ch[1].enabled

enums:
  trigger_source_enum:
    0: ch1
    1: ch2
    2: ext
    3: ext5
    5: ac_line
    7: dig_ch

  trigger_mode_enum:
    0: edge
    1: pulse
    2: slope
    3: video
    4: alt
    5: pattern
    6: duration

  machine_mode_enum:
    0: ds1000b
    1: ds1000c
    2: ds1000e
    3: ds1000z
    4: ds2000
    5: ds4000
    6: ds6000

  unit_enum:
    0: w
    1: a
    2: v
    3: u
