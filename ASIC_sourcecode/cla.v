`timescale 1ns / 1ns

//////////////////////////////////////////////////////////////////////////////////
// School: Korea Univ
// Engineer: Ahn Jin mo
// Cource : ASIC design
// 
/////////////////////////////////////////////////////////////////////////////////

module cla_32bit (
    input wire [31:0] a, b, // 32-bit inputs
    input wire c_in,        // carry in
    output wire [31:0] sum, // sum result
    output wire c_out       // carry out
    );
    
    wire carry; // carry signal between cla_16 units
    
    cla_16bit cla16_unit0 (
        .a(a[15:0]), .b(b[15:0]), // 4-bit inputs
        .c_in(c_in),
        .sum(sum[15:0]),
        .c_out(carry)
    );
    
    cla_16bit cla16_unit1 (
        .a(a[31:16]), .b(b[31:16]), // 4-bit inputs
        .c_in(carry),
        .sum(sum[31:16]),
        .c_out(c_out)
    );
    
endmodule

module cla_4bit (
    input wire [3:0] i_a, i_b, // 4-bit inputs
    input wire c_in,
    output wire [3:0] o_sum,
    output wire c_out
);

    wire [3:0] g, p; // generate and propogate terms
    wire [2:0] c; // carry
    
    assign g = i_a & i_b;
    assign p = i_a ^ i_b;
    
    // CLA carry terms
    assign c[0] = g[0] | (p[0] & c_in); 
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c_in);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c_in);
    assign c_out = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c_in);

    // CLA sum
    assign o_sum = p ^ {c,c_in}; // sum = p XOR carry including carry in

endmodule

module cla_16bit(
    input wire [15:0] a, b, // 16-bit inputs
    input wire c_in,
    output wire [15:0] sum,
    output wire c_out
    );
    
    wire carry; // carry signals between cla_8bit units
    
    cla_8bit cla8_unit0 (
        .a(a[7:0]), .b(b[7:0]), // 8-bit inputs
        .c_in(c_in),
        .sum(sum[7:0]),
        .c_out(carry)
    );
    
    cla_8bit cla8_unit1 (
        .a(a[15:8]), .b(b[15:8]), // 8-bit inputs
        .c_in(carry),
        .sum(sum[15:8]),
        .c_out(c_out)
    );
    
endmodule

module cla_8bit (
    input wire [7:0] a, b, // 8-bit inputs
    input wire c_in,
    output wire [7:0] sum,
    output wire c_out
);
    
     wire carry; // carry signals between cla_4bit units
    
    cla_4bit cla4_unit0 (
        .i_a(a[3:0]), .i_b(b[3:0]), // 4-bit inputs
        .c_in(c_in),
        .o_sum(sum[3:0]),
        .c_out(carry)
    );
    
    cla_4bit cla4_unit1 (
        .i_a(a[7:4]), .i_b(b[7:4]), // 4-bit inputs
        .c_in(carry),
        .o_sum(sum[7:4]),
        .c_out(c_out)
    );
    
endmodule

