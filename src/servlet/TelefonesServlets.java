package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanCursoJsp;
import beans.Telefones;
import dao.DaoTelefones;
import dao.DaoUsuario;

@WebServlet("/salvarTelefones")
public class TelefonesServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DaoUsuario daoUsuario = new DaoUsuario();
	
	private DaoTelefones daoTelefones = new DaoTelefones();
       
    public TelefonesServlets() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String acao = request.getParameter("acao");
			String id = request.getParameter("id");
			
			if(id != null) {
				if(acao.equals("addFone")) {				
					
					BeanCursoJsp usuario = daoUsuario.consultar(id);
					
					//Atributos da sess?o
					request.getSession().setAttribute("userEscolhido", usuario);
					
					RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
					request.setAttribute("telefones", daoTelefones.listar(usuario.getId()));
					view.forward(request, response);
					
				}else if(acao.equals("deleteFone")){
					String foneId= request.getParameter("id");
					
					daoTelefones.delete(foneId);
					
					BeanCursoJsp beanCursoJsp = (BeanCursoJsp) request.getSession().getAttribute("userEscolhido");
					
					RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
					request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
					request.setAttribute("msg", "Removido com sucesso!");
					view.forward(request, response);
				}
				
			}else {
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
			}		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			BeanCursoJsp beanCursoJsp = (BeanCursoJsp) request.getSession().getAttribute("userEscolhido");
			
			String numero = request.getParameter("numero");
			String tipo = request.getParameter("tipo");
			
			if(numero == null || (numero != null && numero.isEmpty())) {
				//Atributos da sess?o
				request.getSession().setAttribute("userEscolhido", beanCursoJsp);
				
				RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
				request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
				request.setAttribute("msg", "Informe o n?mero do telefone!");
				view.forward(request, response);
				
			}else {
				Telefones telefones = new Telefones();
				telefones.setNumero(numero);
				telefones.setTipo(tipo);
				telefones.setUsuario(beanCursoJsp.getId());
				
				daoTelefones.salvar(telefones);
				
				//Atributos da sess?o
				request.getSession().setAttribute("userEscolhido", beanCursoJsp);
				
				RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
				request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
				request.setAttribute("msg", "Salvo com sucesso!");
				view.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
