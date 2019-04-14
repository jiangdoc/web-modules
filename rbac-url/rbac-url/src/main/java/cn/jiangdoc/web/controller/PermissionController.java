package cn.jiangdoc.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jiangdoc.entity.AJAXResult;
import cn.jiangdoc.pojo.SysPermission;
import cn.jiangdoc.service.PermissionService;



@Controller
@RequestMapping("/permission")
public class PermissionController {

	@Autowired
	private PermissionService permissionService;

	@ResponseBody
	@RequestMapping("/delete")
	public Object delete( SysPermission permission ) {
		AJAXResult result = new AJAXResult();
		
		try {
			permissionService.deletePermission(permission);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public Object update( SysPermission permission ) {
		AJAXResult result = new AJAXResult();
		
		try {
			permissionService.updatePermission(permission);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/insert")
	public Object insert( SysPermission permission ) {
		AJAXResult result = new AJAXResult();
		
		try {
			permissionService.insertPermission(permission);
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}

	@RequestMapping("/add")
	public String add() {
		return "permission/add";
	}
	
	@RequestMapping("/edit")
	public String edit( String id, Model model ) {
		
		SysPermission permission = permissionService.queryById(id);
		model.addAttribute("permission", permission);
		return "permission/edit";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "permission/index";
	}
	
	
	@ResponseBody
	@RequestMapping("/loadAssignData")
	public Object loadAssignData( String roleid ) {
		List<SysPermission> permissions = new ArrayList<SysPermission>();
		List<SysPermission> ps = permissionService.queryAll();
		
		// 获取当前角色已经分配的许可信息
		List<String> permissionids = permissionService.queryPermissionidsByRoleid(roleid);
		
		Map<String, SysPermission> permissionMap = new HashMap<String, SysPermission>();
		for (SysPermission p : ps) {
			if ( permissionids.contains(p.getId()) ) {
				p.setChecked(true);
			} else {
				p.setChecked(false);
			}
			permissionMap.put(p.getId(), p);
		}
		for ( SysPermission p : ps ) {
			SysPermission child = p;
			if ( child.getParentid().equals("0") ) {
				permissions.add(p);
			} else {
				SysPermission parent = permissionMap.get(child.getParentid());
				parent.getChildren().add(child);
			}
		}
		
		return permissions;
	}
	
	@ResponseBody
	@RequestMapping("/loadData")
	public Object loadData() {
		List<SysPermission> permissions = new ArrayList<SysPermission>();
		// 查询所有的许可数据
		List<SysPermission> ps = permissionService.queryAll();
		Map<String, SysPermission> permissionMap = new HashMap<String, SysPermission>();
		for (SysPermission p : ps) {
			permissionMap.put(p.getId(), p);
		}
		for ( SysPermission p : ps ) {
			SysPermission child = p;
			if ( child.getParentid() .equals("0") ) {
				permissions.add(p);
			} else {
				SysPermission parent = permissionMap.get(child.getParentid());
				parent.getChildren().add(child);
			}
		}
		
		return permissions;
	}
	
	
}
