# WARNING: This file was generated from bigbeddata.rl using ragel. Do not edit!
type BigBedData <: IntervalStream{BEDMetadata}
    stream::BufferedInputStream
    header::BigBedHeader
    zoom_headers::Vector{BigBedZoomHeader}
    autosql::String
    summary::BigBedTotalSummary
    btree_header::BigBedBTreeHeader
    rtree_header::BigBedRTreeHeader
    data_count::Uint32

    # preallocated space for reading and searching the B-tree
    btree_internal_nodes::Vector{BigBedBTreeInternalNode}
    btree_leaf_nodes::Vector{BigBedBTreeLeafNode}
    key::Vector{Uint8}
    node_keys::Vector{Vector{Uint8}}
    uncompressed_data::Vector{Uint8}
end


# Parser for data blocks in a BigBed file. This is very similar
# to the BED parser in bed.rl, with the following exceptions:
#
#    * BigBed has binary chrom_index, start, and end, insteado of ASCII
#      chromosome name, start, end.
#    * BigBed entries are null ('\0') terminated, rather than newline separated.
#
const _bigbedparser_start  = convert(Int , 39)
const _bigbedparser_first_final  = convert(Int , 39)
const _bigbedparser_error  = convert(Int , 0)
const _bigbedparser_en_main  = convert(Int , 39)
typealias StringFieldVector Vector{StringField}
typealias NullableStringFieldVector Nullable{StringFieldVector}
typealias NullableStringField Nullable{StringField}

type BigBedDataParser
    state::Ragel.State

    # intermediate values used during parsing
    chrom_id::UInt32
    red::Float32
    green::Float32
    blue::Float32
    block_size_idx::Int
    block_first_idx::Int
    seq_names::Nullable{StringFieldVector}
    assumed_seqname::Nullable{StringField}

    function BigBedDataParser(input::BufferedInputStream;
                              seq_names::NullableStringFieldVector=NullableStringFieldVector(),
                              assumed_seqname::NullableStringField=NullableStringField())

        cs = _bigbedparser_start;
	return new(Ragel.State(cs, input), 0, 0.0, 0.0, 0.0, 1, 1, seq_names, assumed_seqname)
    end
end


Ragel.@generate_read_fuction("_bigbedparser", BigBedDataParser, BEDInterval,
    begin
        if p == pe
	@goto _test_eof

end
@switch cs  begin
    @case 39
@goto st_case_39
@case 1
@goto st_case_1
@case 2
@goto st_case_2
@case 3
@goto st_case_3
@case 4
@goto st_case_4
@case 5
@goto st_case_5
@case 6
@goto st_case_6
@case 7
@goto st_case_7
@case 8
@goto st_case_8
@case 9
@goto st_case_9
@case 10
@goto st_case_10
@case 11
@goto st_case_11
@case 12
@goto st_case_12
@case 0
@goto st_case_0
@case 40
@goto st_case_40
@case 13
@goto st_case_13
@case 14
@goto st_case_14
@case 15
@goto st_case_15
@case 16
@goto st_case_16
@case 17
@goto st_case_17
@case 18
@goto st_case_18
@case 19
@goto st_case_19
@case 20
@goto st_case_20
@case 21
@goto st_case_21
@case 22
@goto st_case_22
@case 23
@goto st_case_23
@case 24
@goto st_case_24
@case 25
@goto st_case_25
@case 26
@goto st_case_26
@case 27
@goto st_case_27
@case 28
@goto st_case_28
@case 29
@goto st_case_29
@case 30
@goto st_case_30
@case 31
@goto st_case_31
@case 32
@goto st_case_32
@case 33
@goto st_case_33
@case 34
@goto st_case_34
@case 35
@goto st_case_35
@case 36
@goto st_case_36
@case 37
@goto st_case_37
@case 38
@goto st_case_38

end
@goto st_out
@label st_case_39
@goto ctr64
@label ctr64
	Ragel.@anchor!
@goto st1
@label ctr65
	input.block_size_idx = 1
        input.block_first_idx = 1

        yield = true
        # // fbreak causes will cause the pushmark action for the next seqname
        # // to be skipped, so we do it here
        Ragel.@anchor!
        	p+= 1; cs = 1; @goto _out



	Ragel.@anchor!
@goto st1
@label st1
p+= 1;
	if p == pe
	@goto _test_eof1

end
@label st_case_1
@goto st2
@label st2
p+= 1;
	if p == pe
	@goto _test_eof2

end
@label st_case_2
@goto st3
@label st3
p+= 1;
	if p == pe
	@goto _test_eof3

end
@label st_case_3
@goto st4
@label st4
p+= 1;
	if p == pe
	@goto _test_eof4

end
@label st_case_4
@goto ctr3
@label ctr3
	input.chrom_id = Ragel.@load_from_anchor!(UInt32)
        if !isnull(input.seq_names)
            output.seqname = copy(get(input.seq_names)[input.chrom_id + 1])
        else
            output.seqname = copy(get(input.assumed_seqname))
        end
        output.metadata.used_fields = 0

	Ragel.@anchor!
@goto st5
@label st5
p+= 1;
	if p == pe
	@goto _test_eof5

end
@label st_case_5
@goto st6
@label st6
p+= 1;
	if p == pe
	@goto _test_eof6

end
@label st_case_6
@goto st7
@label st7
p+= 1;
	if p == pe
	@goto _test_eof7

end
@label st_case_7
@goto st8
@label st8
p+= 1;
	if p == pe
	@goto _test_eof8

end
@label st_case_8
@goto ctr7
@label ctr7
	output.first = 1 + Ragel.@load_from_anchor!(UInt32)
	Ragel.@anchor!
@goto st9
@label st9
p+= 1;
	if p == pe
	@goto _test_eof9

end
@label st_case_9
@goto st10
@label st10
p+= 1;
	if p == pe
	@goto _test_eof10

end
@label st_case_10
@goto st11
@label st11
p+= 1;
	if p == pe
	@goto _test_eof11

end
@label st_case_11
@goto st12
@label st12
p+= 1;
	if p == pe
	@goto _test_eof12

end
@label st_case_12
if ( data[1 + p ]) == 0
	@goto ctr11

end
if 32 <= ( data[1 + p ]) && ( data[1 + p ]) <= 126
	@goto ctr13

end
@goto st0
@label st_case_0
@label st0
cs = 0;
	@goto _out
@label ctr11
	output.last = Ragel.@load_from_anchor!(UInt32)
@goto st40
@label ctr14
	Ragel.@copy_from_anchor!(output.metadata.name)
	output.metadata.used_fields += 1
@goto st40
@label ctr18
	output.metadata.score = Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
@goto st40
@label ctr22
	output.metadata.used_fields += 1
@goto st40
@label ctr25
	output.metadata.thick_first = 1 + Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
@goto st40
@label ctr29
	output.metadata.thick_last = Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
@goto st40
@label ctr33
	input.red = input.green = input.blue = (Ragel.@int64_from_anchor!) / 255.0
	output.metadata.item_rgb = RGB{Float32}(input.red, input.green, input.blue)
	output.metadata.used_fields += 1
@goto st40
@label ctr48
	input.blue = (Ragel.@int64_from_anchor!) / 255.0
	output.metadata.item_rgb = RGB{Float32}(input.red, input.green, input.blue)
	output.metadata.used_fields += 1
@goto st40
@label ctr51
	output.metadata.block_count = Ragel.@int64_from_anchor!

        if (output.metadata.block_count > length(output.metadata.block_sizes))
            resize!(output.metadata.block_sizes, output.metadata.block_count)
        end

        if (output.metadata.block_count > length(output.metadata.block_firsts))
            resize!(output.metadata.block_firsts, output.metadata.block_count)
        end

	output.metadata.used_fields += 1
@goto st40
@label ctr55
	if input.block_size_idx > length(output.metadata.block_sizes)
            error("More size blocks encountered than BED block count field suggested.")
        end
        output.metadata.block_sizes[input.block_size_idx] = Ragel.@int64_from_anchor!
        input.block_size_idx += 1

	output.metadata.used_fields += 1
@goto st40
@label ctr60
	if input.block_first_idx > length(output.metadata.block_firsts)
            error("More start blocks encountered than BED block count field suggested.")
        end
        output.metadata.block_firsts[input.block_first_idx] = 1 + Ragel.@int64_from_anchor!
        input.block_first_idx += 1

	output.metadata.used_fields += 1
@goto st40
@label st40
p+= 1;
	if p == pe
	@goto _test_eof40

end
@label st_case_40
@goto ctr65
@label ctr13
	output.last = Ragel.@load_from_anchor!(UInt32)
	Ragel.@anchor!
@goto st13
@label st13
p+= 1;
	if p == pe
	@goto _test_eof13

end
@label st_case_13
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr14
@case 9
@goto ctr15

end
if 32 <= ( data[1 + p ]) && ( data[1 + p ]) <= 126
	@goto st13

end
@goto st0
@label ctr15
	Ragel.@copy_from_anchor!(output.metadata.name)
	output.metadata.used_fields += 1
@goto st14
@label st14
p+= 1;
	if p == pe
	@goto _test_eof14

end
@label st_case_14
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr17

end
@goto st0
@label ctr17
	Ragel.@anchor!
@goto st15
@label st15
p+= 1;
	if p == pe
	@goto _test_eof15

end
@label st_case_15
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr18
@case 9
@goto ctr19

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st15

end
@goto st0
@label ctr19
	output.metadata.score = Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
@goto st16
@label st16
p+= 1;
	if p == pe
	@goto _test_eof16

end
@label st_case_16
@switch ( data[1 + p ])  begin
    @case 43
@goto ctr21
@case 63
@goto ctr21

end
if 45 <= ( data[1 + p ]) && ( data[1 + p ]) <= 46
	@goto ctr21

end
@goto st0
@label ctr21
	output.strand = convert(Strand, (Ragel.@char))
@goto st17
@label st17
p+= 1;
	if p == pe
	@goto _test_eof17

end
@label st_case_17
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr22
@case 9
@goto ctr23

end
@goto st0
@label ctr23
	output.metadata.used_fields += 1
@goto st18
@label st18
p+= 1;
	if p == pe
	@goto _test_eof18

end
@label st_case_18
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr24

end
@goto st0
@label ctr24
	Ragel.@anchor!
@goto st19
@label st19
p+= 1;
	if p == pe
	@goto _test_eof19

end
@label st_case_19
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr25
@case 9
@goto ctr26

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st19

end
@goto st0
@label ctr26
	output.metadata.thick_first = 1 + Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
@goto st20
@label st20
p+= 1;
	if p == pe
	@goto _test_eof20

end
@label st_case_20
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr28

end
@goto st0
@label ctr28
	Ragel.@anchor!
@goto st21
@label st21
p+= 1;
	if p == pe
	@goto _test_eof21

end
@label st_case_21
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr29
@case 9
@goto ctr30

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st21

end
@goto st0
@label ctr30
	output.metadata.thick_last = Ragel.@int64_from_anchor!
	output.metadata.used_fields += 1
@goto st22
@label st22
p+= 1;
	if p == pe
	@goto _test_eof22

end
@label st_case_22
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr32

end
@goto st0
@label ctr32
	Ragel.@anchor!
@goto st23
@label st23
p+= 1;
	if p == pe
	@goto _test_eof23

end
@label st_case_23
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr33
@case 9
@goto ctr34
@case 11
@goto ctr35
@case 32
@goto ctr35
@case 44
@goto ctr36

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st23

end
@goto st0
@label ctr34
	input.red = input.green = input.blue = (Ragel.@int64_from_anchor!) / 255.0
	output.metadata.item_rgb = RGB{Float32}(input.red, input.green, input.blue)
	output.metadata.used_fields += 1
@goto st24
@label st24
p+= 1;
	if p == pe
	@goto _test_eof24

end
@label st_case_24
@switch ( data[1 + p ])  begin
    @case 9
@goto st25
@case 11
@goto st25
@case 32
@goto st25
@case 44
@goto st26

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr40

end
@goto st0
@label ctr35
	input.red = input.green = input.blue = (Ragel.@int64_from_anchor!) / 255.0
@goto st25
@label st25
p+= 1;
	if p == pe
	@goto _test_eof25

end
@label st_case_25
@switch ( data[1 + p ])  begin
    @case 9
@goto st25
@case 11
@goto st25
@case 32
@goto st25
@case 44
@goto st26

end
@goto st0
@label ctr36
	input.red = input.green = input.blue = (Ragel.@int64_from_anchor!) / 255.0
@goto st26
@label st26
p+= 1;
	if p == pe
	@goto _test_eof26

end
@label st_case_26
@switch ( data[1 + p ])  begin
    @case 9
@goto st26
@case 11
@goto st26
@case 32
@goto st26

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr41

end
@goto st0
@label ctr41
	Ragel.@anchor!
@goto st27
@label st27
p+= 1;
	if p == pe
	@goto _test_eof27

end
@label st_case_27
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr42
@case 11
@goto ctr42
@case 32
@goto ctr42
@case 44
@goto ctr43

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st27

end
@goto st0
@label ctr42
	input.green = (Ragel.@int64_from_anchor!) / 255.0
@goto st28
@label st28
p+= 1;
	if p == pe
	@goto _test_eof28

end
@label st_case_28
@switch ( data[1 + p ])  begin
    @case 9
@goto st28
@case 11
@goto st28
@case 32
@goto st28
@case 44
@goto st29

end
@goto st0
@label ctr43
	input.green = (Ragel.@int64_from_anchor!) / 255.0
@goto st29
@label st29
p+= 1;
	if p == pe
	@goto _test_eof29

end
@label st_case_29
@switch ( data[1 + p ])  begin
    @case 9
@goto st29
@case 11
@goto st29
@case 32
@goto st29

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr47

end
@goto st0
@label ctr47
	Ragel.@anchor!
@goto st30
@label st30
p+= 1;
	if p == pe
	@goto _test_eof30

end
@label st_case_30
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr48
@case 9
@goto ctr49

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st30

end
@goto st0
@label ctr49
	input.blue = (Ragel.@int64_from_anchor!) / 255.0
	output.metadata.item_rgb = RGB{Float32}(input.red, input.green, input.blue)
	output.metadata.used_fields += 1
@goto st31
@label st31
p+= 1;
	if p == pe
	@goto _test_eof31

end
@label st_case_31
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr40

end
@goto st0
@label ctr40
	Ragel.@anchor!
@goto st32
@label st32
p+= 1;
	if p == pe
	@goto _test_eof32

end
@label st_case_32
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr51
@case 9
@goto ctr52

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st32

end
@goto st0
@label ctr52
	output.metadata.block_count = Ragel.@int64_from_anchor!

        if (output.metadata.block_count > length(output.metadata.block_sizes))
            resize!(output.metadata.block_sizes, output.metadata.block_count)
        end

        if (output.metadata.block_count > length(output.metadata.block_firsts))
            resize!(output.metadata.block_firsts, output.metadata.block_count)
        end

	output.metadata.used_fields += 1
@goto st33
@label st33
p+= 1;
	if p == pe
	@goto _test_eof33

end
@label st_case_33
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr54

end
@goto st0
@label ctr54
	Ragel.@anchor!
@goto st34
@label st34
p+= 1;
	if p == pe
	@goto _test_eof34

end
@label st_case_34
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr55
@case 9
@goto ctr56
@case 44
@goto ctr57

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st34

end
@goto st0
@label ctr63
	output.metadata.used_fields += 1
@goto st35
@label ctr56
	if input.block_size_idx > length(output.metadata.block_sizes)
            error("More size blocks encountered than BED block count field suggested.")
        end
        output.metadata.block_sizes[input.block_size_idx] = Ragel.@int64_from_anchor!
        input.block_size_idx += 1

	output.metadata.used_fields += 1
@goto st35
@label st35
p+= 1;
	if p == pe
	@goto _test_eof35

end
@label st_case_35
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr59

end
@goto st0
@label ctr59
	Ragel.@anchor!
@goto st36
@label st36
p+= 1;
	if p == pe
	@goto _test_eof36

end
@label st_case_36
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr60
@case 44
@goto ctr61

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto st36

end
@goto st0
@label ctr61
	if input.block_first_idx > length(output.metadata.block_firsts)
            error("More start blocks encountered than BED block count field suggested.")
        end
        output.metadata.block_firsts[input.block_first_idx] = 1 + Ragel.@int64_from_anchor!
        input.block_first_idx += 1

@goto st37
@label st37
p+= 1;
	if p == pe
	@goto _test_eof37

end
@label st_case_37
if ( data[1 + p ]) == 0
	@goto ctr22

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr59

end
@goto st0
@label ctr57
	if input.block_size_idx > length(output.metadata.block_sizes)
            error("More size blocks encountered than BED block count field suggested.")
        end
        output.metadata.block_sizes[input.block_size_idx] = Ragel.@int64_from_anchor!
        input.block_size_idx += 1

@goto st38
@label st38
p+= 1;
	if p == pe
	@goto _test_eof38

end
@label st_case_38
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr22
@case 9
@goto ctr63

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57
	@goto ctr54

end
@goto st0
@label st_out
@label _test_eof1
cs = 1; @goto _test_eof
@label _test_eof2
cs = 2; @goto _test_eof
@label _test_eof3
cs = 3; @goto _test_eof
@label _test_eof4
cs = 4; @goto _test_eof
@label _test_eof5
cs = 5; @goto _test_eof
@label _test_eof6
cs = 6; @goto _test_eof
@label _test_eof7
cs = 7; @goto _test_eof
@label _test_eof8
cs = 8; @goto _test_eof
@label _test_eof9
cs = 9; @goto _test_eof
@label _test_eof10
cs = 10; @goto _test_eof
@label _test_eof11
cs = 11; @goto _test_eof
@label _test_eof12
cs = 12; @goto _test_eof
@label _test_eof40
cs = 40; @goto _test_eof
@label _test_eof13
cs = 13; @goto _test_eof
@label _test_eof14
cs = 14; @goto _test_eof
@label _test_eof15
cs = 15; @goto _test_eof
@label _test_eof16
cs = 16; @goto _test_eof
@label _test_eof17
cs = 17; @goto _test_eof
@label _test_eof18
cs = 18; @goto _test_eof
@label _test_eof19
cs = 19; @goto _test_eof
@label _test_eof20
cs = 20; @goto _test_eof
@label _test_eof21
cs = 21; @goto _test_eof
@label _test_eof22
cs = 22; @goto _test_eof
@label _test_eof23
cs = 23; @goto _test_eof
@label _test_eof24
cs = 24; @goto _test_eof
@label _test_eof25
cs = 25; @goto _test_eof
@label _test_eof26
cs = 26; @goto _test_eof
@label _test_eof27
cs = 27; @goto _test_eof
@label _test_eof28
cs = 28; @goto _test_eof
@label _test_eof29
cs = 29; @goto _test_eof
@label _test_eof30
cs = 30; @goto _test_eof
@label _test_eof31
cs = 31; @goto _test_eof
@label _test_eof32
cs = 32; @goto _test_eof
@label _test_eof33
cs = 33; @goto _test_eof
@label _test_eof34
cs = 34; @goto _test_eof
@label _test_eof35
cs = 35; @goto _test_eof
@label _test_eof36
cs = 36; @goto _test_eof
@label _test_eof37
cs = 37; @goto _test_eof
@label _test_eof38
cs = 38; @goto _test_eof
@label _test_eof
if p == eof
	@switch cs  begin
    @case 40
	input.block_size_idx = 1
        input.block_first_idx = 1

        yield = true
        # // fbreak causes will cause the pushmark action for the next seqname
        # // to be skipped, so we do it here
        Ragel.@anchor!
        	p+= 1; cs = 0; @goto _out




	break;

end

end
@label _out
end)


