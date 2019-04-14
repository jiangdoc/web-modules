package cn.jiangdoc.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jiangdoc.mapper.SysUserMapper;
import cn.jiangdoc.mapper.SysUserRoleMapper;
import cn.jiangdoc.pojo.SysUser;
import cn.jiangdoc.pojo.SysUserExample;
import cn.jiangdoc.pojo.SysUserRole;
import cn.jiangdoc.pojo.SysUserRoleExample;
import cn.jiangdoc.pojo.SysUserRoleExample.Criteria;
import cn.jiangdoc.service.UserService;

@Transactional
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private SysUserMapper userMapper;
	
	@Autowired
	private SysUserRoleMapper userRoleMapper;
	
	

	public List<SysUser> queryAll() {
		
		return userMapper.selectByExample(null);
	}

	public SysUser query4Login(SysUser user) {
		SysUserExample example = new SysUserExample();
		cn.jiangdoc.pojo.SysUserExample.Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername());
		criteria.andPasswordEqualTo(user.getPassword());
		List<SysUser> list = userMapper.selectByExample(example);
		if(list.size()==1) {
			return list.get(0);
		}
		return null;
	}

	public List<SysUser> pageQueryData(Map<String, Object> map) {
		
		return userMapper.pageQueryData(map);
	}

	public int pageQueryCount(Map<String, Object> map) {
		return userMapper.pageQueryCount(map);
	}

	public void insertUser(SysUser user) {
		userMapper.insertSelective(user);
	}

	public SysUser queryById(String id) {
		
		return userMapper.selectByPrimaryKey(id);
	}

	public void updateUser(SysUser user) {
	userMapper.updateByPrimaryKeySelective(user);
	}

	public void deleteUserById(String id) {
		userMapper.deleteByPrimaryKey(id);
	}

	public void deleteUsers(String[] userids) {
		for(String id: userids) {
			deleteUserById(id);
		}
		
	}

	public void deleteUserRoles(String userid, String[] assignroleids) {
		
		SysUserRoleExample example = new SysUserRoleExample();
		Criteria criteria = example.createCriteria();
		criteria.andSysUserIdEqualTo(userid);
		List<String> roleids  = new ArrayList<String>();
		for(String id:assignroleids) {
			roleids.add(id);
		}
		criteria.andSysRoleIdIn(roleids);
		userRoleMapper.deleteByExample(example);
		
	}

	public void insertUserRoles( String userid, String[] unassignroleids) {
		SysUserRole ur = new SysUserRole();
		ur.setSysUserId(userid);
		for(String roleid: unassignroleids) {
			ur.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			ur.setSysRoleId(roleid);
			userRoleMapper.insertSelective(ur);
		}
		
	}

	public List<String> queryRoleidsByUserid(String id) {
		SysUserRoleExample example = new SysUserRoleExample();
		Criteria criteria = example.createCriteria();
		criteria.andSysUserIdEqualTo(id);
		List<SysUserRole> list = userRoleMapper.selectByExample(example);
		List<String> s= new ArrayList<String>();
		for(SysUserRole ur:list) {
			s.add(ur.getSysRoleId());
		}
		return s;
	}
	

	
}
