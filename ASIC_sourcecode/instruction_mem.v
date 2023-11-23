//////////////////////////////////////////////////////////////////////////////////
// School: Korea Univ
// Engineer: Ahn Jin mo
// Cource : ASIC design
// 
/////////////////////////////////////////////////////////////////////////////////
module instruction_mem (
    input wire [31:0] i_addr,
    output wire [31:0] o_instr
);

    reg [31:0] rom [0:100];

    initial
    begin
        $readmemh("test_program1.txt", rom);
    end

    assign o_instr = rom[i_addr[31:2]];
                   

endmodule