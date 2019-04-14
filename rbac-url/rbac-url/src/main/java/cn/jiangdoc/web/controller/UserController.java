package cn.jiangdoc.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jiangdoc.entity.AJAXResult;
import cn.jiangdoc.entity.Page;
import cn.jiangdoc.pojo.SysRole;
import cn.jiangdoc.pojo.SysUser;
import cn.jiangdoc.service.RoleService;
import cn.jiangdoc.service.UserService;



@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	@ResponseBody
	@RequestMapping("/deletes")
	public Object deletes( String[] userid ) {
		AJAXResult result = new AJAXResult();
		
		try {
			
			userService.deleteUsers(userid);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Object delete( String id ) {
		AJAXResult result = new AJAXResult();
		
		try {
			
			userService.deleteUserById(id);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public Object update( SysUser user ) {
		AJAXResult result = new AJAXResult();
		
		try {
			
			userService.updateUser(user);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@RequestMapping("/edit")
	public String edit( String id, Model model ) {
		
		SysUser user = userService.queryById(id);
		model.addAttribute("user", user);
		
		return "user/edit";
	}
	
	@RequestMapping("/assign")
	public String assign( String id, Model model ) {
		
		SysUser user = userService.queryById(id);
		model.addAttribute("user", user);
		
		List<SysRole> roles = roleService.queryAll();
		
		List<SysRole> assingedRoles = new ArrayList<SysRole>();
		List<SysRole> unassignRoles = new ArrayList<SysRole>();
		
		// 获取关系表的数据
		List<String> roleids = userService.queryRoleidsByUserid(id);
		for ( SysRole role : roles ) {
			if ( roleids.contains(role.getId()) ) {
				assingedRoles.add(role);
			} else {
				unassignRoles.add(role);
			}
		}
		
		model.addAttribute("assingedRoles", assingedRoles);
		model.addAttribute("unassignRoles", unassignRoles);
		
		return "user/assign";
	}
	
	
	@ResponseBody
	@RequestMapping("/doAssign")
	public Object doAssign( String userid, String[] unassignroleids ) {
		AJAXResult result = new AJAXResult();
		
		try {
			// 增加关系表数据
			userService.insertUserRoles(userid,unassignroleids);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/dounAssign")
	public Object dounAssign( String userid, String[] assignroleids ) {
		AJAXResult result = new AJAXResult();
		
		try {
			// 删除关系表数据
			userService.deleteUserRoles(userid,assignroleids);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/insert")
	public Object insert( SysUser user ) {
		AJAXResult result = new AJAXResult();
		try {
			long time = new Date().getTime();
			String id = time+"";
			user.setId(id);
//			user.setCreatetime(sdf.format(new Date()));
//			user.setUserpswd("123456");
			userService.insertUser(user);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@RequestMapping("/add")
	public String add() {
		return "user/add";
	}
	
	@ResponseBody
	@RequestMapping("/pageQuery")
	public Object pageQuery( String queryText, Integer pageno, Integer pagesize ) {
		
		AJAXResult result = new AJAXResult();
		
		try {
			
			// 分页查询
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", (pageno-1)*pagesize);
			map.put("size", pagesize);
			map.put("queryText", queryText);
			
			List<SysUser> users = userService.pageQueryData( map );
			// 当前页码			
			// 总的数据条数
			int totalsize = userService.pageQueryCount( map );
			// 最大页码（总页码）
			int totalno = 0;
			if ( totalsize % pagesize == 0 ) {
				totalno = totalsize / pagesize;
			} else {
				totalno = totalsize / pagesize + 1;
			}
			
			// 分页对象
			Page<SysUser> userPage = new Page<SysUser>();
			userPage.setDatas(users);
			userPage.setTotalno(totalno);
			userPage.setTotalsize(totalsize);
			userPage.setPageno(pageno);
			
			result.setData(userPage);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
		
	}
	
	@RequestMapping("/index")
	public String index() {
		return "user/index";
	}
	
}
