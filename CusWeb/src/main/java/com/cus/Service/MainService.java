package com.cus.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.cus.Dao.MainDao;
import com.cus.Vo.MainVo;

public class MainService {

	@Autowired
	public MainDao mDao;
	//검색
	public ArrayList searchProc(String what) {
		System.out.println("ser__what__"+what);
		ArrayList list= mDao.searchProc(what);
		
		System.out.println("ser__리스트__"+list.size()+"__"+list);
		return list;
	}
	//상세보기
	public HashMap dView(String bnum) {
		//	상세보기 내용을 꺼내야 하고
		MainVo 	vo = mDao.getdView(bnum);
		System.out.println("ser__ceo__"+vo.getCeo());
		HashMap	map = new HashMap();
		map.put("VIEW", vo);
		return map;
		
	}
	//수정
	public MainVo modifyProc(MainVo mVo) {
		return mDao.updateProc(mVo);
	}



}
