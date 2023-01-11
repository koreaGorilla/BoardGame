package kr.cart.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import kr.cart.dao.CartDAO;
import kr.controller.Action;

public class DeleteCartAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> mapAjax = new HashMap<String, String>();
		HttpSession session = request.getSession();
		Integer mem_num = (Integer)session.getAttribute("mem_num");
		if(mem_num == null) {//�α����� ���� ���� ���
			mapAjax.put("result", "logout");
		}else {
			//���۵� ������ ���ڵ� ó��
			request.setCharacterEncoding("utf-8");
			
			CartDAO dao = CartDAO.getInstance();
			dao.deleteCart(Integer.parseInt(request.getParameter("cart_num")));
			mapAjax.put("result", "success");
		}
		
		//JSON ������ ����
		ObjectMapper mapper = new ObjectMapper();
		String ajaxData = mapper.writeValueAsString(mapAjax);
		
		request.setAttribute("ajaxData", ajaxData);
			
		return "/WEB-INF/views/common/ajax_view.jsp";
	}

}