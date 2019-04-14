package cn.jiangdoc.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.jiangdoc.pojo.SysUser;

/**
 * 用户身份验证拦截器
 * @author jiangdoc
 *
 */
public class LoginInterceptor  implements HandlerInterceptor {
	/**
	 * 在控制器执行之前完成业务逻辑操作
	 * 方法的返回值决定逻辑是否继续执行， true，表示继续执行， false, 表示不再继续执行。
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//判断是否为登陆url,是：放行
		String uri = request.getRequestURI();
		if(uri.indexOf("/login") >= 0 || uri.indexOf("/doAJAXLogin") >=0) {
			return true;
		}
		//判断是否登陆
		SysUser user = (SysUser)request.getSession().getAttribute("loginUser");
		if(user == null) {
			String path = request.getServletContext().getContextPath();
			response.sendRedirect(path+"/login");
			return false;
		}
		return true;
	}
	/**
	 * 在控制器执行完毕之后执行的逻辑操作
	 */
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}
	

}
