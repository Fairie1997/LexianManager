package com.lexianmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lexianmanager.dao.CommodityDao;
import com.lexianmanager.po.CommodityInfoVo;
import com.lexianmanager.po.Commodity_store;
import com.lexianmanager.po.Store;
import com.lexianmanager.po.StoreManagerVo;

@Service
public class CommodityServiceImpl implements CommodityService {
	@Autowired CommodityDao commodityDao;
	
	@Override
	public CommodityInfoVo selectById(String com_no) {
		CommodityInfoVo commodityInfoVo=new CommodityInfoVo();
		commodityInfoVo.setCom_name(commodityDao.selectById(com_no).getCom_name());
		String pictureUrl=commodityDao.selectById(com_no).getPictureurl().substring(1);
		commodityInfoVo.setCom_no(com_no);
		commodityInfoVo.setPictureurl(pictureUrl);
		return commodityInfoVo;
	}

	@Override
	public List<Commodity_store> selectAllComByNo(String com_no) {
		
		return commodityDao.selectByCom_no(com_no);
	}

	@Override
	public Store selectByNo(String sto_no) {
		Store store=new Store();
		store.setSto_name(commodityDao.selectStoByNo(sto_no).getSto_name());
		store.setSto_add(commodityDao.selectStoByNo(sto_no).getSto_add());
		store.setLongitude(commodityDao.selectStoByNo(sto_no).getLongitude());
		store.setLatitude(commodityDao.selectStoByNo(sto_no).getLatitude());
		return store;
	}

}
