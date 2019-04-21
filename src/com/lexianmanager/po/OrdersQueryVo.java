package com.lexianmanager.po;

import java.math.BigDecimal;

public class OrdersQueryVo {
	private int o_id;
	private String sto_no;
	private BigDecimal totalamount;
	private String o_states;
	private String o_no;
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public String getSto_no() {
		return sto_no;
	}
	public void setSto_no(String sto_no) {
		this.sto_no = sto_no;
	}
	public BigDecimal getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(BigDecimal totalamount) {
		this.totalamount = totalamount;
	}
	public String getO_states() {
		return o_states;
	}
	public void setO_states(String o_states) {
		this.o_states = o_states;
	}
	public String getO_no() {
		return o_no;
	}
	public void setO_no(String o_no) {
		this.o_no = o_no;
	}

}
