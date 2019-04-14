package cn.jiangdoc.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jiangdoc.mapper.SysRoleMapper;
import cn.jiangdoc.mapper.SysRolePermissionMapper;
import cn.jiangdoc.pojo.SysRole;
import cn.jiangdoc.pojo.SysRolePermission;
import cn.jiangdoc.pojo.SysUser;
import cn.jiangdoc.service.RoleService;


@Transactional
@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private SysRoleMapper roleMapper;
	@Autowired
	private SysRolePermissionMapper rolePermissionMapper;
	

	public List<SysRole> pageQueryData(Map<String, Object> map) {
		
		return roleMapper.pageQueryData(map);
	}

	public int pageQueryCount(Map<String, Object> map) {
		
		return  roleMapper.pageQueryCount(map);
	}

	public List<SysRole> queryAll() {
		return roleMapper.selectByExample(null);
	}

	public void insertRolePermission( String roleid, String[] permissionids) {
		SysRolePermission rp = new SysRolePermission();
		rp.setSysRoleId(roleid);
		for(String pid:permissionids) {
			rp.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			rp.setSysPermissionId(pid);
			rolePermissionMapper.insertSelective(rp);
		}
		
	}

	public SysRole queryById(String id) {
		
		return roleMapper.selectByPrimaryKey(id);
	}

	public void update(SysRole role) {
		roleMapper.updateByPrimaryKeySelective(role);
	}

	public void insert(SysRole role) {
		role.setId(new Date().getTime()+"");
		roleMapper.insertSelective(role);
	}

	public void delete(String id) {
		roleMapper.deleteByPrimaryKey(id);
	}

	public void deletes(String[] ids) {
		for(String id:ids) {
			delete(id);
		}
	}
	
	


	

}
