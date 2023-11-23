//////////////////////////////////////////////////////////////////////////////////
// School: Korea Univ
// Engineer: Ahn Jin mo
// Cource : ASIC design
// 
/////////////////////////////////////////////////////////////////////////////////

module regfile (
    input wire clk, resetn,
    input wire [4:0] rs1, rs2, rd, // register source 1, 2; register destination
    input wire reg_write,
    input wire [31:0] write_data,
    output wire [31:0] read_data1, read_data2,
    output reg [31:0] x0,
    output wire [31:0] x1,
    output wire [31:0] x2,
    output wire [31:0] x3,
    output wire [31:0] x4,
    output wire [31:0] x5,
    output wire [31:0] x6,
    output wire [31:0] x7,
    output wire [31:0] x8,
    output wire [31:0] x9,
    output wire [31:0] x10,
    output wire [31:0] x11,
    output wire [31:0] x12,
    output wire [31:0] x13,
    output wire [31:0] x14,
    output wire [31:0] x15,
    output wire [31:0] x16,
    output wire [31:0] x17,
    output wire [31:0] x18,
    output wire [31:0] x19,
    output wire [31:0] x20,
    output wire [31:0] x21,
    output wire [31:0] x22,
    output wire [31:0] x23,
    output wire [31:0] x24,
    output wire [31:0] x25,
    output wire [31:0] x26,
    output wire [31:0] x27,
    output wire [31:0] x28,
    output wire [31:0] x29,
    output wire [31:0] x30,
    output wire [31:0] x31
);
    integer i;
    reg [31:0] reg_file [0:31]; 
    assign x1 = reg_file[1];
    assign x2 = reg_file[2];
    assign x3 = reg_file[3];
    assign x4 = reg_file[4];
    assign x5 = reg_file[5];
    assign x6 = reg_file[6];
    assign x7 = reg_file[7];
    assign x8 = reg_file[8];
    assign x9 = reg_file[9];
    assign x10 = reg_file[10];
    assign x11 = reg_file[11];
    assign x12 = reg_file[12];
    assign x13 = reg_file[13];
    assign x14 = reg_file[14];
    assign x15 = reg_file[15];
    assign x16 = reg_file[16];
    assign x17 = reg_file[17];
    assign x18 = reg_file[18];
    assign x19 = reg_file[19];
    assign x21 = reg_file[21];
    assign x22 = reg_file[22];
    assign x23 = reg_file[23];
    assign x24 = reg_file[24];
    assign x25 = reg_file[25];
    assign x26 = reg_file[26];
    assign x27 = reg_file[27];
    assign x28 = reg_file[28];
    assign x29 = reg_file[29];
    assign x31 = reg_file[31];
    assign x30 = reg_file[30];
    assign x20 = reg_file[20];    
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn) begin
            x0 <=0;
        end
        else begin
            x0 <= 0; 
    end


    end

    // write data
    always @(posedge clk or negedge resetn)
    begin
        if(!resetn)
            for (i= 0; i<32; i = i+1)
                reg_file[i] <= 0;
        else if(reg_write & (rd != 0))
            reg_file[rd] <= write_data; 
    end 

    // read data
    assign read_data1 = (rs1 == 0) ? 0 : reg_file[rs1]; // reg_file[0] hardwired to 0
    assign read_data2 = (rs2 == 0) ? 0 : reg_file[rs2];

endmodule