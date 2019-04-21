package com.lexianmanager.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lexianmanager.po.*;
import com.lexianmanager.service.CommodityService;






@Controller
public class CommodityController {
	@Autowired 
	CommodityService commodityService;
	

	@RequestMapping("/commodity.action")
public ModelAndView commodityDetail(HttpServletRequest request) throws Exception{
		String com_no=request.getParameter("com_no");//点击商品得到商品编号
		CommodityInfoVo commodityInfoVo=commodityService.selectById(com_no);//通过编号获得商品基本信息
		List<Commodity_store> commodity_storeList=commodityService.selectAllComByNo(com_no);//查询所有拥有此商品的店铺
		List<Store> stoList=new ArrayList<Store>();
		for(Commodity_store com_sto:commodity_storeList) {//如果门店此商品库存大于0，则将此门店加入List显示
			Store store=new Store();
			if(com_sto.getCom_amount()>0) {
			store.setSto_add(commodityService.selectByNo(com_sto.getSto_no()).getSto_add());
			store.setSto_name(commodityService.selectByNo(com_sto.getSto_no()).getSto_name());
			store.setLongitude(commodityService.selectByNo(com_sto.getSto_no()).getLongitude());
			store.setLatitude(commodityService.selectByNo(com_sto.getSto_no()).getLatitude());
			stoList.add(store);
			}
		}
		Commodity_storeDetailVo commodity_storeDetailVo=new Commodity_storeDetailVo();
		commodity_storeDetailVo.setCommodity_storeList(commodity_storeList);//commodity_storeDetailVo内涵商品基本信息、拥有商品门店信息以及单价
		commodity_storeDetailVo.setStoList(stoList);
		commodity_storeDetailVo.setCommodityInfoVo(commodityInfoVo);
		ModelAndView modelAndView=new ModelAndView();
			modelAndView.setViewName("items/commodity");
			modelAndView.addObject("comDetail",commodity_storeDetailVo);
			modelAndView.addObject("com_no",com_no);
			System.out.println(commodity_storeDetailVo.getCommodityInfoVo().getCom_no());


		return modelAndView;
	
	
	}
	@RequestMapping("/stoMap.action")
	public ModelAndView map(HttpServletRequest request) throws Exception{
		double longitude=Double.parseDouble(request.getParameter("longitude"));
		double latitude=Double.parseDouble(request.getParameter("latitude"));
		String sto_name=request.getParameter("sto_name");
		String com_no=request.getParameter("com_no");
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("items/map");
		modelAndView.addObject("longitude",longitude);
		modelAndView.addObject("latitude",latitude);
		modelAndView.addObject("sto_name",sto_name);
		modelAndView.addObject("com_no",com_no);
		return modelAndView;
		
	
	
	}
}
