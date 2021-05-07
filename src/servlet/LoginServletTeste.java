package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanServlet;

@WebServlet("/LoginServletTeste")
public class LoginServletTeste extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServletTeste() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BeanServlet beanServlet = new BeanServlet();
		
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		if(beanServlet.validarLoginSenha(login, senha)) {
			//Acesso Liberado
			RequestDispatcher dispatcher = request.getRequestDispatcher("acessoliberado.jsp");
			dispatcher.forward(request, response);
		}else {
			//Acesso Negado
			RequestDispatcher dispatcher = request.getRequestDispatcher("acessonegado.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
