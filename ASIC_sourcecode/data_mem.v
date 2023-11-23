//////////////////////////////////////////////////////////////////////////////////
// School: Korea Univ
// Engineer: Ahn Jin mo
// Cource : ASIC design
// 
/////////////////////////////////////////////////////////////////////////////////
module data_mem (
    input wire i_clk, we,
    input wire [31:0] i_data,
    input wire [31:0] i_addr,
    output wire [31:0] o_data,
    output wire [31:0] ram1,
    output wire [31:0] ram2,
    output wire [31:0] ram3
);


    reg [31:0] ram [0:31];
    assign ram1 = ram[0];
    assign ram2 = ram[1];
    assign ram3 = ram[2];
    
    always @(posedge i_clk)
    begin
        if(we)
            ram[i_addr[4:0]] = i_data;
    end
    
    integer i;
    initial
    begin
        for(i=0;i<32;i=i+1)
            ram[i] = 0;
    end
    
    assign o_data = ram[i_addr[4:0]];

endmodule
