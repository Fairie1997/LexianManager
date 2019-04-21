package com.lexianmanager.po;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class OrdersUserVo {
	private String sto_name;
	private String sto_add;
	private BigDecimal totalamount;
	private String o_states;
	private String o_no;
	private List<OrdersUserComListVo> ordersUserComListVo=new ArrayList<OrdersUserComListVo>();
	public String getSto_name() {
		return sto_name;
	}
	public List<OrdersUserComListVo> getOrdersUserComListVo() {
		return ordersUserComListVo;
	}
	public void setOrdersUserComListVo(List<OrdersUserComListVo> ordersUserComListVo) {
		this.ordersUserComListVo = ordersUserComListVo;
	}
	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}
	public String getSto_add() {
		return sto_add;
	}
	public void setSto_add(String sto_add) {
		this.sto_add = sto_add;
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
