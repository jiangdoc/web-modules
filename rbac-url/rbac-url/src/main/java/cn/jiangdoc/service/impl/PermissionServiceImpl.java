package cn.jiangdoc.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jiangdoc.mapper.SysPermissionMapper;
import cn.jiangdoc.mapper.SysRolePermissionMapper;
import cn.jiangdoc.mapper.SysUserRoleMapper;
import cn.jiangdoc.pojo.SysPermission;
import cn.jiangdoc.pojo.SysRolePermission;
import cn.jiangdoc.pojo.SysRolePermissionExample;
import cn.jiangdoc.pojo.SysRolePermissionExample.Criteria;
import cn.jiangdoc.pojo.SysUser;
import cn.jiangdoc.pojo.SysUserRole;
import cn.jiangdoc.pojo.SysUserRoleExample;
import cn.jiangdoc.service.PermissionService;

@Transactional
@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private SysPermissionMapper permissionMapper;
	@Autowired
	private SysRolePermissionMapper rolePermissionMapper;

	public SysPermission queryRootPermission() {
		
		return null;
	}

	public List<SysPermission> queryChildPermissions(String pid) {
		
		return null;
	}

	public List<SysPermission> queryAll() {
		
		return permissionMapper.selectByExample(null);
	}

	public void insertPermission(SysPermission permission) {
		permission.setId(new Date().getTime()+"");
		
		permissionMapper.insertSelective(permission);
		
	}

	public SysPermission queryById(String id) {
		
		return permissionMapper.selectByPrimaryKey(id);
	}

	public void updatePermission(SysPermission permission) {
		permissionMapper.updateByPrimaryKeySelective(permission);
	}

	public void deletePermission(SysPermission permission) {
		permissionMapper.deleteByPrimaryKey(permission.getId());
	}

	public List<String> queryPermissionidsByRoleid(String roleid) {
		SysRolePermissionExample example = new SysRolePermissionExample();
		Criteria criteria = example.createCriteria();
		criteria.andSysRoleIdEqualTo(roleid);
		List<SysRolePermission> selectByExample = rolePermissionMapper.selectByExample(example);
		List<String> list = new ArrayList<String>();
		for(SysRolePermission rp:selectByExample) {
			list.add(rp.getSysPermissionId());
		}
		return list;
	}

	public List<SysPermission> queryPermissionsByUser(SysUser user) {
		//通过用户查找权限许可
		
		return permissionMapper.queryPermissionsByUser(user.getId());
	}
	

	
}
