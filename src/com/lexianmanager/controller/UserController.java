package com.lexianmanager.controller;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lexianmanager.po.*;

import com.lexianmanager.service.UserService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	@RequestMapping("/myHome")
	public ModelAndView myHome(HttpServletRequest request) throws Exception {
		String u_phone=request.getParameter("u_phone");//获取用户手机号
		System.out.println(u_phone);
		int u_id=userService.selectIdByPhone(u_phone);		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("users/myHome");//通过手机号查询到用户id并返回
		modelAndView.addObject("u_id", u_id);

		return modelAndView;
	}
	@RequestMapping("/myInfo")
	public ModelAndView userInfo(HttpServletRequest request) throws Exception {
		
		int u_id=Integer.parseInt(request.getParameter("u_id"));//获取用户id
		System.out.println(u_id);
		UserInfoVo userInfoVo=new UserInfoVo();			
		User user=userService.findInfo(u_id);//通过用户id查询并返回用户
		
		userInfoVo.setU_name(user.getU_name());
		userInfoVo.setU_phone(user.getU_phone());
		userInfoVo.setSex(user.getSex());
		userInfoVo.setMail(user.getMail());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("users/myInfo");
		modelAndView.addObject("userInfoVo", userInfoVo);

		return modelAndView;
	}
	@RequestMapping("/myOrder")
	public ModelAndView userOrder(HttpServletRequest request) throws Exception {
		int u_id=Integer.parseInt(request.getParameter("u_id"));
		System.out.println(u_id);
		List<OrdersQueryVo> ordersQueryVoList=userService.selectAllOrderByU_id(u_id);//通过用户id查询所有该id下的订单
		List<OrdersUserVo> orderUserVoList=new ArrayList<OrdersUserVo>();//创建所有我的订单要显示信息的List
		for(OrdersQueryVo o:ordersQueryVoList){//每个订单一个OrdersUserVo实体
			OrdersUserVo ordersUserVo=new OrdersUserVo();
			int o_id=o.getO_id();
			String sto_no=o.getSto_no();
			OrdersQueryVo ordersQueryVo=new OrdersQueryVo();
			ordersQueryVo.setO_id(o_id);
			ordersQueryVo.setSto_no(sto_no);
			ordersUserVo.setTotalamount(o.getTotalamount());
			ordersUserVo.setO_no(o.getO_no());
			ordersUserVo.setO_states(o.getO_states());
			ordersUserVo.setSto_name(userService.selectStoByNo(ordersQueryVo).getSto_name());
			ordersUserVo.setSto_add(userService.selectStoByNo(ordersQueryVo).getSto_add());
			ordersUserVo.setOrdersUserComListVo(userService.selectOrderById(ordersQueryVo));//获取该订单下所有商品的List
			orderUserVoList.add(ordersUserVo);			
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("orderUserVoList",orderUserVoList);
		modelAndView.setViewName("users/myOrder");
		return modelAndView;
	}
	
	@RequestMapping("/updateInfo")
	public void updateInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		StringBuffer json = new StringBuffer();//获取前台用户修改的信息
		String lineString = null;
		BufferedReader reader = request.getReader();
		while ((lineString = reader.readLine()) != null) {
			json.append(lineString);
		}
		JSONArray jsonArray = JSONArray.fromObject(json.toString());
		Object[] os = jsonArray.toArray();
		JSONObject jsonObj = JSONObject.fromObject(os[0]);
		// System.out.println(jsonObj);
		UserInfoVo userInfoVo=new UserInfoVo();
		userInfoVo.setU_name(jsonObj.get("editMyName").toString());
		userInfoVo.setU_phone(jsonObj.get("editMyPhone").toString());
		userInfoVo.setSex(jsonObj.get("editMySex").toString());
		userInfoVo.setMail(jsonObj.get("editMyEmail").toString());
		

		userService.updateInfo(userInfoVo);//修改用户数据库信息
	
		PrintWriter pw = response.getWriter();
		pw.write(jsonArray.toString());
		pw.flush();
	}
	
	
	
}
