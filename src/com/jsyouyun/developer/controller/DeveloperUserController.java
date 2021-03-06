package com.jsyouyun.developer.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

import com.jsyouyun.developer.common.utils.DeveloperConstants;
import com.jsyouyun.developer.entity.DeveloperUser;
import com.jsyouyun.developer.entity.DeveloperDatum;
import com.jsyouyun.developer.entity.DeveloperModule;
import com.jsyouyun.developer.service.DeveloperService;

//import com.jsyouyun.developer.common.utils.ShiroUtils;

import org.apache.commons.io.IOUtils;
//import org.fkit.hrm.util.tag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * 处理开发者用户请求的控制器
 * */
@Controller
public class DeveloperUserController {
	
	/**
	 * 自动注入Service
	 * */
	@Autowired
	@Qualifier("developerService")
	private DeveloperService developerService;
	
	@Autowired
	private Producer producer;
	
	
	@RequestMapping("captcha.jpg")
	public void captcha(HttpServletResponse response, HttpSession session)throws ServletException, IOException {
		response.setHeader("Cache-Control", "no-store, no-cache");
		response.setContentType("image/jpeg");

		//生成文字验证码
		String text = producer.createText();
		//生成图片验证码
		BufferedImage image = producer.createImage(text);
		//保存到shiro session
	//	ShiroUtils.setSessionAttribute(Constants.KAPTCHA_SESSION_KEY, text);
		session.setAttribute(Constants.KAPTCHA_SESSION_KEY, text);

		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(image, "jpg", out);
		IOUtils.closeQuietly(out);
	}

		
	/**
	 * 处理登录请求
	 * @param String loginName  登录名
	 * @param String loginPwd 密码
	 * @return 跳转的视图
	 * */
	@RequestMapping(value="/developer/doLogin")
	 public ModelAndView login(@RequestParam("loginName") String loginName,
			 @RequestParam("loginPwd") String loginPwd,
			 @RequestParam("captcha") String captcha,
			 HttpSession session,
			 Model model,
			 ModelAndView mv){
		// 调用业务逻辑组件判断用户是否可以登录
		DeveloperUser developerUser = developerService.login(loginName, loginPwd);
		if(developerUser != null){
			// 将用户保存到HttpSession当中
			session.setAttribute(DeveloperConstants.DEVELOPER_SESSION, developerUser);
			// 设置Model数据
			//model.addAttribute("developerUser", developerUser);
			// 客户端跳转到main页面
		//	mv.addObject("developerUser", developerUser);
			mv.setViewName("redirect:/home");
			//return "main";
		}else{
			// 设置登录失败提示信息
			mv.addObject("message", "登录名或密码错误!请重新输入");
			// 服务器内部跳转到登录页面
			mv.setViewName("forward:/home");
		}
		return mv;
		
	}
	
	
	
	/**
	 * 处理查询请求
	 * @param pageIndex 请求的是第几页
	 * @param employee 模糊查询参数
	 * @param Model model
	 * */
	/*
	@RequestMapping(value="/user/selectUser")
	 public String selectUser(Integer pageIndex,
			 @ModelAttribute User user,
			 Model model){
		System.out.println("user = " + user);
		PageModel pageModel = new PageModel();
		if(pageIndex != null){
			pageModel.setPageIndex(pageIndex);
		}
		*/
		/** 查询用户信息     */
		/*
		List<User> users = hrmService.findUser(user, pageModel);
		model.addAttribute("users", users);
		model.addAttribute("pageModel", pageModel);
		return "user/user";
		
	}
	*/
	/**
	 * 处理删除开发者用户请求
	 * @param String ids 需要删除的id字符串
	 * @param ModelAndView mv
	 * */
	@RequestMapping(value="/user/removeUser")
	 public ModelAndView removeDeveloperUser(String ids,ModelAndView mv){
		// 分解id字符串
		String[] idArray = ids.split(",");
		for(String id : idArray){
			// 根据id删除开发者用户
			developerService.removeDeveloperUserById(Integer.parseInt(id));
		}
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/user/selectUser");
		// 返回ModelAndView
		return mv;
	}
	
	
	/**
	 * 处理修改用户请求
	 * @param String flag 标记， 1表示跳转到修改页面，2表示执行修改操作
	 * @param User user  要修改用户的对象
	 * @param ModelAndView mv
	 * */
	/*
	@RequestMapping(value="/user/updateUser")
	 public ModelAndView updateUser(
			 String flag,
			 @ModelAttribute User user,
			 ModelAndView mv){
		if(flag.equals("1")){
			// 根据id查询用户
			User target = hrmService.findUserById(user.getId());
			// 设置Model数据
			mv.addObject("user", target);
			// 返回修改员工页面
			mv.setViewName("user/showUpdateUser");
		}else{
			// 执行修改操作
			hrmService.modifyUser(user);
			// 设置客户端跳转到查询请求
			mv.setViewName("redirect:/user/selectUser");
		}
		// 返回
		return mv;
	}
	*/
	
	/**
	 * 处理添加请求
	 * @param String flag 标记， 1表示跳转到添加页面，2表示执行添加操作
	 * @param User user  要添加用户的对象
	 * @param ModelAndView mv
	 * */
	/*
	@RequestMapping(value="/user/addUser")
	 public ModelAndView addUser(
			 String flag,
			 @ModelAttribute User user,
			 ModelAndView mv){
		if(flag.equals("1")){
			// 设置跳转到添加页面
			mv.setViewName("user/showAddUser");
		}else{
			// 执行添加操作
			hrmService.addUser(user);
			// 设置客户端跳转到查询请求
			mv.setViewName("redirect:/user/selectUser");
		}
		// 返回
		return mv;
	}
	*/
	/**
	 * 开发者用户注册
	 * @param DeveloperUser developerUser  要注册的开发者用户对象
	 * @param ModelAndView mv
	 * */
	@RequestMapping(value="/developer/doRegister")
	 public ModelAndView registerDeveloperUser(
			 @ModelAttribute DeveloperUser developerUser,
			 @RequestParam("captcha") String captcha,
			 HttpSession session,
			 Model model,
			 ModelAndView mv){
			// 执行添加操作
			developerService.addDeveloperUser(developerUser);
			// 设置客户端跳转到查询请求
			// 将用户保存到HttpSession当中
			DeveloperUser user = developerService.login(developerUser.getLoginName(), developerUser.getLoginPwd());
			session.setAttribute(DeveloperConstants.DEVELOPER_SESSION, user);
			// 设置Model数据
			//model.addAttribute("developerUser", developerUser);
			// 客户端跳转到main页面
			mv.setViewName("redirect:/main");
		//	return "main"

		   // 返回
		   return mv;
	}
	
	/**
	 * 开发者用户认证
	 * @param DeveloperUser developerUser  要注册的开发者用户对象
	 * @param ModelAndView mv
	 * */
	@RequestMapping(value="/developer/doCertification")
	 public ModelAndView addDeveloperDatum(
			 @ModelAttribute DeveloperDatum developerDatum,
			 HttpSession session,
			 ModelAndView mv){
			// 执行添加操作
		   DeveloperUser user = (DeveloperUser)session.getAttribute(DeveloperConstants.DEVELOPER_SESSION);
		//   System.out.println("userId:" + user.getId());
		   Integer datumId = developerDatum.getId();
		   if (datumId == null || datumId < 1) {
			   developerDatum.setDeveloperUser(user);
			   developerService.addDeveloperDatum(developerDatum);
		   } else {
			   developerDatum.setDeveloperUser(user);
			   developerService.modifyDeveloperDatum(developerDatum);
		   }
		//	developerService.addDeveloperUser(developerUser);
			// 设置客户端跳转到查询请求
			// 将用户保存到HttpSession当中
		
			// 设置Model数据
			//model.addAttribute("developerUser", developerUser);
			// 客户端跳转到main页面
		//	mv.setViewName("redirect:/home");
		   mv.setViewName("redirect:/developer/doDeveloperLevel");
			
		//	return "main"

		   // 返回
		   return mv;
	}
	
	/**
	 * 开发者用户注册
	 * @param DeveloperUser developerUser  要注册的开发者用户对象
	 * @param ModelAndView mv
	 * */
	@RequestMapping(value="/developer/certification")
	 public String developerCertification(
			 HttpSession session,
			 Model model
			 ){
			// 执行添加操作
		   DeveloperUser user = (DeveloperUser)session.getAttribute(DeveloperConstants.DEVELOPER_SESSION);
		  DeveloperDatum datum = developerService.findDeveloperDatumByUser(user);
		  model.addAttribute("datum", datum);
		  
		//	developerService.addDeveloperUser(developerUser);
			// 设置客户端跳转到查询请求
			// 将用户保存到HttpSession当中
		
			// 设置Model数据
			//model.addAttribute("developerUser", developerUser);
			// 客户端跳转到main页面
			//mv.setViewName("redirect:/main");
		//	return "main"

		   // 返回
			return "developer/certificationForm";
	}
	
	
	/**
	 * 开发者用户注册
	 * @param DeveloperUser developerUser  要注册的开发者用户对象
	 * @param ModelAndView mv
	 * */
	@RequestMapping(value="/developer/doDeveloperLevel")
	 public String doDeveloperLevel(
			 HttpSession session,
			 Model model
			 ){
			// 执行添加操作
		  DeveloperUser user = (DeveloperUser)session.getAttribute(DeveloperConstants.DEVELOPER_SESSION);
		  DeveloperDatum datum = developerService.findDeveloperDatumByUser(user);
		  model.addAttribute("datum", datum);
		  
		//	developerService.addDeveloperUser(developerUser);
			// 设置客户端跳转到查询请求
			// 将用户保存到HttpSession当中
		
			// 设置Model数据
			//model.addAttribute("developerUser", developerUser);
			// 客户端跳转到main页面
			//mv.setViewName("redirect:/main");
		//	return "main"

		   // 返回
			return "developer/developerLevel";
	}
	
	 /**
		@RequestMapping(value="/user/selectUser")
		 public String selectUser(Integer pageIndex,
				 @ModelAttribute User user,
				 Model model){
			System.out.println("user = " + user);
			PageModel pageModel = new PageModel();
			if(pageIndex != null){
				pageModel.setPageIndex(pageIndex);
			}
			*/
			/** 查询用户信息     */
	/*
			List<User> users = hrmService.findUser(user, pageModel);
			model.addAttribute("users", users);
			model.addAttribute("pageModel", pageModel);
			return "user/user";
			
		}
		*/
	
	/**
	 * 处理查询请求
	 * @param pageIndex 请求的是第几页
	 * @param employee 模糊查询参数
	 * @param Model model
	 * */
	@RequestMapping(value="/home")
	 public String getDeveloperApplication(  //Integer pageIndex,
			 HttpSession session,
			 Model model){
		/*
		PageModel pageModel = new PageModel();
		if(pageIndex != null){
			pageModel.setPageIndex(pageIndex);
		}
		*/
		/** 查询用户信息     */
		 DeveloperUser user = (DeveloperUser)session.getAttribute(DeveloperConstants.DEVELOPER_SESSION);
		  developerService.findDeveloperModuleByUser(user);
		  List<DeveloperModule> modules = 
				developerService.findDeveloperModuleByUser(user);
		  model.addAttribute("modules", modules);
		  model.addAttribute("loginName", user.getLoginName());
	
		 return "main";
		
	}
	
	
	
	
	
}

