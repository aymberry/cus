package com.cus.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.cus.Service.MainService;
import com.cus.Vo.MainVo;

@Controller
public class MainController {
	
	@Autowired
	public MainService mSer;

	//ùȭ��
	@RequestMapping("/Main/MainPage")	
	public String mainPage() {
		return "Main/MainPage";
	}
	
	
	//�˻�
	@RequestMapping("/Main/SearchProc")
	public ModelAndView searchProc(MainVo mVo) {
		//�Ķ���� �ް�
		String bnum= mVo.getBnum();
		String cname= mVo.getCname();
		String what= "";
		System.out.println("con__cname__"+cname);
		
		if(bnum != null) {
			what= bnum;
			cname= "n";
		} else if(cname != null){
			what= cname;
			bnum= "n";
		}
		// �˻��ϰ�
		ArrayList list= mSer.searchProc(what);
		// �������
		ModelAndView mv = new ModelAndView();
		mv.addObject("LIST", list);
		mv.setViewName("Main/MainPage");

		System.out.println("con__"+list);
		return mv;	
	}

	//�󼼺���
	@RequestMapping("/Main/DetailView")
	public ModelAndView dView(MainVo mVo) {
		//	�Ķ���� �ް�
		String bnum= mVo.getBnum();
		System.out.println("con__����ȸ����__bnum__"+bnum);
		//	�� ���� ���ϰ�
		HashMap	map = mSer.dView(bnum);
		//	��
		ModelAndView	mv = new ModelAndView();
		mv.addObject("MAP", map);
		mv.setViewName("Main/MainPage");
		return mv;
	}
	
	//������û
	@RequestMapping("/Main/ModifyProc")
	public ModelAndView modifyProc(MainVo mVo) {
		System.out.println("con__��������__"+mVo.getTrade_stop()+"__"+mVo.getCharge_person());
		System.out.println("con__��������__"+mVo.getCo_yn()+"__"+mVo.getTax_yn());
		System.out.println("con__param__"+mVo.getBnum());
		MainVo vo= mSer.modifyProc(mVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("MVO", mVo);
		mv.setViewName("Main/MainPage");
		return mv;
	}
	

	
}
