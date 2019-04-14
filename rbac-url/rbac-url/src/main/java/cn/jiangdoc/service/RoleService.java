package cn.jiangdoc.service;

import java.util.List;
import java.util.Map;

import cn.jiangdoc.pojo.SysRole;



public interface RoleService {
	List<SysRole> pageQueryData(Map<String, Object> map);

	int pageQueryCount(Map<String, Object> map);

	List<SysRole> queryAll();

	void insertRolePermission( String roleid, String[] permissionids);

	SysRole queryById(String id);

	void update(SysRole role);

	void insert(SysRole role);
	
	void delete(String id);
	
	void deletes(String[] ids);


}
