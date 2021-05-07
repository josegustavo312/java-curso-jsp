package beans;

/*
 * Classe BeanProduto
 * Classe Que Provê o Modelo de Objeto
 */
public class BeanProduto {

	private Long id;
	private String nome;
	private int quantidade;
	private double valor;
	private Long categoria_id;
	
	public Long getId() {
		return this.id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getNome() {
		return this.nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}	
	
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	
	public double getValor() {
		return this.valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	
	public String getValorEmTexto() {
		return Double.toString(valor).replace('.', ',');
		
	}
	
	public Long getCategoria_id() {
		return categoria_id;
	}
	public void setCategoria_id(Long categoria_id) {
		this.categoria_id = categoria_id;
	}
	
}
