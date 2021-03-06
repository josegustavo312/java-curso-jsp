package servlet;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.xml.bind.DatatypeConverter;
import javax.xml.datatype.DatatypeConstants;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.codec.binary.Base64;

import beans.BeanCursoJsp;
import dao.DaoTelefones;
import dao.DaoUsuario;

@WebServlet("/salvarUsuario")
@MultipartConfig //Anota??o para enviar arquivo e texto no formul?rio
public class Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DaoUsuario daoUsuario = new DaoUsuario();
	private DaoTelefones daoTelefones = new DaoTelefones();
       
    public Usuario() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao") != null ? request.getParameter("acao") : "listartodos";
			String id = request.getParameter("id");
			
			// Bot?o Delete
			if(acao!=null && acao.equalsIgnoreCase("delete") && id != null) {
				daoUsuario.delete(id);
				daoTelefones.deleteFoneUsuario(id);
				
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
				
			// Bot?o Editar
			}else if(acao!=null && acao.equalsIgnoreCase("editar")) {
				BeanCursoJsp beanCursoJsp = daoUsuario.consultar(id);
				
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("user", beanCursoJsp);
				view.forward(request, response);
			
			// Requisi??o da tela acessoliberado
			}else if(acao!=null && acao.equalsIgnoreCase("listartodos")) {
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
				
			// Download do arquivo	
			}else if(acao!=null && acao.equalsIgnoreCase("download")) {
				BeanCursoJsp usuario = daoUsuario.consultar(id);
				
				if(usuario != null) {
					String contentType = "";
					byte[] fileBytes = null;
					
					String tipo = request.getParameter("tipo");
					
					if(tipo.equalsIgnoreCase("imagem")) {
						contentType = usuario.getContentType();
						
						// Converte a base64 da imagem do banco para byte[]
						fileBytes = new Base64().decodeBase64(usuario.getFotoBase64());
						
					}else if(tipo.equalsIgnoreCase("curriculo")) {
						contentType = usuario.getContentTypeCurriculo();
						
						// Converte a base64 da imagem do banco para byte[]
						fileBytes = new Base64().decodeBase64(usuario.getCurriculoBase64());
						
					}
					
					response.setHeader("Content-Disposition", "attachment;filename=arquivo." + contentType.split("\\/")[1]);
										
					// Coloca os bytes em um objeto de entrada para processar
					InputStream is = new ByteArrayInputStream(fileBytes);
					
					// In?cio da resposta para o navegador
					int read=0;
					byte[] bytes = new byte[1024];
					OutputStream os = response.getOutputStream();
					
					while((read = is.read(bytes)) != -1) {
						os.write(bytes, 0, read);
					}
					
					os.flush();
					os.close();
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Bot?o salvar do formul?rio, tipo submit.		
		String acao = request.getParameter("acao");
		
		if(acao!=null && acao.equalsIgnoreCase("reset")) {
			try {
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else {
			
			String id = request.getParameter("id");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String nome = request.getParameter("nome");
			String cep = request.getParameter("cep");
			String rua = request.getParameter("rua");
			String bairro = request.getParameter("bairro");
			String cidade = request.getParameter("cidade");
			String estado = request.getParameter("estado");
			String ibge = request.getParameter("ibge");
			String sexo = request.getParameter("sexo");
			String perfil = request.getParameter("perfil");
						
			BeanCursoJsp usuario = new BeanCursoJsp();
			usuario.setId(id != null && !id.isEmpty()? Long.parseLong(id) : null);
			usuario.setLogin(login);
			usuario.setSenha(senha);
			usuario.setNome(nome);
			usuario.setCep(cep);
			usuario.setRua(rua);
			usuario.setBairro(bairro);
			usuario.setCidade(cidade);
			usuario.setEstado(estado);
			usuario.setIbge(ibge);
			usuario.setSexo(sexo);
			usuario.setPerfil(perfil);
			
			if(request.getParameter("ativo") != null && request.getParameter("ativo").equalsIgnoreCase("on")) {
				usuario.setAtivo(true);
			}else {
				usuario.setAtivo(false);
			}
			
			try {
				
				/*In?cio File upload de imagens e pdf*/				
				if(ServletFileUpload.isMultipartContent(request)) {
					//Processa Foto
					Part imagemFoto = request.getPart("foto");
					
					if(imagemFoto != null && imagemFoto.getInputStream().available() > 0) {
						
						String fotoBase64 = new Base64().encodeBase64String(converteStreamParaByte(imagemFoto.getInputStream())); 
						
						usuario.setFotoBase64(fotoBase64);
						usuario.setContentType(imagemFoto.getContentType());
						
						/*In?cio miniatura imagem*/
						
						//Transforma em um bufferedImage
						byte[] imageByteDecode = new Base64().decodeBase64(fotoBase64);
						BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(imageByteDecode));
						
						//Pega o tipo da imagem
						int type = bufferedImage.getType() == 0 ? bufferedImage.TYPE_INT_ARGB : bufferedImage.getType();
						
						//Cria a imagem em miniatura
						BufferedImage resizedImage = new BufferedImage(100, 100, type);
						Graphics2D g = resizedImage.createGraphics();
						g.drawImage(bufferedImage, 0, 0, 100, 100, null);
						g.dispose();
						
						//Escrever novamente a imagem em tamanho menor
						ByteArrayOutputStream baos = new ByteArrayOutputStream();
						ImageIO.write(resizedImage, "png", baos);						
						
						//Monta novamente a base64 completa da miniatura
						String miniaturaBase64 = "data:image/png;base64," + DatatypeConverter.printBase64Binary(baos.toByteArray());
						
						usuario.setFotoBase64Miniatura(miniaturaBase64);
						
						/*Fim miniatura imagem*/
						
					}else {
						usuario.setAtualizarImage(false);
						
					}
										
					//Processa Curr?culo
					Part curriculoPdf = request.getPart("curriculo");
					
					if(curriculoPdf != null && curriculoPdf.getInputStream().available() > 0) {
						String curriculoBase64 = new Base64().encodeBase64String(converteStreamParaByte(curriculoPdf.getInputStream())); 
						
						usuario.setCurriculoBase64(curriculoBase64);
						usuario.setContentTypeCurriculo(curriculoPdf.getContentType());
						
					}else {
						usuario.setAtualizarPdf(false);
						
					}
						
				}				
				/*Fim File upload de imagens e pdf*/
				
				boolean podeInserir = true;
				
				if (login==null || login.isEmpty()) {
					request.setAttribute("msg", "Login deve ser informado");
					podeInserir = false;
					
				}else if (senha==null || senha.isEmpty()) {
					request.setAttribute("msg", "Senha deve ser informada");
					podeInserir = false;					
					
				}else if (nome==null || nome.isEmpty()) {
					request.setAttribute("msg", "Nome deve ser informado");
					podeInserir = false;
						
				}else if (id == null || id.isEmpty() && !daoUsuario.validarLogin(login)) {
					request.setAttribute("msg", "Login existente!");
					podeInserir = false;
					
				}else if (id == null || id.isEmpty() && daoUsuario.validarLogin(login)) {
					daoUsuario.salvar(usuario);
					request.setAttribute("msg", "Salvo com sucesso!");
					
				}else if (id != null || !id.isEmpty()){
					if(!daoUsuario.validarLoginUpdate(login, id)) {
						request.setAttribute("msg", "Login existente!");
					}else {
						daoUsuario.atualizar(usuario);
						request.setAttribute("msg", "Atualizado com sucesso!");
					}
					
					
				}	
				
				// Caso o login seja existente
				if(!podeInserir) {
					// Carrega os dados preenchidos
					request.setAttribute("user", usuario); 
				}
			
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}			
		
		}
		
	}
	
	// Converte a entrada de fluxo de dados para byte[]
	private byte[] converteStreamParaByte(InputStream imagem) throws IOException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();		
		int reads = imagem.read();
		
		while (reads != -1) {
			baos.write(reads);
			reads = imagem.read();
		}
		
		return baos.toByteArray();
		
	}

}