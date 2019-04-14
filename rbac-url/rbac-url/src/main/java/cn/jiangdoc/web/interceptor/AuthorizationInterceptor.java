package cn.jiangdoc.web.interceptor;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.jiangdoc.pojo.SysPermission;
import cn.jiangdoc.service.PermissionService;
/**
 * 授权拦截器：判断是否授权
 * @author jiangdoc
 *
 */
public class AuthorizationInterceptor implements HandlerInterceptor {
	@Autowired
	private PermissionService permissionService;

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//获取请求地址
		String uri = request.getRequestURI();
		String path = request.getServletContext().getContextPath();
		
		//判断当前路径是否需要进行权限验证
		// 查询所有需要验证的路径集合
				List<SysPermission> permissions = permissionService.queryAll();
				Set<String> uriSet = new HashSet<String>();
				for ( SysPermission permission : permissions ) {
					if ( permission.getUrl() != null && !"".equals(permission.getUrl()) ) {
						uriSet.add(path + permission.getUrl());
					}
				}
				//判断需要验证的权限中是否包含uri
				if ( uriSet.contains(uri) ) {
					// 权限验证
					// 判断当前用户是否拥有对应的权限
					Set<String> authUriSet = (Set<String>)request.getSession().getAttribute("authUriSet");
					if ( authUriSet.contains(uri) ) {
						return true;
					} else {
						response.sendRedirect(path + "/error");
						return false;
					}
				} else {
					return true;
				}
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	

}
