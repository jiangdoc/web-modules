package cn.jiangdoc.web.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jiangdoc.entity.AJAXResult;
import cn.jiangdoc.entity.Result;
import cn.jiangdoc.pojo.SysPermission;
import cn.jiangdoc.pojo.SysUser;
import cn.jiangdoc.service.PermissionService;
import cn.jiangdoc.service.UserService;

@Controller
public class DispatcherController {

	@Autowired
	private UserService userService;
	@Autowired
	private PermissionService permissionService;
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/error")
	public String error() {
		return "error";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		//session.removeAttribute("loginUser");
		session.invalidate();
		return "redirect:login";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@ResponseBody
	@RequestMapping("/doAJAXLogin")
	public Result doAJAXLogin(SysUser user,String vCode,HttpServletRequest request ) {
		HttpSession session = request.getSession();
		//真实验证码
		String _code = (String)session.getAttribute("_code");
		if(!_code.equals(vCode.toLowerCase())) {
			return new Result(false,"验证码不正确,请重新输入");
		}
		SysUser dbUser = userService.query4Login(user);
		if ( dbUser != null ) {
			session.setAttribute("loginUser", dbUser);
			
			// 获取用户权限信息
			List<SysPermission> permissions = permissionService.queryPermissionsByUser(dbUser);
			Map<String, SysPermission> permissionMap = new HashMap<String, SysPermission>();
			SysPermission root = null;
			Set<String> uriSet = new HashSet<String>();
			for ( SysPermission permission : permissions ) {
				permissionMap.put(permission.getId(), permission);
				if ( permission.getUrl() != null && !"".equals(permission.getUrl()) ) {
					uriSet.add(session.getServletContext().getContextPath() + permission.getUrl());
				}
			}
			session.setAttribute("authUriSet", uriSet);
			for ( SysPermission permission : permissions ) {
				SysPermission child = permission;
				if ( child.getParentid().equals("0") ) {
					root = permission;
				} else {
					SysPermission parent = permissionMap.get(child.getParentid());
					parent.getChildren().add(child);
				}
			}
			session.setAttribute("rootPermission", root);
			return new Result(true,"登陆成功！");
		} else {
			return new Result(false,"登陆失败！");
		}
	}
	
	
}
