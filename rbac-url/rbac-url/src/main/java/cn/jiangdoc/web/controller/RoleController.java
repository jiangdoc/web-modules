package cn.jiangdoc.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jiangdoc.entity.AJAXResult;
import cn.jiangdoc.entity.Page;
import cn.jiangdoc.pojo.SysRole;
import cn.jiangdoc.pojo.SysUser;
import cn.jiangdoc.service.RoleService;



@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/edit")
	public String edit( String id, Model model ) {
		SysRole role = roleService.queryById(id);
		model.addAttribute("role", role);
		
		return "role/edit";
	}
	
	@RequestMapping("/add")
	public String add() {
		return "role/add";
	}
	@ResponseBody
	@RequestMapping("/update")
	public Object update( SysRole role ) {
		AJAXResult result = new AJAXResult();
		try {
			roleService.update(role);
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
			roleService.delete(id);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	@ResponseBody
	@RequestMapping("/deletes")
	public Object deletes( String[] roleid ) {
		AJAXResult result = new AJAXResult();
		try {
			roleService.deletes(roleid);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/insert")
	public Object insert( SysRole role ) {
		AJAXResult result = new AJAXResult();
		try {
			roleService.insert(role);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
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
			
			List<SysRole> roles = roleService.pageQueryData( map );
			// 当前页码			
			// 总的数据条数
			int totalsize = roleService.pageQueryCount( map );
			// 最大页码（总页码）
			int totalno = 0;
			if ( totalsize % pagesize == 0 ) {
				totalno = totalsize / pagesize;
			} else {
				totalno = totalsize / pagesize + 1;
			}
			
			// 分页对象
			Page<SysRole> rolePage = new Page<SysRole>();
			rolePage.setDatas(roles);
			rolePage.setTotalno(totalno);
			rolePage.setTotalsize(totalsize);
			rolePage.setPageno(pageno);
			
			result.setData(rolePage);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
		
	}

	@ResponseBody
	@RequestMapping("/doAssign")
	public Object doAssign( String roleid, String[] permissionids ) {
		AJAXResult result = new AJAXResult();
		
		try {
			roleService.insertRolePermission(roleid,permissionids);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@RequestMapping("/assign")
	public String assign() {
		return "role/assign";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "role/index";
	}
}
