package com.lexianmanager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lexianmanager.po.Commodity;
import com.lexianmanager.po.Orders;
import com.lexianmanager.po.Store;
import com.lexianmanager.po.User;

@Service
public interface GetInformationService {
	//用户类
	String getUserId(String u_phone);
	User findUserByPhone(User user);
	int modifyByPhone(User user);
	List<User> findAllUser();
	//门店类
	List<Store> findAllStore();
	//商品类
	List<Commodity> findAllCommodity();
	void insertCommodity(Commodity commodity);
	void deleteCommodity(String com_no);
	String selectCommodityId(String com_no);
	void updateCommodity(Commodity commodity);
	String findCat_name(int cat_id);
	//订单类
	List<Orders> findAllOrder();
	void updateOrderStates(String o_no,String paymenttype,String deliverytype,String o_states);
	void deleteOrder(String o_no);
	int getO_id(String o_no);
	void deleteOrderItemByO_id(int o_id);
}
