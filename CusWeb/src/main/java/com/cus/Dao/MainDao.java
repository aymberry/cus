package com.cus.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.cus.Vo.MainVo;

public class MainDao extends SqlSessionDaoSupport {
	@Autowired
	public SqlSessionTemplate sSession;
	//�˻�
	public ArrayList searchProc(String what) {
		System.out.println("dao__what__"+what);

//		TestVo tVo= new TestVo();
		ArrayList list= (ArrayList)sSession.selectList("mainpage.searchproc", what);
//		list.add(tVo.getBnum());
//		list.add(tVo.getCname());

		return list;
	}
	//�󼼰˻�
	public MainVo getdView(String bnum) {
		System.out.println("dao__param__"+bnum);
		return sSession.selectOne("mainpage.detailview", bnum);
	}
	//����
	public MainVo updateProc(MainVo mVo) {
		return sSession.selectOne("mainpage.updateproc", mVo);
	}
	
}
