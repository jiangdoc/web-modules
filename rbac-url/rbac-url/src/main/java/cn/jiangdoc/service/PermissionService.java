package cn.jiangdoc.service;

import java.util.List;

import cn.jiangdoc.pojo.SysPermission;
import cn.jiangdoc.pojo.SysUser;



public interface PermissionService {

	SysPermission queryRootPermission();

	List<SysPermission> queryChildPermissions(String pid);

	List<SysPermission> queryAll();

	void insertPermission(SysPermission permission);

	SysPermission queryById(String id);

	void updatePermission(SysPermission permission);

	void deletePermission(SysPermission permission);

	List<String> queryPermissionidsByRoleid(String roleid);

	List<SysPermission> queryPermissionsByUser(SysUser user);

}
