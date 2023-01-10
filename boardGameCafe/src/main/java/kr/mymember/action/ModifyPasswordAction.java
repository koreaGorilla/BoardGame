package kr.mymember.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mymember.dao.MemberDAO;
import kr.mymember.vo.MemberVO;

public class ModifyPasswordAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num==null) {//�α����� ���� ���� ���
			return "redirect:/mymember/loginForm.jsp";
		}
		
		//�α��� �� ���
		//���۵� ������ ���ڵ� ó��
		request.setCharacterEncoding("utf-8");
		//���۵� ������ ��ȯ
		//��������ȣ
		String origin_passwd = request.getParameter("origin_passwd");
		//����й�ȣ
		String passwd = request.getParameter("passwd");
		//���� �α��� �� ���̵�
		String user_id = (String)session.getAttribute("user_id");
				
		
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberVO member = dao.checkMember2(user_id);
		boolean check = false;
		//��й�ȣ ��ġ ���� üũ
		check = member.isCheckedPassword(origin_passwd);

		
		if(check) {//���� ����
			//��й�ȣ ����
			dao.updatePassword(passwd, user_num);
		}
		
		request.setAttribute("check", check);
		
		return "/WEB-INF/views/mymember/modifyPassword.jsp";
	}

}