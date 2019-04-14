package cn.jiangdoc.service;

import java.util.List;
import java.util.Map;

import cn.jiangdoc.pojo.SysUser;


public interface UserService {

	List<SysUser> queryAll();

	SysUser query4Login(SysUser user);

	List<SysUser> pageQueryData(Map<String, Object> map);

	int pageQueryCount(Map<String, Object> map);

	void insertUser(SysUser user);

	SysUser queryById(String id);

	void updateUser(SysUser user);

	void deleteUserById(String id);

	void deleteUsers(String[] userid);

	void deleteUserRoles(String userid, String[] assignroleids);

	void insertUserRoles( String userid, String[] unassignroleids);

	List<String> queryRoleidsByUserid(String id);

}
