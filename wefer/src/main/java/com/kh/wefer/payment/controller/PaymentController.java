package com.kh.wefer.payment.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wefer.HomeController;
import com.kh.wefer.payment.model.domain.Annual;
import com.kh.wefer.payment.model.domain.Payment;
import com.kh.wefer.payment.model.service.AnnualService;
import com.kh.wefer.payment.model.service.PaymentService;

@Controller
public class PaymentController {

	@Autowired
	private AnnualService aService;
	@Autowired
	private PaymentService pmService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/approval.do", method = RequestMethod.GET)
	public ModelAndView apprlist(Locale locale, ModelAndView mv) {
		logger.info("Welcome home! The client locale is {}.", locale);
		mv.addObject("pmlist", pmService.paymentList());
		mv.setViewName("approval/apprlist");
		return mv;
	}
	
	// 글 작성 jsp
	@RequestMapping(value = "/apprForm.do", method = RequestMethod.GET)
	public String apprform(ModelAndView mv) {
		return "approval/apprform";
	}

	// jsp에서 작성된 글을 pInsert.do에 insert
	@RequestMapping(value = "/aInsert.do")
	public String annualInsert(Annual a, HttpSession session, HttpServletRequest request) {
		try {
			System.out.println(a);
			a.setId((String) session.getAttribute("loginId"));
			aService.insertAnnual(a);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:approval.do";
		
	}

	@RequestMapping(value = "/apprDetail.do", method = RequestMethod.GET)
	public String apprdetail(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "approval/apprdetail";
	}

}
