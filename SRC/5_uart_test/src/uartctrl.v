`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module name    uartctrl.v
// ˵����          ������ڽ��յ����ݣ����ͽ��յ������ݵ����ڣ����û�н��յ����ݣ�Ĭ�ϲ��ϵķ���
//                �洢���ַ�����������Ϊ9600�����żУ�飬ֹͣλΪ1��
//////////////////////////////////////////////////////////////////////////////////
module uartctrl(
      input                   clk,
	  input                   rdsig,                //���ڽ���������Ч�ź�
	  input      [7:0]        rxdata,               //���ڽ�������
	  output                  wrsig,                //���ڷ���ָʾ�ź�
	  output     [7:0]        dataout               //���ڷ�������


);

reg [17:0] uart_wait;
reg [15:0] uart_cnt;
reg rx_data_valid;
reg [7:0] store [20:0];                        //�洢�����ַ�
reg [2:0] uart_stat;                           //uart״̬��
reg [8:0] k;                                   //����ָʾ���͵ĵڼ�������
reg [7:0] dataout_reg;
reg data_sel;
reg wrsig_reg;

  
assign dataout = data_sel ?  dataout_reg : rxdata ;            //��������ѡ��data_sel�ߣ�ѡ��洢���ַ�����data_sel���ͣ�ѡ����յ�����
assign wrsig = data_sel ?  wrsig_reg : rdsig;                  //��������ѡ��data_sel�ߣ����ʹ洢���ַ�����data_sel���ͣ����ͽ��յ�����


//�洢����Ҫ���͵��ַ���
always @(*)
begin     //���巢�͵��ַ�
	 store[0]<=72;                           //�洢�ַ�H
	 store[1]<=101;                          //�洢�ַ�e
	 store[2]<=108;                          //�洢�ַ�l
	 store[3]<=108;                          //�洢�ַ�l
	 store[4]<=111;                          //�洢�ַ�o                         
	 store[5]<=32;                           //�洢�ַ��ո�
	 store[6]<=65;                           //�洢�ַ�A
	 store[7]<=76;                           //�洢�ַ�L
	 store[8]<=73;                           //�洢�ַ�I
	 store[9]<=78;                           //�洢�ַ�N
	 store[10]<=88;                          //�洢�ַ�X
	 store[11]<=32;                          //�洢�ַ��ո�
	 store[12]<=65;                          //�洢�ַ�A
	 store[13]<=88;                          //�洢�ַ�X
	 store[14]<=55;                          //�洢�ַ�7
	 store[15]<=49;                          //�洢�ַ�1
	 store[16]<=48;                          //�洢�ַ�0
	 store[17]<=49;                          //�洢�ַ�1	 
	 store[18]<=32;                          //�洢�ַ��ո�
	 store[19]<=10;                          //���з�
	 store[20]<=13;                          //�س���
  end 
  
//���ڷ��Ϳ��ƣ�ÿ��һ��ʱ�����һ�������ַ���������  
always @(negedge clk)
begin
  if(rdsig == 1'b1) begin   //��������н��յ����ݣ�ֹͣ�����ַ���                        
		uart_wait <= 0;
		rx_data_valid <=1'b0;
  end
  else begin
    if (uart_wait ==18'h3ffff) begin                //�ȴ�һ��ʱ��(ÿ��һ��ʱ�䷢���ַ�����,������������Ըı䷢���ַ���֮���ʱ������
		uart_wait <= 0;
		rx_data_valid <=1'b1;	                      //�ȴ�ʱ�����������һ�������ַ�����Ч�ź�����
    end		
	 else begin
		uart_wait <= uart_wait+1'b1;
		rx_data_valid <=1'b0;
	 end
  end
end 
 
//////////////////////////////////////// 
//���ڷ����ַ������Ƴ������η��ʹ洢���ַ���//
////////////////////////////////////////	
always @(posedge clk)
begin
  if(rdsig == 1'b1) begin   
		uart_cnt <= 0;
		uart_stat <= 3'b000; 
		data_sel<=1'b0;
		k<=0;
  end
  else begin
  	 case(uart_stat)
	 3'b000: begin               
       if (rx_data_valid == 1'b1) begin  //�����ַ�����Ч�ź�Ϊ�ߣ���ʼ�����ַ���
		    uart_stat <= 3'b001; 
			 data_sel<=1'b1; 
		 end
	 end	
	 3'b001: begin                      //����21���ַ�   
         if (k == 19 ) begin           //���͵�20���ַ�      		 
				 if(uart_cnt ==0) begin
					dataout_reg <= store[19]; 
					uart_cnt <= uart_cnt + 1'b1;
					wrsig_reg <= 1'b1;      //�����ַ�ʹ������             			
				 end	
				 else if(uart_cnt ==254) begin    //�ȴ�һ���ַ�������ɣ�����һ���ַ���ʱ��Ϊ176��ʱ�ӣ���������ȴ���ʱ����Ҫ����176
					uart_cnt <= 0;
					wrsig_reg <= 1'b0; 				
					uart_stat <= 3'b010; 
					k <= 0;
				 end
				 else	begin			
					 uart_cnt <= uart_cnt + 1'b1;
					 wrsig_reg <= 1'b0;  
				 end
		  end
	     else begin                      //����ǰ19���ַ�   
				 if(uart_cnt ==0) begin      
					dataout_reg <= store[k]; 
					uart_cnt <= uart_cnt + 1'b1;
					wrsig_reg <= 1'b1;           //����ʹ��           			
				 end	
				 else if(uart_cnt ==254) begin    //�ȴ�һ�����ݷ�����ɣ�����һ���ַ���ʱ��Ϊ168��ʱ�ӣ���������ȴ���ʱ����Ҫ����168
					uart_cnt <= 0;
					wrsig_reg <= 1'b0; 
					k <= k + 1'b1;	               //k��1��������һ���ַ�        			
				 end
				 else	begin			
					 uart_cnt <= uart_cnt + 1'b1;
					 wrsig_reg <= 1'b0;  
				 end
		 end	 
	 end
	 3'b010: begin       //����finish	 
		 	uart_stat <= 3'b000;
			data_sel<=1'b0;	
	 end
	 default:uart_stat <= 3'b000;
    endcase 
  end
end

 
endmodule