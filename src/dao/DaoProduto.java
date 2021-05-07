package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanCategoria;
import beans.BeanProduto;
import connection.SingleConnection;

/*
 * Classe DaoProduto
 * Classe Que Prov� os M�todos e Valida��es Para Manipular Dados, e Acesso e Manipula��o do BD
 */
public class DaoProduto {

	private Connection connection;
		
		/*
		 * Construtor DaoProduto()
		 * Recebe um Objeto connection da Classe SingleConnection
		 */
		public DaoProduto() {
			connection = SingleConnection.getConnection();
		}
		
		/*
		 * M�todo salvar()
		 * Respons�vel Por Fazer a Inser��o de Dados (INSERT) no BD
		 * @param BeanProduto produto = Objeto Produto da Classe BeanProduto
		 */
		public void salvar(BeanProduto produto) {
			try {
				String sql = "INSERT INTO produto(nome, quantidade, valor, categoria_id) VALUES(?, ?, ?, ?)";
				PreparedStatement insert = connection.prepareStatement(sql);
				insert.setString(1, produto.getNome());
				insert.setInt(2, produto.getQuantidade());
				insert.setDouble(3, produto.getValor());
				insert.setLong(4, produto.getCategoria_id());
				insert.execute();
				connection.commit();
			} catch(Exception e) {
				e.printStackTrace();
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		
		/*
		 * M�todo listar()
		 * Respons�vel Por Listar Todos os Produtos do Sistema
		 */
		public List<BeanProduto> listar() throws Exception {
			List<BeanProduto> listar = new ArrayList<BeanProduto>();
			String sql = "SELECT * FROM produto";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
				while(resultSet.next()) {
					BeanProduto produto = new BeanProduto();
					produto.setId(resultSet.getLong("id"));
					produto.setNome(resultSet.getString("nome"));
					produto.setQuantidade(resultSet.getInt("quantidade"));
					produto.setValor(resultSet.getDouble("valor"));
					produto.setCategoria_id(resultSet.getLong("categoria_id"));
					listar.add(produto);
				}
				return listar;
		}
		
		public List<BeanCategoria> listaCategorias() throws Exception {
			List<BeanCategoria> listar = new ArrayList<BeanCategoria>();
			String sql = "SELECT * FROM categoria";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
				while(resultSet.next()) {
					BeanCategoria categoria = new BeanCategoria();
					categoria.setId(resultSet.getLong("id"));
					categoria.setNome(resultSet.getString("nome"));
					listar.add(categoria);
				}				
				return listar;
		}
		
		/*
		 * M�todo delete()
		 * Respons�vel Por Fazer a Exclus�o (Delete) no BD
		 * @param String id = Atributo ID do Produto
		 */
		public void delete(String id) {
			try {
				String sql = "DELETE FROM produto WHERE id = '"+ id +"'";
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.execute();
				connection.commit();
			} catch (SQLException e) {
				e.printStackTrace();
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		
		/*
		 * M�todo consultar()
		 * Respons�vel Por Fazer Consultas (SELECT) no BD
		 * @param String id = Atributo ID do Produto
		 */
		public BeanProduto consultar(String id) throws Exception {
			String sql = "SELECT * FROM produto WHERE id = '"+ id +"'";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
				if(resultSet.next()) {
					BeanProduto produto = new BeanProduto();
					produto.setId(resultSet.getLong("id"));
					produto.setNome(resultSet.getString("nome"));
					produto.setQuantidade(resultSet.getInt("quantidade"));
					produto.setValor(resultSet.getDouble("valor"));
					produto.setCategoria_id(resultSet.getLong("categoria_id"));
					return produto;
				}
			return null;
		}
		
		/*
		 * M�todo validarNome()
		 * Respons�vel Por Validar o Nome (N�o Pode Existir 1 Mesmo Nome Para 2 Produtos Diferentes)
		 * @param String nome = Atributo Nome do Produto
		 */
		public boolean validarNome(String nome) throws Exception {
			String sql = "SELECT COUNT(1) as qtde FROM produto WHERE nome = '"+ nome +"'";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
				if(resultSet.next()) {
					return resultSet.getInt("qtde") <= 0;
				}
			return false;
		}
		
		/*
		 * M�todo atualizar()
		 * M�todo Respons�vel Por Atualizar os Dados (UPDATE) no BD
		 * @param BeanProduto produto = Objeto Produto da Classe BeanProduto
		 */
		public void atualizar(BeanProduto produto) {
			try {
				String sql = "UPDATE produto SET nome = ?, quantidade = ?, valor = ?, categoria_id = ? WHERE id = "+ produto.getId();
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, produto.getNome());
				preparedStatement.setInt(2, produto.getQuantidade());
				preparedStatement.setDouble(3, produto.getValor());
				preparedStatement.setLong(4, produto.getCategoria_id());
				preparedStatement.executeUpdate();
				connection.commit();
			} catch(Exception e) {
				e.printStackTrace();
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
}

