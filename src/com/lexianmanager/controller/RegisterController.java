package com.lexianmanager.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lexianmanager.po.Manager;
import com.lexianmanager.po.Store;
import com.lexianmanager.po.User;
import com.lexianmanager.service.*;

@Controller
public class RegisterController {

	@Autowired
	RegisterService registerService;
	
	@Autowired
	StoreService storeService;

	@RequestMapping("/Mregister")
	public ModelAndView mRegister(HttpServletRequest request) throws Exception {
		// 判定用户是否已存在
		ModelAndView modelAndView = new ModelAndView();
		Manager manager1 = new Manager();
		manager1.setM_phone(request.getParameter("phe"));
		Manager manager = registerService.findByPhone(manager1);
		if(request.getParameter("phe").length() != 11)
		{
			modelAndView.setViewName("items/reg");
			modelAndView.addObject("fail", "请输入正确的手机号码！！！");
			return modelAndView;
		}

		if (manager != null) {
			// 注册失败
			modelAndView.setViewName("items/reg");
			System.out.println("注册失败！！");
			modelAndView.addObject("fail", "账户已存在！！！");
		} else if (request.getParameter("pwd").equals(request.getParameter("checkpwd"))){
			Store store = storeService.findStoreById(Integer.parseInt(request.getParameter("sto_no")));
			if(store!=null){
				// 注册成功
				Manager manager2 = new Manager();
				manager2.setM_phone(request.getParameter("phe"));
				manager2.setM_password(request.getParameter("pwd"));
				manager2.setSto_no(request.getParameter("num"));

				registerService.setManager(manager2);
				modelAndView.setViewName("items/admin_login");
			}
			else{
				modelAndView.setViewName("items/reg");
				modelAndView.addObject("fail", "商店编号不存在！！！");
			}
		}
		else{
			modelAndView.setViewName("items/reg");
			modelAndView.addObject("fail", "密码输入不相同！！！");
		}

		return modelAndView;

	}

	@RequestMapping("/Uregister")
	public ModelAndView uRegister(HttpServletRequest request) throws Exception {
		// 判定用户是否已存在
		ModelAndView modelAndView = new ModelAndView();
		User user = new User();
		user.setU_phone(request.getParameter("u_phone"));
		User getuser = registerService.findByPhone(user);
		if(request.getParameter("u_phone").length() != 11)
		{
			modelAndView.setViewName("items/userReg");
			modelAndView.addObject("fail", "请输入正确的手机号码！！！");
			return modelAndView;
		}
		if (getuser != null) {
			// 注册失败
			modelAndView.setViewName("items/userReg");
			modelAndView.addObject("fail", "账号已存在！！！");
		} else if (request.getParameter("pwd").equals(request.getParameter("checkpwd"))) {
			// 注册成功
			User user1 = new User();
			user1.setU_phone(request.getParameter("u_phone"));
			user1.setMail(request.getParameter("mail"));
			user1.setU_password(request.getParameter("pwd"));

			registerService.setUser(user1);
			modelAndView.setViewName("items/user_login");
		} else {// 注册失败
			modelAndView.setViewName("items/userReg");
			modelAndView.addObject("fail", "密码输入不相同！！！");
		}

		return modelAndView;

	}

}
