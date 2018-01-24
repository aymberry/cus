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

	//첫화면
	@RequestMapping("/Main/MainPage")	
	public String mainPage() {
		return "Main/MainPage";
	}
	
	
	//검색
	@RequestMapping("/Main/SearchProc")
	public ModelAndView searchProc(MainVo mVo) {
		//파라메터 받고
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
		// 검색하고
		ArrayList list= mSer.searchProc(what);
		// 결과본다
		ModelAndView mv = new ModelAndView();
		mv.addObject("LIST", list);
		mv.setViewName("Main/MainPage");

		System.out.println("con__"+list);
		return mv;	
	}

	//상세보기
	@RequestMapping("/Main/DetailView")
	public ModelAndView dView(MainVo mVo) {
		//	파라메터 받고
		String bnum= mVo.getBnum();
		System.out.println("con__상세조회시작__bnum__"+bnum);
		//	상세 내용 구하고
		HashMap	map = mSer.dView(bnum);
		//	뷰
		ModelAndView	mv = new ModelAndView();
		mv.addObject("MAP", map);
		mv.setViewName("Main/MainPage");
		return mv;
	}
	
	//수정요청
	@RequestMapping("/Main/ModifyProc")
	public ModelAndView modifyProc(MainVo mVo) {
		System.out.println("con__수정시작__"+mVo.getTrade_stop()+"__"+mVo.getCharge_person());
		System.out.println("con__수정시작__"+mVo.getCo_yn()+"__"+mVo.getTax_yn());
		System.out.println("con__param__"+mVo.getBnum());
		MainVo vo= mSer.modifyProc(mVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("MVO", mVo);
		mv.setViewName("Main/MainPage");
		return mv;
	}
	

	
}
